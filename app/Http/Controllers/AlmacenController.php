<?php

namespace App\Http\Controllers;

use App\Models\Almacen;
use Illuminate\Http\Request;

class AlmacenController extends Controller
{
    public function listado()
    {
        $almacens = Almacen::select("almacens.*")->get();
        return response()->JSON([
            "almacens" => $almacens
        ]);
    }
}
