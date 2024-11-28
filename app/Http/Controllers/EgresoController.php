<?php

namespace App\Http\Controllers;

use App\Models\Egreso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class EgresoController extends Controller
{
    public function index()
    {
        return Inertia::render("Egresos/Index");
    }

    public function update(Egreso $egreso, Request $request)
    {
        $cantidad = $request->cantidad;

        $egreso->total = (float)$egreso->costo * (float)$cantidad;
        $egreso->cantidad = $cantidad;
        $egreso->save();

        return response()->JSON($egreso);
    }
}
