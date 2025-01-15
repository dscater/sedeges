<?php

namespace App\Http\Controllers;

use App\Models\Almacen;
use App\Models\IEInterno;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class IEInternoController extends Controller
{
    public function index(Almacen $almacen)
    {
        return Inertia::render("Almacens/IngresosInterno", compact("almacen"));
    }

    public function egresos(Almacen $almacen)
    {
        return Inertia::render("Almacens/EgresosInterno", compact("almacen"));
    }

    public function api(Almacen $almacen)
    {
        $user = Auth::user();
        $ie_internos = IEInterno::with(["producto", "ingreso.unidad_medida", "ingreso.partida"])
            ->join("ingresos", "ingresos.id", "=", "i_e_internos.ingreso_id");
        $ie_internos->where("i_e_internos.almacen_id", $almacen->id);

        if ($user->tipo == 'EXTERNO') {
            $ie_internos->where("ingresos.unidad_id", $user->unidad_id);
            $ie_internos->where("ingresos.user_id", $user->id);
        }

        $ie_internos = $ie_internos->orderBy("i_e_internos.created_at", "desc")->get();
        return response()->JSON(["data" => $ie_internos]);
    }


    public function getIngresosCentral(Almacen $almacen, Request $request)
    {
        $partida_id = $request->partida_id;
        $user = Auth::user();
        $ie_internos = IEInterno::with(["producto", "ingreso.unidad_medida"])
            ->select("i_e_internos.*")
            ->join("ingresos", "ingresos.id", "=", "i_e_internos.ingreso_id");
        $ie_internos->where("i_e_internos.almacen_id", $almacen->id);

        if ($user->tipo == 'EXTERNO') {
            $ie_internos->where("ingresos.unidad_id", $user->unidad_id);
            $ie_internos->where("ingresos.user_id", $user->id);
        }

        $ie_internos->where("ingresos.partida_id", $partida_id);
        $ie_internos = $ie_internos->orderBy("i_e_internos.created_at", "desc")->get();
        return response()->JSON([
            "ie_internos" => $ie_internos,
        ]);
    }

    public function update(IEInterno $ie_interno, Request $request)
    {
        DB::beginTransaction();
        try {
            $cantidad = $request->cantidad;
            $ie_interno->etotal = (float)$ie_interno->icosto * (float)$cantidad;
            $ie_interno->ecantidad = $cantidad;
            $ie_interno->fecha_egreso = date("Y-m-d");
            $ie_interno->save();

            DB::commit();
            return response()->JSON([
                "ie_interno" => $ie_interno->load(["producto", "ingreso.unidad_medida"]),
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                "message" => "Ocurrió un error no se pudo registrar el ie_interno"
            ], 500);
        }
    }
}
