<?php

namespace App\Http\Controllers;

use App\Models\Almacen;
use App\Models\Egreso;
use App\Models\HistorialAccion;
use App\Models\Ingreso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class IngresoController extends Controller
{
    public $validacion = [
        "almacen_id" => "required",
        "donacion" => "required",
        "producto_id" => "required",
        "unidad_medida_id" => "required",
        "cantidad" => "required",
        "costo" => "required",
        "total" => "required",
        "fecha_ingreso" => "required",
    ];

    public $mensajes = [
        "almacen_id.required" => "Este campo es obligatorio",
        "partida_id.required" => "Este campo es obligatorio",
        "unidad_id.required" => "Este campo es obligatorio",
        "programa_id.required" => "Este campo es obligatorio",
        "donacion.required" => "Este campo es obligatorio",
        "producto_id.required" => "Este campo es obligatorio",
        "unidad_medida_id.required" => "Este campo es obligatorio",
        "cantidad.required" => "Este campo es obligatorio",
        "costo.required" => "Este campo es obligatorio",
        "total.required" => "Este campo es obligatorio",
        "fecha_ingreso.required" => "Este campo es obligatorio",
    ];

    public function index()
    {
        return Inertia::render("Ingresos/Index");
    }

    public function listado()
    {
        $ingresos = Ingreso::select("ingresos.*");
        $user = Auth::user();
        if ($user->tipo == 'EXTERNO') {
            $ingresos->where("almacen_id", $user->almacen_id);
            $ingresos->where("unidad_id", $user->unidad_id);
            $ingresos->where("user_id", $user->id);
        }

        $ingresos = $ingresos->get();
        return response()->JSON([
            "ingresos" => $ingresos
        ]);
    }

    public function almacen_partida(Request $request)
    {

        $user = Auth::user();
        $permisos = Auth::user()->permisos;
        $almacen_id = $request->almacen_id;
        $partida_id = $request->partida_id;

        $ingresos = Ingreso::select("ingresos.*");
        $ingresos->where("almacen_id", $almacen_id);
        $ingresos->where("partida_id", $partida_id);
        if ($user->tipo == 'EXTERNO') {
            $ingresos->where("unidad_id", $user->unidad_id);
            $ingresos->where("user_id", $user->id);
        }
        $ingresos->doesntHave("egreso");
        $ingresos = $ingresos->orderBy("id", "desc")->get();

        foreach ($ingresos as $i) {
            $registra = false;
            if (!is_array($permisos) && $permisos == '*') {
                $registra = true;
            }
            if (is_array($permisos) && in_array("egresos.create", $permisos)) {
                $registra = true;
            }

            if ($registra) {
                $i->egreso()->create([
                    "almacen_id" => $i->almacen_id,
                    "partida_id" => $i->partida_id,
                    "producto_id" => $i->producto_id,
                    "cantidad" => $i->cantidad,
                    "costo" => $i->costo,
                    "total" => $i->total,
                    "fecha_registro" => date("Y-m-d"),
                ]);
            }
        }

        // recargar registros
        $ingresos = Ingreso::with(["unidad_medida", "producto", "egreso.destino"])->select("ingresos.*");
        $ingresos->where("almacen_id", $almacen_id);
        $ingresos->where("partida_id", $partida_id);

        if ($user->tipo == 'EXTERNO') {
            $ingresos->where("unidad_id", $user->unidad_id);
            $ingresos->where("user_id", $user->id);
        }


        $ingresos = $ingresos->orderBy("id", "desc")->get();

        return response()->JSON($ingresos);
    }

    public function api(Request $request)
    {
        $ingresos = Ingreso::with(["almacen", "partida", "producto", "unidad_medida", "unidad"])->select("ingresos.*");
        $user = Auth::user();
        if ($user->tipo == 'EXTERNO') {
            // $ingresos->where("almacen_id", $user->almacen_id);
            $ingresos->where("unidad_id", $user->unidad_id);
            $ingresos->where("user_id", $user->id);
        }
        $id_almacens = AlmacenController::getIdAlmacensPermiso(Auth::user());
        $ingresos->whereIn("almacen_id", $id_almacens);
        $ingresos = $ingresos->orderBy("id", "desc")->get();
        return response()->JSON(["data" => $ingresos]);
    }

    public function paginado(Request $request)
    {
        $search = $request->search;
        $ingresos = Ingreso::select("ingresos.*");

        if (trim($search) != "") {
            $ingresos->where("nombre", "LIKE", "%$search%");
        }

        $ingresos = $ingresos->paginate($request->itemsPerPage);
        return response()->JSON([
            "ingresos" => $ingresos
        ]);
    }

    public function store(Request $request)
    {
        $almacen = Almacen::find($request["almacen_id"]);
        if ($almacen && $almacen->grupo == 'CENTROS') {
            $this->validacion["unidad_id"] = "required";
        }
        if (Auth::user()->tipo != 'EXTERNO') {
            $this->validacion["partida_id"] = "required";
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear la ingreso
            $gestion = date("Y", strtotime($request["fecha_ingreso"]));
            $array_codigo = Ingreso::getCodigoIngresoPartida($request["almacen_id"], $request["partida_id"], $gestion);
            $data_ingreso = [
                "almacen_id" => $request["almacen_id"],
                "partida_id" => NULL,
                "unidad_id" => Auth::user()->tipo == 'EXTERNO' ? Auth::user()->unidad_id : NULL,
                "programa_id" => NULL,
                "codigo" =>  NULL,
                "nro" => NULL,
                "donacion" => $request["donacion"],
                "producto_id" => $request["producto_id"],
                "unidad_medida_id" => $request["unidad_medida_id"],
                "cantidad" => $request["cantidad"],
                "costo" => $request["costo"],
                "total" => $request["total"],
                "fecha_ingreso" => $request["fecha_ingreso"],
                "fecha_registro" => date('Y-m-d'),
                "user_id" => Auth::user()->id,
            ];

            if (Auth::user()->tipo != 'EXTERNO' || Auth::user()->id == 1) {
                $data_ingreso["partida_id"] = $request["partida_id"];
                $data_ingreso["codigo"] = $array_codigo[0];
                $data_ingreso["nro"] = $array_codigo[1];
            }

            if ($almacen->grupo == 'CENTROS') {
                $data_ingreso["unidad_id"] = $request["unidad_id"];
            }

            $nuevo_ingreso = Ingreso::create($data_ingreso);

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_ingreso, "ingresos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN INGRESO',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();

            if ($request["_redirect_group"] && (bool)$request["_redirect_group"] == true) {
                return redirect()->route('almacens.stockAlmacen', $nuevo_ingreso->almacen_id)
                    ->with("bien", "Registro realizado")
                    ->withInput(['g' => $nuevo_ingreso->almacen->grupo]);
            }
            return redirect()->route("ingresos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Ingreso $ingreso)
    {
        return response()->JSON($ingreso);
    }

    public function update(Ingreso $ingreso, Request $request)
    {
        $almacen = Almacen::find($request["almacen_id"]);
        if ($almacen && $almacen->grupo == 'CENTROS') {
            $this->validacion["unidad_id"] = "required";
        }
        if (Auth::user()->tipo != 'EXTERNO') {
            $this->validacion["partida_id"] = "required";
        }

        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $gestion = date("Y", strtotime($request["fecha_ingreso"]));
            $array_codigo = Ingreso::getCodigoIngresoPartida($request["almacen_id"], $request["partida_id"], $gestion);
            $data_ingreso = [
                "almacen_id" => $request["almacen_id"],
                "partida_id" => NULL,
                "unidad_id" => Auth::user()->tipo == 'EXTERNO' ? Auth::user()->unidad_id : NULL,
                "programa_id" => NULL,
                "donacion" => $request["donacion"],
                "producto_id" => $request["producto_id"],
                "unidad_medida_id" => $request["unidad_medida_id"],
                "cantidad" => $request["cantidad"],
                "costo" => $request["costo"],
                "total" => $request["total"],
                "fecha_ingreso" => $request["fecha_ingreso"],
                "fecha_registro" => date('Y-m-d')
            ];

            if (Auth::user()->tipo != 'EXTERNO' || Auth::user()->id == 1) {
                $data_ingreso["partida_id"] = $request["partida_id"];
            }

            if ($almacen->grupo == 'CENTROS') {
                $data_ingreso["unidad_id"] = $request["unidad_id"];
            }

            if ($ingreso->partida_id == null || $ingreso->codigo == null || $ingreso->partida_id != $request->partida_id) {
                $array_codigo = Ingreso::getCodigoIngresoPartida($request["almacen_id"], $request["partida_id"], $gestion);
                $data_ingreso["codigo"] = $array_codigo[0];
                $data_ingreso["nro"] = $array_codigo[1];
            }

            $datos_original = HistorialAccion::getDetalleRegistro($ingreso, "ingresos");
            $ingreso->update($data_ingreso);
            $ingreso->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($ingreso, "ingresos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN INGRESO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'INGRESOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();


            if ($request["_redirect_group"] && (bool)$request["_redirect_group"] == true) {
                return redirect()->route('almacens.stockAlmacen', $ingreso->almacen_id)
                    ->with("bien", "Registro actualizado")
                    ->withInput(['g' => $ingreso->almacen->grupo]);
            }

            return redirect()->route("ingresos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(Ingreso $ingreso)
    {
        DB::beginTransaction();
        try {
            $usos = Egreso::where("ingreso_id", $ingreso->id)->get();
            if (count($usos) > 0) {
                throw ValidationException::withMessages([
                    'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
                ]);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($ingreso, "ingresos");
            $ingreso->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN INGRESO',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
