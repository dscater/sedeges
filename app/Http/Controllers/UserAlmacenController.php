<?php

namespace App\Http\Controllers;

use App\Models\UserAlmacen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class UserAlmacenController extends Controller
{

    public static function getAlmacensYGrupos($user, $permisos)
    {
        $user_almacens = [];
        if ($permisos != '*' && is_array($permisos)) {
            $user_almacens = UserAlmacen::select("almacens.grupo")
                ->join("almacens", "almacens.id", "=", "user_almacens.almacen_id")
                ->where("user_id", $user->id)
                ->distinct("grupo")
                ->pluck("grupo")->toArray();
        }

        return $user_almacens;
    }
}
