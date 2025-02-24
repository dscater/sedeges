<?php

namespace App\Http\Requests;

use App\Rules\IngresoDetalleRule;
use Illuminate\Foundation\Http\FormRequest;

class IngresoUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "almacen_id" => "required",
            "proveedor" => "required|string",
            "con_fondos" => "nullable|string",
            "nro_factura" => "nullable|string",
            "pedido_interno" => "nullable|string",
            "ingreso_detalles" => ["required", "array", "min:1", new IngresoDetalleRule],
            "fecha_ingreso" => "required|date",
        ];
    }

    public function messages(): array
    {
        return [
            "almacen_id.required" => "Este campo es obligatorio",
            "proveedor.required" => "Este campo es obligatorio",
            "proveedor.string" => "Debes ingresar un texto",
            "ingreso_detalles.required" => "Debes ingresar al menos 1 producto",
            "ingreso_detalles.array" => "Debes enviar un array de productos",
            "ingreso_detalles.min" => "Debes agregar al menos :min productos",
            "con_fondos.string" => "Debes ingresar un texto",
            "nro_factura.string" => "Debes ingresar un texto",
            "pedido_interno.string" => "Debes ingresar un texto",
            "fecha_ingreso.required" => "Este campo es obligatorio",
        ];
    }
}
