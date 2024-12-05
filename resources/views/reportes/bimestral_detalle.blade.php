<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>BimestralDetalle</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 0.3cm;
            margin-left: 0.3cm;
            margin-right: 0.3cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            padding: 3px;
            word-wrap: break-word;
        }

        table thead tr th {
            font-size: 8pt;
        }

        table tbody tr td {
            font-size: 7pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            height: 100px;
            top: -20px;
            left: 0px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 0PX;
            margin-bottom: 15px;
            text-align: center;
            font-size: 12pt;
        }

        .texto {
            width: 400px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1em;
        }

        .fecha {
            width: 400px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: normal;
            font-size: 0.75em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 250px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .bg-principal {
            background: #191a1b;
            color: white;
        }

        .bold {
            font-weight: bold;
        }

        .bg1 {
            background-color: rgb(212, 241, 225);
        }

        .bg2 {
            background-color: rgb(255, 236, 230);
        }

        .bg3 {
            background-color: rgb(238, 243, 253);
        }

        .bg4 {
            background-color: rgba(253, 255, 233, 0.87);
        }

        .nueva_pagina {
            page-break-after: always;
        }

        .derecha {
            text-align: right;
        }

        .bold {
            font-weight: bold;
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    @php
        $contador = 0;
    @endphp
    @foreach ($almacens as $almacen)
        @php
            $total1 = 0;
            $total2 = 0;
            $total3 = 0;
            $total4 = 0;
        @endphp
        @php
            $contador++;
        @endphp
        <div class="encabezado">
            <div class="logo">
                <img src="{{ $configuracion->first()->logo_b64 }}">
            </div>
            <h2 class="titulo">
                {{ $configuracion->first()->razon_social }}
            </h2>
            <h4 class="texto">SALDOS FÍSICOS VALORADOS DE EXISTENCIAS DE ALMACENES</h4>
            <h4 class="fecha">{{ $texto_fecha }}</h4>
            <h4 class="texto">{{ $almacen->nombre }}</h4>

        </div>

        <table border="1">
            <thead>
                <tr>
                    <th rowspan="2" width="3%">N°</th>
                    <th rowspan="2">CÓDIGO</th>
                    <th rowspan="2">UNIDAD</th>
                    <th rowspan="2">DESCRIPCIÓN</th>
                    <th colspan="3" class="text-center bg4">
                        @if ($fecha_ini)
                            SALDO AL {{ date('d/m/Y', strtotime($fecha_ini)) }}
                        @else
                            SALDO ANTERIOR
                        @endif
                    </th>
                    <th rowspan="2">FECHA INGRESO</th>
                    <th colspan="3" class="text-center bg1">
                        INGRESO ALMACENES
                    </th>
                    <th colspan="3" class="text-center bg2">
                        SALIDA ALMACENES
                    </th>
                    <th colspan="3" class="text-center bg3">
                        @if ($fecha_fin)
                            SALDO AL {{ date('d/m/Y', strtotime($fecha_fin)) }}
                        @else
                            SALDO
                        @endif
                    </th>
                </tr>
                <tr>
                    <th class="bg4">CANT.</th>
                    <th class="bg4">C/U</th>
                    <th class="bg4">TOTAL BS.</th>
                    <th class="bg1">CANT.</th>
                    <th class="bg1">C/U</th>
                    <th class="bg1">TOTAL BS.</th>
                    <th class="bg2">CANT.</th>
                    <th class="bg2">C/U</th>
                    <th class="bg2">TOTAL BS.</th>
                    <th class="bg3">CANT.</th>
                    <th class="bg3">C/U</th>
                    <th class="bg3">TOTAL BS.</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $cont = 1;
                @endphp
                @foreach ($partidas as $partida)
                    @php
                        $totalp1 = 0;
                        $totalp2 = 0;
                        $totalp3 = 0;
                        $totalp4 = 0;
                    @endphp
                    @php
                        // INGRESOS RANGO FECHAS
                        $ingresos = App\Models\Ingreso::where('donacion', 'SI');
                        $ingresos->where('almacen_id', $almacen->id);
                        if ($fecha_ini && $fecha_fin) {
                            $ingresos->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
                        }

                        // EXTERNO
                        $user = Auth::user();
                        if ($user->tipo == 'EXTERNO') {
                            $ingresos->where('unidad_id', $user->unidad_id);
                            $ingresos->where('user_id', $user->id);
                        }

                        $ingresos->where('partida_id', $partida->id);
                        $ingresos = $ingresos->get();
                    @endphp
                    <tr>
                        <td colspan="3" class="bg3 bold">PARTIDA N°{{ $partida->nro_partida }}</td>
                        <td colspan="14"></td>
                    </tr>
                    @forelse ($ingresos as $ingreso)
                        @php
                            // SALDOS
                            $saldo = 0;
                            if ($fecha_ini && $fecha_fin) {
                                $reg_ingresos = App\Models\Ingreso::where('donacion', 'SI');
                                $reg_ingresos->where('almacen_id', $almacen->id);
                                $reg_ingresos->where('fecha_registro', '<', $fecha_ini);
                                $reg_ingresos->where('partida_id', $partida->id);
                                $reg_ingresos->where('producto_id', $ingreso->producto_id);
                                // EXTERNO
                                $user = Auth::user();
                                if ($user->tipo == 'EXTERNO') {
                                    $reg_ingresos->where('unidad_id', $user->unidad_id);
                                    $reg_ingresos->where('user_id', $user->id);
                                }
                                $reg_ingresos = $reg_ingresos->sum('total');

                                $reg_egresos = App\Models\Ingreso::where('donacion', 'SI')->join(
                                    'egresos',
                                    'egresos.ingreso_id',
                                    '=',
                                    'ingresos.id',
                                );
                                $reg_egresos->where('egresos.almacen_id', $almacen->id);
                                $reg_egresos->where('egresos.fecha_registro', '<', $fecha_ini);
                                $reg_egresos->where('egresos.partida_id', $partida->id);
                                $reg_egresos->where('egresos.producto_id', $ingreso->producto_id);
                                // EXTERNO
                                $user = Auth::user();
                                if ($user->tipo == 'EXTERNO') {
                                    $reg_egresos->where('ingresos.unidad_id', $user->unidad_id);
                                    $reg_egresos->where('ingresos.user_id', $user->id);
                                }
                                $reg_egresos = $reg_egresos->sum('egresos.total');
                                $saldo = $reg_ingresos - $reg_egresos;
                            }
                        @endphp

                        <tr>
                            <td>{{ $cont++ }}</td>
                            <td>{{ $ingreso->codigo }}</td>
                            <td>{{ $ingreso->unidad_medida->nombre }}</td>
                            <td>{{ $ingreso->producto->nombre }}</td>
                            <td class="centreado bg4"></td>
                            <td class="centreado bg4"></td>
                            <td class="centreado bg4">{{ $saldo }}</td>
                            <td>{{ $ingreso->fecha_ingreso_t }}</td>
                            <td class="centreado bg1">{{ $ingreso->cantidad }}</td>
                            <td class="centreado bg1">{{ $ingreso->costo }}</td>
                            <td class="centreado bg1">{{ $ingreso->total }}</td>
                            <td class="centreado bg2">{{ $ingreso->egreso ? $ingreso->egreso->cantidad : 0 }}</td>
                            <td class="centreado bg2">{{ $ingreso->egreso ? $ingreso->egreso->costo : 0 }}</td>
                            <td class="centreado bg2">{{ $ingreso->egreso ? $ingreso->egreso->total : 0 }}</td>
                            <td class="centreado bg3">
                                {{ $ingreso->egreso ? $ingreso->egreso->s_cantidad : $ingreso->cantidad }}</td>
                            <td class="centreado bg3">{{ $ingreso->costo }}</td>
                            <td class="centreado bg3">
                                {{ $ingreso->egreso ? $ingreso->egreso->s_total : $ingreso->total }}</td>
                        </tr>
                        @php

                            // total partridas
                            $totalp1 += (float) $saldo;
                            $totalp2 += (float) $ingreso->total;
                            $totalp3 += $ingreso->egreso ? (float) $ingreso->egreso->total : 0;
                            $totalp4 += $ingreso->egreso ? (float) $ingreso->egreso->s_total : $ingreso->cantidad;
                            // Illuminate\Support\Facades\Log::debug('DD');

                            // totalgeneral
                            $total1 += (float) $saldo;
                            $total2 += (float) $ingreso->total;
                            $total3 += $ingreso->egreso ? (float) $ingreso->egreso->total : 0;
                            $total4 += $ingreso->egreso ? (float) $ingreso->egreso->s_total : $ingreso->cantidad;
                        @endphp
                    @empty
                        @php
                            // VERIFICAR SALDOS ANTERIORES
                            $saldo = 0;
                            $reg_ingresos = [];
                            if ($fecha_ini && $fecha_fin) {
                                $reg_ingresos = App\Models\Ingreso::where('donacion', 'SI');
                                $reg_ingresos->where('almacen_id', $almacen->id);
                                $reg_ingresos->where('fecha_registro', '<', $fecha_ini);
                                $reg_ingresos->where('partida_id', $partida->id);

                                // EXTERNO
                                $user = Auth::user();
                                if ($user->tipo == 'EXTERNO') {
                                    $reg_ingresos->where('unidad_id', $user->unidad_id);
                                    $reg_ingresos->where('user_id', $user->id);
                                }

                                $reg_ingresos = $reg_ingresos->get();
                            }
                        @endphp
                        @forelse ($reg_ingresos as $r_ingreso)
                            @php
                                $saldo = $r_ingreso->total;
                                if ($r_ingreso->egreso) {
                                    $saldo =
                                        (float) $r_ingreso->total -
                                        ($r_ingreso->egreso ? (float) $r_ingreso->egreso->total : 0);
                                }
                            @endphp
                            <tr>
                                <td>{{ $cont++ }}</td>
                                <td>{{ $r_ingreso->codigo }}</td>
                                <td>{{ $r_ingreso->unidad_medida->nombre }}</td>
                                <td>{{ $r_ingreso->producto->nombre }}</td>
                                <td class="centreado bg4"></td>
                                <td class="centreado bg4"></td>
                                <td class="centreado bg4">{{ $saldo }}</td>
                                <td class="centreado">-</td>
                                <td class="centreado bg1">-</td>
                                <td class="centreado bg1">-</td>
                                <td class="centreado bg1">-</td>
                                <td class="centreado bg2">-</td>
                                <td class="centreado bg2">-</td>
                                <td class="centreado bg2">-</td>
                                <td class="centreado bg3">-</td>
                                <td class="centreado bg3">-</td>
                                <td class="centreado bg3">{{ $saldo }}</td>
                            </tr>

                            @php
                                // partida
                                $totalp1 += (float) $saldo;
                                $totalp4 += (float) $saldo;

                                // general
                                $total1 += (float) $saldo;
                                $total4 += (float) $saldo;
                            @endphp
                        @empty
                            <tr>
                                <td colspan="17">NO SE ENCONTRARÓN REGISTROS</td>
                            </tr>
                        @endforelse
                    @endforelse


                    <tr class=bg3>
                        <td colspan="4" class="derecha bold">TOTAL PARTIDA N° {{ $partida->nro_partida }}</td>
                        <td class="bold centreado" colspan="2"></td>
                        <td class="bold centreado">{{ number_format($totalp1, 2, '.', '') }}</td>
                        <td></td>
                        <td class="bold centreado" colspan="2"></td>
                        <td class="bold centreado">{{ number_format($totalp2, 2, '.', '') }}</td>
                        <td class="bold centreado" colspan="2"></td>
                        <td class="bold centreado">{{ number_format($totalp3, 2, '.', '') }}</td>
                        <td class="bold centreado" colspan="2"></td>
                        <td class="bold centreado">{{ number_format($totalp4, 2, '.', '') }}</td>
                    </tr>
                @endforeach
                <tr>
                    <td colspan="4" class="derecha bold">TOTAL GENERAL</td>
                    <td class="bold centreado" colspan="2"></td>
                    <td class="bold centreado">{{ number_format($total1, 2, '.', '') }}</td>
                    <td></td>
                    <td class="bold centreado" colspan="2"></td>
                    <td class="bold centreado">{{ number_format($total2, 2, '.', '') }}</td>
                    <td class="bold centreado" colspan="2"></td>
                    <td class="bold centreado">{{ number_format($total3, 2, '.', '') }}</td>
                    <td class="bold centreado" colspan="2"></td>
                    <td class="bold centreado">{{ number_format($total4, 2, '.', '') }}</td>
                </tr>
            </tbody>
        </table>
        @if ($contador < count($almacens))
            <div class="nueva_pagina"></div>
        @endif
    @endforeach
</body>

</html>
