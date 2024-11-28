<?php

namespace App\Http\Controllers;

use App\Models\Almacen;
use App\Models\Configuracion;
use App\Models\Ingreso;
use App\Models\Partida;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use PDF;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

class ReporteController extends Controller
{
    public $array_meses = [
        "01" => "ENERO",
        "02" => "FEBRERO",
        "03" => "MARZO",
        "04" => "ABRIL",
        "05" => "MAYO",
        "06" => "JUNIO",
        "07" => "JULIO",
        "08" => "AGOSTO",
        "09" => "SEPTIEMBRE",
        "10" => "OCTUBRE",
        "11" => "NOVIEMBRE",
        "12" => "DICIEMBRE",
    ];

    public $titulo = [
        'font' => [
            'bold' => true,
            'size' => 12,
            'family' => 'Times New Roman'
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
            ],
        ],
    ];

    public $textoBold = [
        'font' => [
            'bold' => true,
            'size' => 10,
        ],
    ];

    public $headerTabla = [
        'font' => [
            'bold' => true,
            'size' => 10,
            'color' => ['argb' => 'ffffff'],
        ],
        'alignment' => [
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
        'fill' => [
            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
            'color' => ['rgb' => '203764']
        ],
    ];

    public $bodyTabla = [
        'font' => [
            'size' => 10,
        ],
        'alignment' => [
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
    ];

    public $celdaCenter = [
        'alignment' => [
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
    ];

    public $footerTabla = [
        'font' => [
            'size' => 10,
            'bold' => true,
        ],
        'alignment' => [
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
    ];

    public function usuarios()
    {
        return Inertia::render("Reportes/Usuarios");
    }

    public function r_usuarios(Request $request)
    {
        $tipo =  $request->tipo;
        $role_id =  $request->role_id;
        $usuarios = User::where('id', '!=', 1);

        if ($tipo != 'todos') {
            $usuarios->where("tipo", $tipo);
        }

        if ($role_id != 'todos') {
            $usuarios->where("role_id", $role_id);
        }

        $usuarios = $usuarios->orderBy("paterno", "ASC")->get();

        $pdf = PDF::loadView('reportes.usuarios', compact('usuarios'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->stream('usuarios.pdf');
    }

    public function bimestral()
    {
        return Inertia::render("Reportes/Bimestral");
    }

    public function r_bimestral(Request $request)
    {
        $almacen_id = $request->almacen_id;
        $fecha_ini = $request->fecha_ini;
        $fecha_fin = $request->fecha_fin;
        $formato = $request->formato;
        $tipo = $request->tipo;

        $partidas = Partida::all();
        $almacens = Almacen::select("almacens.*");

        if ($almacen_id != 'todos') {
            $almacens->where("id", $almacen_id);
        }

        $texto_fecha = ReporteController::getFechaTexto($fecha_ini, $fecha_fin);

        $almacens = $almacens->get();

        if ($tipo == 'pdf') {
            $archivo = "reportes.bimestral_" . $formato;
            $orientacion = $formato == 'detalle' ? 'landscape' : 'portrait';

            $pdf = PDF::loadView($archivo, compact('partidas', 'almacens', 'fecha_ini', 'fecha_fin', 'texto_fecha'))->setPaper('letter', $orientacion);

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->stream('bimestral_detalle.pdf');
        } else {
            // EXCEL

            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Formularios')
                ->setSubject('Formularios')
                ->setDescription('Formularios')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;

            if ($formato == "detalle") {
                // DETALLE
                foreach ($almacens as $almacen) {
                    $sheet->setCellValue('A' . $fila, Configuracion::first()->razon_social);
                    $sheet->mergeCells("A" . $fila . ":N" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $sheet->setCellValue('A' . $fila, "SALDOS FÍSICOS VALORADOS DE EXISTENCIAS DE ALMACENES");
                    $sheet->mergeCells("A" . $fila . ":N" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $sheet->setCellValue('A' . $fila, $almacen->nombre);
                    $sheet->mergeCells("A" . $fila . ":N" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $sheet->setCellValue('A' . $fila, $texto_fecha);
                    $sheet->mergeCells("A" . $fila . ":N" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $fila++;
                    $fila++;
                    $sheet->setCellValue('A' . $fila, 'N°');
                    $sheet->mergeCells("A" . $fila . ":A" . $fila + 1);  //COMBINAR CELDAS
                    $sheet->setCellValue('B' . $fila, 'CÓDIGO');
                    $sheet->mergeCells("B" . $fila . ":B" . $fila + 1);  //COMBINAR CELDAS
                    $sheet->setCellValue('C' . $fila, 'UNIDAD');
                    $sheet->mergeCells("C" . $fila . ":C" . $fila + 1);  //COMBINAR CELDAS
                    $sheet->setCellValue('D' . $fila, 'DESCRIPCIÓN');
                    $sheet->mergeCells("D" . $fila . ":D" . $fila + 1);  //COMBINAR CELDAS
                    $sheet->setCellValue('E' . $fila, 'FECHA INGRESO');
                    $sheet->mergeCells("E" . $fila . ":E" . $fila + 1);  //COMBINAR CELDAS
                    $sheet->setCellValue('F' . $fila, 'INGRESO ALMACENES');
                    $sheet->mergeCells("F" . $fila . ":H" . $fila);  //COMBINAR CELDAS
                    $sheet->setCellValue('I' . $fila, 'SALIDA ALMACENES');
                    $sheet->mergeCells("I" . $fila . ":K" . $fila);  //COMBINAR CELDAS
                    $sheet->setCellValue('L' . $fila, 'SALDO AL' . date('d/m/Y', strtotime($fecha_fin)));
                    $sheet->mergeCells("L" . $fila . ":N" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->applyFromArray($this->headerTabla);
                    $fila++;
                    $sheet->setCellValue('F' . $fila, 'CANT.');
                    $sheet->setCellValue('G' . $fila, 'C/U');
                    $sheet->setCellValue('H' . $fila, 'TOTAL BS.');
                    $sheet->setCellValue('I' . $fila, 'CANT.');
                    $sheet->setCellValue('J' . $fila, 'C/U');
                    $sheet->setCellValue('K' . $fila, 'TOTAL BS.');
                    $sheet->setCellValue('L' . $fila, 'CANT.');
                    $sheet->setCellValue('M' . $fila, 'C/U');
                    $sheet->setCellValue('N' . $fila, 'TOTAL BS.');
                    $sheet->getStyle('F' . $fila . ':N' . $fila)->applyFromArray($this->headerTabla);
                    $fila++;
                    $total1 = 0;
                    $total2 = 0;
                    $total3 = 0;
                    $total4 = 0;
                    $total5 = 0;
                    $total6 = 0;
                    $cont = 1;
                    foreach ($partidas as $partida) {
                        $sheet->setCellValue('A' . $fila, $partida->nombre);
                        $sheet->mergeCells("A" . $fila . ":C" . $fila);  //COMBINAR CELDAS
                        $sheet->getStyle('A' . $fila . ':C' . $fila)->applyFromArray($this->bodyTabla);
                        $ingresos = Ingreso::where('donacion', 'SI');
                        $ingresos->where('almacen_id', $almacen->id);
                        if ($fecha_ini && $fecha_fin) {
                            $ingresos->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
                        }
                        $ingresos->where('partida_id', $partida->id);
                        $ingresos = $ingresos->get();
                        $fila++;
                        foreach ($ingresos as $ingreso) {
                            $sheet->setCellValue('A' . $fila, $cont++);
                            $sheet->setCellValue('B' . $fila, $ingreso->codigo);
                            $sheet->setCellValue('C' . $fila, $ingreso->unidad_medida->nombre);
                            $sheet->setCellValue('D' . $fila, $ingreso->producto->nombre);
                            $sheet->setCellValue('E' . $fila, $ingreso->fecha_ingreso_t);
                            $sheet->setCellValue('F' . $fila, $ingreso->cantidad);
                            $sheet->setCellValue('G' . $fila, $ingreso->costo);
                            $sheet->setCellValue('H' . $fila, $ingreso->total);
                            $sheet->setCellValue('I' . $fila, $ingreso->egreso->cantidad);
                            $sheet->setCellValue('J' . $fila, $ingreso->egreso->costo);
                            $sheet->setCellValue('K' . $fila, $ingreso->egreso->total);
                            $sheet->setCellValue('L' . $fila, $ingreso->egreso->s_cantidad);
                            $sheet->setCellValue('M' . $fila, $ingreso->costo);
                            $sheet->setCellValue('N' . $fila, $ingreso->egreso->s_total);
                            $sheet->getStyle('A' . $fila . ':N' . $fila)->applyFromArray($this->bodyTabla);
                            $sheet->getStyle('F' . $fila . ':N' . $fila)->applyFromArray($this->celdaCenter);

                            $total1 += (float) $ingreso->cantidad;
                            $total2 += (float) $ingreso->total;
                            $total3 += (float) $ingreso->egreso->cantidad;
                            $total4 += (float) $ingreso->egreso->total;
                            $total5 += (float) $ingreso->egreso->s_cantidad;
                            $total6 += (float) $ingreso->egreso->s_total;

                            $fila++;
                        }
                    }
                    $sheet->setCellValue('A' . $fila, 'TOTALES');
                    $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                    $sheet->setCellValue('F' . $fila, number_format($total1, 2, ".", ""));
                    $sheet->setCellValue('H' . $fila, number_format($total2, 2, ".", ""));
                    $sheet->setCellValue('I' . $fila, number_format($total3, 2, ".", ""));
                    $sheet->setCellValue('K' . $fila, number_format($total4, 2, ".", ""));
                    $sheet->setCellValue('L' . $fila, number_format($total5, 2, ".", ""));
                    $sheet->setCellValue('N' . $fila, number_format($total6, 2, ".", ""));
                    $sheet->getStyle('A' . $fila . ':N' . $fila)->applyFromArray($this->footerTabla);

                    $fila++;
                    $fila++;
                    $fila++;
                    $fila++;
                }

                $sheet->getColumnDimension('A')->setWidth(6);
                $sheet->getColumnDimension('B')->setWidth(20);
                $sheet->getColumnDimension('C')->setWidth(15);
                $sheet->getColumnDimension('D')->setWidth(15);
                $sheet->getColumnDimension('E')->setWidth(10);
                $sheet->getColumnDimension('F')->setWidth(25);
                $sheet->getColumnDimension('G')->setWidth(30);
                $sheet->getColumnDimension('H')->setWidth(10);
                $sheet->getColumnDimension('I')->setWidth(10);
                $sheet->getColumnDimension('J')->setWidth(25);
                $sheet->getColumnDimension('K')->setWidth(10);

                foreach (range('A', 'N') as $columnID) {
                    $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
                }

                $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
                $sheet->getPageMargins()->setTop(0.5);
                $sheet->getPageMargins()->setRight(0.1);
                $sheet->getPageMargins()->setLeft(0.1);
                $sheet->getPageMargins()->setBottom(0.1);
                $sheet->getPageSetup()->setPrintArea('A:N');
                $sheet->getPageSetup()->setFitToWidth(1);
                $sheet->getPageSetup()->setFitToHeight(0);
            } else {
                // RESUMEN
                foreach ($almacens as $almacen) {
                    $sheet->setCellValue('A' . $fila, Configuracion::first()->razon_social);
                    $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $sheet->setCellValue('A' . $fila, "SALDOS FÍSICOS VALORADOS DE EXISTENCIAS DE ALMACENES");
                    $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $sheet->setCellValue('A' . $fila, $almacen->nombre);
                    $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $sheet->setCellValue('A' . $fila, $texto_fecha);
                    $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->titulo);
                    $fila++;
                    $fila++;
                    $fila++;
                    $sheet->setCellValue('A' . $fila, 'PARTIDA');
                    $sheet->setCellValue('B' . $fila, 'DESCRIPCIÓN');
                    $sheet->setCellValue('C' . $fila, 'INGRESOS');
                    $sheet->setCellValue('D' . $fila, 'SALIDAS');
                    $sheet->setCellValue('E' . $fila, 'SALDOS');
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->headerTabla);
                    $fila++;
                    $total1 = 0;
                    $total2 = 0;
                    $total3 = 0;
                    $cont = 1;
                    foreach ($partidas as $partida) {
                        $ingresos = Ingreso::where('donacion', 'SI');
                        $ingresos->where('ingresos.almacen_id', $almacen->id);
                        if ($fecha_ini && $fecha_fin) {
                            $ingresos->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
                        }
                        $ingresos->where('ingresos.partida_id', $partida->id);
                        $ingresos = $ingresos->sum('total');

                        $egresos = Ingreso::where('donacion', 'SI')->join(
                            'egresos',
                            'egresos.ingreso_id',
                            '=',
                            'ingresos.id',
                        );
                        $egresos->where('egresos.almacen_id', $almacen->id);
                        if ($fecha_ini && $fecha_fin) {
                            $egresos->whereBetween('egresos.fecha_registro', [$fecha_ini, $fecha_fin]);
                        }
                        $egresos->where('egresos.partida_id', $partida->id);
                        $egresos = $egresos->sum('egresos.total');

                        $saldo = $ingresos - $egresos;



                        $sheet->setCellValue('A' . $fila, $partida->nro_partida);
                        $sheet->setCellValue('B' . $fila, $partida->nombre);
                        $sheet->setCellValue('C' . $fila, $ingresos);
                        $sheet->setCellValue('D' . $fila, $egresos);
                        $sheet->setCellValue('E' . $fila, $saldo);
                        $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->bodyTabla);
                        $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->celdaCenter);

                        $total1 += (float) $ingresos;
                        $total2 += (float) $egresos;
                        $total3 += (float) $saldo;

                        $fila++;
                    }
                    $sheet->setCellValue('A' . $fila, 'TOTALES');
                    $sheet->mergeCells("A" . $fila . ":B" . $fila);  //COMBINAR CELDAS
                    $sheet->setCellValue('C' . $fila, number_format($total1, 2, ".", ""));
                    $sheet->setCellValue('D' . $fila, number_format($total2, 2, ".", ""));
                    $sheet->setCellValue('E' . $fila, number_format($total3, 2, ".", ""));
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($this->footerTabla);

                    $fila++;
                    $fila++;
                    $fila++;
                    $fila++;
                }

                $sheet->getColumnDimension('A')->setWidth(15);
                $sheet->getColumnDimension('B')->setWidth(23);
                $sheet->getColumnDimension('C')->setWidth(15);
                $sheet->getColumnDimension('D')->setWidth(15);
                $sheet->getColumnDimension('E')->setWidth(15);

                foreach (range('A', 'K') as $columnID) {
                    $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
                }

                $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
                $sheet->getPageMargins()->setTop(0.5);
                $sheet->getPageMargins()->setRight(0.1);
                $sheet->getPageMargins()->setLeft(0.1);
                $sheet->getPageMargins()->setBottom(0.1);
                $sheet->getPageSetup()->setPrintArea('A:E');
                $sheet->getPageSetup()->setFitToWidth(1);
                $sheet->getPageSetup()->setFitToHeight(0);
            }



            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="bimestral_' . $formato . '.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }

    public function cuatrimestral() {}

    public function r_cuatrimestral(Request $request) {}

    public function conciliacion() {}

    public function r_conciliacion(Request $request) {}

    public static function getFechaTexto($fecha_ini, $fecha_fin)
    {
        $self = (new static);

        $texto_fecha = "AL " . date("d") . ' DE' . $self->array_meses[date("m")] . ' DE ' . date("Y");
        if ($fecha_ini && $fecha_fin) {
            $texto_fecha = "DEL " . date("d", strtotime($fecha_ini)) . ' DE' . $self->array_meses[date("m", strtotime($fecha_ini))] . ' AL ' . date("d", strtotime($fecha_fin)) . ' DE' . $self->array_meses[date("m", strtotime($fecha_fin))] . ' DE ' . date("Y", strtotime($fecha_fin));
        }

        return $texto_fecha;
    }
}
