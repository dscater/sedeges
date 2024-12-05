<?php

namespace App\Http\Controllers;

use App\Models\Almacen;
use App\Models\Egreso;
use App\Models\Ingreso;
use App\Models\Producto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class AlmacenController extends Controller
{

    public function listado()
    {
        $id_almacens = AlmacenController::getIdAlmacensPermiso(Auth::user());
        $almacens = Almacen::select("almacens.*");
        $almacens->whereIn("id", $id_almacens);
        $almacens = $almacens->get();
        return response()->JSON([
            "almacens" => $almacens
        ]);
    }

    public function index(Almacen $almacen)
    {
        return Inertia::render("Almacens/Index", compact("almacen"));
    }
    public function productos(Almacen $almacen)
    {
        $data = [];
        $productos = Producto::all();

        $user = Auth::user();

        // foreach ($productos as $key => $producto) {
        //     $ingresos = Ingreso::where("almacen_id", $almacen->id)
        //         ->where("producto_id", $producto->id);
        //     if ($user->tipo == 'EXTERNO') {
        //         $ingresos->where("unidad_id", $user->unidad_id);
        //         $ingresos->where("user_id", $user->id);
        //     }
        //     $ingresos = $ingresos->sum("cantidad");

        //     $egresos = Egreso::select("egresos.*")
        //         ->join("ingresos", "ingresos.id", "=", "egresos.ingreso_id")
        //         ->where("egresos.almacen_id", $almacen->id)
        //         ->where("egresos.producto_id", $producto->id);
        //     if ($user->tipo == 'EXTERNO') {
        //         $egresos->where("ingresos.unidad_id", $user->unidad_id);
        //         $egresos->where("ingresos.user_id", $user->id);
        //     }
        //     $egresos = $egresos->sum("egresos.cantidad");
        //     $total_cantidad = $ingresos - $egresos;

        //     $ingresos = Ingreso::where("almacen_id", $almacen->id)
        //         ->where("producto_id", $producto->id);
        //     if ($user->tipo == 'EXTERNO') {
        //         $ingresos->where("unidad_id", $user->unidad_id);
        //         $ingresos->where("user_id", $user->id);
        //     }
        //     $ingresos = $ingresos->sum("total");

        //     $egresos = Egreso::select("egresos.*")
        //         ->join("ingresos", "ingresos.id", "=", "egresos.ingreso_id")
        //         ->where("egresos.almacen_id", $almacen->id)
        //         ->where("egresos.producto_id", $producto->id);
        //     if ($user->tipo == 'EXTERNO') {
        //         $egresos->where("ingresos.unidad_id", $user->unidad_id);
        //         $egresos->where("ingresos.user_id", $user->id);
        //     }
        //     $egresos = $egresos->sum("egresos.total");
        //     $total_bs = $ingresos - $egresos;

        //     $data[] = [
        //         "nro" => ($key + 1),
        //         "nombre" => $producto->nombre,
        //         "ingresos" => $ingresos,
        //         "egresos" => $egresos,
        //         "stock" => $total_cantidad,
        //         "total_bs" => $total_bs,
        //     ];
        // }

        $ingresos = Ingreso::with(["almacen", "partida", "producto", "unidad_medida", "unidad", "programa", "egreso"])->select("ingresos.*");
        $ingresos->where("almacen_id", $almacen->id);
        if ($user->tipo == 'EXTERNO') {
            $ingresos->where("unidad_id", $user->unidad_id);
            $ingresos->where("user_id", $user->id);
        }

        $ingresos = $ingresos->orderBy("id", "desc")->get();

        return response()->JSON(["data" => $ingresos]);
    }


    public static function getIdAlmacensPermiso($user)
    {
        $permisos = $user->permisos;
        $id_almacens = [];
        if ($permisos == '*') {
            $id_almacens = [1, 2, 3];
        } else {
            if (in_array("almacen1.index", $permisos)) {
                $id_almacens[] = 1;
            }
            if (in_array("almacen2.index", $permisos)) {
                $id_almacens[] = 2;
            }
            if (in_array("almacen3.index", $permisos)) {
                $id_almacens[] = 3;
            }
        }
        $user = Auth::user();
        if ($user->tipo == 'EXTERNO') {
            if (!in_array($user->almacen_id, $id_almacens)) {
                $id_almacens[] = $user->almacen_id;
            }
        }

        return $id_almacens;
    }

    public function show(Almacen $almacen)
    {
        return response()->JSON($almacen);
    }
}
