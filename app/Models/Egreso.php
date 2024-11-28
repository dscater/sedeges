<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Egreso extends Model
{
    use HasFactory;

    protected $fillable = [
        "ingreso_id",
        "almacen_id",
        "partida_id",
        "producto_id",
        "cantidad",
        "costo",
        "total",
        "fecha_registro",
    ];

    protected $appends = ["fecha_registro_t", "s_cantidad", "s_total"];

    public function getSCantidadAttribute()
    {
        return (float)$this->ingreso->cantidad - (float)$this->cantidad;
    }

    public function getSTotalAttribute()
    {
        Log::debug($this->ingreso->total);
        Log::debug($this->total);
        return (float)$this->ingreso->total - (float)$this->total;
    }

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function ingreso()
    {
        return $this->belongsTo(Ingreso::class, 'ingreso_id');
    }

    public function almacen()
    {
        return $this->belongsTo(Almacen::class, 'almacen_id');
    }
    public function partida()
    {
        return $this->belongsTo(Partida::class, 'partida_id');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }
}
