<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ingreso extends Model
{
    use HasFactory;

    protected $fillable = [
        "almacen_id",
        "partida_id",
        "unidad_id",
        "programa_id",
        "codigo",
        "nro",
        "donacion",
        "producto_id",
        "unidad_medida_id",
        "cantidad",
        "costo",
        "total",
        "fecha_ingreso",
        "fecha_registro",
        "user_id",
    ];

    protected $appends = ["fecha_ingreso_t", "fecha_registro_t"];

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

    public function partida()
    {
        return $this->belongsTo(Partida::class, 'partida_id');
    }

    public function unidad()
    {
        return $this->belongsTo(Unidad::class, 'unidad_id');
    }


    public function programa()
    {
        return $this->belongsTo(Programa::class, 'programa_id');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }

    public function unidad_medida()
    {
        return $this->belongsTo(UnidadMedida::class, 'unidad_medida_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function egreso()
    {
        return $this->hasOne(Egreso::class, 'ingreso_id');
    }

    // FUNCIONES
    public static function getCodigoIngresoPartida($partida_id)
    {
        $partida = Partida::find($partida_id);
        $codigo = NULL;
        $nro = NULL;
        if ($partida) {
            $ultimo = Ingreso::where("partida_id", $partida_id)->get()->last();
            $nro = 1;
            if ($ultimo) {
                $nro = (int)$ultimo->nro + 1;
            }
            $codigo = $partida->abreviatura . '-' . $nro;

        }
        return [$codigo, $nro];
    }
}
