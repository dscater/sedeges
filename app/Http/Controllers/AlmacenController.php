<?php

namespace App\Http\Controllers;

use App\Models\Almacen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

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
        return $id_almacens;
    }
}
