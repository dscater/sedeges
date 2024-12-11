<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ingresos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("almacen_id");
            $table->unsignedBigInteger("partida_id")->nullable();
            $table->unsignedBigInteger("unidad_id")->nullable();
            $table->string("codigo")->unique()->nullable();
            $table->integer("nro")->nullable();
            $table->string("donacion");
            $table->unsignedBigInteger("producto_id");
            $table->unsignedBigInteger("unidad_medida_id");
            $table->integer("cantidad");
            $table->decimal("costo", 24, 2);
            $table->decimal("total", 24, 2);
            $table->date("fecha_ingreso");
            $table->date("fecha_registro")->nullable();
            $table->unsignedBigInteger("user_id");
            $table->timestamps();

            $table->foreign("almacen_id")->on("almacens")->references("id");
            $table->foreign("partida_id")->on("partidas")->references("id");
            $table->foreign("unidad_id")->on("unidads")->references("id");
            $table->foreign("producto_id")->on("productos")->references("id");
            $table->foreign("unidad_medida_id")->on("unidad_medidas")->references("id");
            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ingresos');
    }
};
