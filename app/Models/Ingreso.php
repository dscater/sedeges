<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Ingreso extends Model
{
    use HasFactory;

    protected $fillable = [
        "almacen_id",
        "unidad_id",
        "proveedor",
        "con_fondos",
        "fecha_nota",
        "nro_factura",
        "fecha_factura",
        "pedido_interno",
        "total",
        "fecha_ingreso",
        "fecha_registro",
        "user_id",
    ];

    protected $appends = ["fecha_ingreso_t", "fecha_registro_t", "fecha_nota_t", "fecha_factura_t", "nro_cod"];

    public function getNroCodAttribute()
    {
        $id = $this->id;
        $cod = $id;
        if ($id < 10) {
            $cod = '00000' . $cod;
        } elseif ($id < 100) {
            $cod = '0000' . $cod;
        } elseif ($id < 1000) {
            $cod = '000' . $cod;
        } elseif ($id < 10000) {
            $cod = '00' . $cod;
        } elseif ($id < 100000) {
            $cod = '0' . $cod;
        }

        return $cod;
    }

    public function getFechaNotaTAttribute()
    {
        if ($this->fecha_nota) {
            return date("d/m/Y", strtotime($this->fecha_nota));
        }
        return "";
    }

    public function getFechaFacturaTAttribute()
    {
        if ($this->fecha_factura) {
            return date("d/m/Y", strtotime($this->fecha_factura));
        }
        return "";
    }

    public function getFechaIngresoTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_ingreso));
    }

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function almacen()
    {
        return $this->belongsTo(Almacen::class, 'almacen_id');
    }

    public function unidad()
    {
        return $this->belongsTo(Unidad::class, 'unidad_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function egresos()
    {
        return $this->hasMany(Egreso::class, 'ingreso_id');
    }

    public function ingreso_detalles()
    {
        return $this->hasMany(IngresoDetalle::class, 'ingreso_id');
    }

    // FUNCIONES
    public static function getCodigoIngresoPartida($almacen_id, $partida_id, $gestion)
    {
        $partida = Partida::find($partida_id);
        $codigo = NULL;
        $nro = NULL;
        if ($partida) {
            $ultimo = Ingreso::where("almacen_id", $almacen_id)
                ->where("partida_id", $partida_id)
                ->where("fecha_ingreso", "LIKE", "$gestion%")
                ->orderBy("nro", "desc")
                ->get()
                ->first();
            // Log::debug($ultimo);
            $nro = 1;
            if ($ultimo) {
                $nro = (int)$ultimo->nro + 1;
            }
            $txtgestion = substr($gestion, 2, 3);
            $codigo = $partida->abreviatura . $txtgestion . $nro;
        }
        return [$codigo, $nro];
    }

    public static function corrigeCodigos()
    {
        $almacens = Almacen::all();

        foreach ($almacens as $almacen) {
            $partidas = Ingreso::where("almacen_id", $almacen->id)
                ->distinct()
                ->pluck("partida_id")
                ->toArray();

            foreach ($partidas as $value) {
                $ingresos = Ingreso::where("almacen_id", $almacen->id)
                    ->where("partida_id", $value)
                    ->orderBy("created_at", "asc")
                    ->get();
                foreach ($ingresos as $key => $ingreso) {
                    $gestion = date("Y", strtotime($ingreso->fecha_ingreso));
                    $txtgestion = substr($gestion, 2, 3);
                    $partida = Partida::find($value);
                    $nro = $key + 1;
                    $codigo = $partida->abreviatura . $txtgestion . $nro;
                    $ingreso->nro = $nro;
                    $ingreso->codigo = $codigo;
                    $ingreso->save();
                }
            }
        }
        return true;
    }
}
