<?php

namespace App\Http\Controllers;

use App\Models\Lote;
use App\Models\User;
use App\Models\VentaLote;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public static $permisos = [
        "DOCTOR" => [
            "usuarios.index",
            "usuarios.create",
            "usuarios.edit",
            "usuarios.destroy",

            "pacientes.index",
            "pacientes.create",
            "pacientes.edit",
            "pacientes.destroy",

            "configuracions.index",
            "configuracions.create",
            "configuracions.edit",
            "configuracions.destroy",

            "reportes.usuarios",
        ],
    ];

    public static function getPermisosUser()
    {
        $array_permisos = self::$permisos;
        if ($array_permisos[Auth::user()->tipo]) {
            return $array_permisos[Auth::user()->tipo];
        }
        return [];
    }


    public static function verificaPermiso($permiso)
    {
        if (in_array($permiso, self::$permisos[Auth::user()->tipo])) {
            return true;
        }
        return false;
    }

    public function permisos(Request $request)
    {
        return response()->JSON([
            "permisos" => $this->permisos[Auth::user()->tipo]
        ]);
    }

    public function getUser()
    {
        return response()->JSON([
            "user" => Auth::user()
        ]);
    }

    public static function getInfoBoxUser()
    {
        $permisos = [];
        $array_infos = [];
        if (Auth::check()) {
            $oUser = new User();
            $permisos = $oUser->getPermisos();
            if ($permisos == '*' || (is_array($permisos) && in_array('usuarios.index', $permisos))) {
                $array_infos[] = [
                    'label' => 'USUARIOS',
                    'cantidad' => User::where('id', '!=', 1)->count(),
                    'color' => 'bg-principal',
                    'icon' => "fa-users",
                    "url" => "usuarios.index"
                ];
            }

            
            if ($permisos == '*' || (is_array($permisos) && in_array('almacens1.index', $permisos))) {
                $array_infos[] = [
                    'label' => 'ALMACÉN CENTROS',
                    'cantidad' => 0,
                    'color' => 'bg-primary',
                    'icon' => "fa-list",
                    "url" => ""
                ];
            }

            
            if ($permisos == '*' || (is_array($permisos) && in_array('almacens2.index', $permisos))) {
                $array_infos[] = [
                    'label' => 'ALMACÉN PROGRAMAS',
                    'cantidad' => 0,
                    'color' => 'bg-warning',
                    'icon' => "fa-list",
                    "url" => ""
                ];
            }

            
            if ($permisos == '*' || (is_array($permisos) && in_array('almacens3.index', $permisos))) {
                $array_infos[] = [
                    'label' => 'ALMACÉN FARMACIAS',
                    'cantidad' => 0,
                    'color' => 'bg-danger',
                    'icon' => "fa-list",
                    "url" => ""
                ];
            }
        }
        return $array_infos;
    }
}
