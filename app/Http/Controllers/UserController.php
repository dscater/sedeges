<?php

namespace App\Http\Controllers;

use App\Models\Egreso;
use App\Models\Ingreso;
use App\Models\Lote;
use App\Models\User;
use App\Models\VentaLote;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

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

            $user = Auth::user();
            if ($permisos == '*' || (is_array($permisos) && in_array('almacen1.index', $permisos))) {
                $ingresos = Ingreso::where("almacen_id", 1);
                if ($user->tipo == 'EXTERNO') {
                    $ingresos->where("unidad_id", $user->unidad_id);
                    $ingresos->where("user_id", $user->id);
                }
                $ingresos = $ingresos->sum("total");

                $egresos = Egreso::select("egresos.*")
                    ->join("ingresos", "ingresos.id", "=", "egresos.ingreso_id")
                    ->where("egresos.almacen_id", 1);
                if ($user->tipo == 'EXTERNO') {
                    $egresos->where("ingresos.unidad_id", $user->unidad_id);
                    $egresos->where("ingresos.user_id", $user->id);
                }
                $egresos = $egresos->sum("egresos.total");
                $total = $ingresos - $egresos;
                $array_infos[] = [
                    'label' => 'ALMACÉN CENTROS',
                    'cantidad' => $total,
                    'color' => 'bg-primary',
                    'icon' => "fa-list",
                    "link" => true,
                    "url" => route("almacens.index", 1)
                ];
            }


            if ($permisos == '*' || (is_array($permisos) && in_array('almacen2.index', $permisos))) {

                $ingresos = Ingreso::where("almacen_id", 2);
                if ($user->tipo == 'EXTERNO') {
                    $ingresos->where("unidad_id", $user->unidad_id);
                    $ingresos->where("user_id", $user->id);
                }
                $ingresos = $ingresos->sum("total");

                $egresos = Egreso::select("egresos.*")
                    ->join("ingresos", "ingresos.id", "=", "egresos.ingreso_id")
                    ->where("egresos.almacen_id", 2);
                if ($user->tipo == 'EXTERNO') {
                    $egresos->where("ingresos.unidad_id", $user->unidad_id);
                    $egresos->where("ingresos.user_id", $user->id);
                }
                $egresos = $egresos->sum("egresos.total");
                $total = $ingresos - $egresos;

                $array_infos[] = [
                    'label' => 'ALMACÉN PROGRAMAS',
                    'cantidad' => $total,
                    'color' => 'bg-warning',
                    'icon' => "fa-list",
                    "link" => true,
                    "url" => route("almacens.index", 2)
                ];
            }


            if ($permisos == '*' || (is_array($permisos) && in_array('almacen3.index', $permisos))) {

                $ingresos = Ingreso::where("almacen_id", 3);
                if ($user->tipo == 'EXTERNO') {
                    $ingresos->where("unidad_id", $user->unidad_id);
                    $ingresos->where("user_id", $user->id);
                }
                $ingresos = $ingresos->sum("total");

                $egresos = Egreso::select("egresos.*")
                    ->join("ingresos", "ingresos.id", "=", "egresos.ingreso_id")
                    ->where("egresos.almacen_id", 3);
                if ($user->tipo == 'EXTERNO') {
                    $egresos->where("ingresos.unidad_id", $user->unidad_id);
                    $egresos->where("ingresos.user_id", $user->id);
                }
                $egresos = $egresos->sum("egresos.total");
                $total = $ingresos - $egresos;

                $array_infos[] = [
                    'label' => 'ALMACÉN FARMACIAS',
                    'cantidad' => $total,
                    'color' => 'bg-danger',
                    'icon' => "fa-list",
                    "link" => true,
                    "url" => route("almacens.index", 3)
                ];
            }
        }
        return $array_infos;
    }
}
