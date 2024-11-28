import axios from "axios";
import { onMounted, ref } from "vue";
import { usePage } from "@inertiajs/vue3";

const oIngreso = ref({
    id: 0,
    almacen_id: "",
    partida_id: "",
    unidad_id: "",
    programa_id: "",
    codigo: "",
    donacion: "",
    producto_id: "",
    unidad_medida_id: "",
    cantidad: "",
    costo: "",
    total: "",
    fecha_ingreso: "",
    _method: "POST",
});

export const useIngresos = () => {
    const { flash } = usePage().props;
    const getIngresos = async () => {
        try {
            const response = await axios.get(route("ingresos.listado"), {
                headers: { Accept: "application/json" },
            });
            return response.data.ingresos;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const getIngresosByTipo = async (data) => {
        try {
            const response = await axios.get(route("ingresos.byTipo"), {
                headers: { Accept: "application/json" },
                params: data,
            });
            return response.data.ingresos;
        } catch (error) {
            console.error("Error:", error);
            throw error; // Puedes manejar el error según tus necesidades
        }
    };

    const getIngresosApi = async (data) => {
        try {
            const response = await axios.get(route("ingresos.paginado", data), {
                headers: { Accept: "application/json" },
            });
            return response.data.ingresos;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };
    const saveIngreso = async (data) => {
        try {
            const response = await axios.post(route("ingresos.store", data), {
                headers: { Accept: "application/json" },
            });
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const deleteIngreso = async (id) => {
        try {
            const response = await axios.delete(route("ingresos.destroy", id), {
                headers: { Accept: "application/json" },
            });
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const setIngreso = (item = null) => {
        if (item) {
            oIngreso.value.id = item.id;
            oIngreso.value.almacen_id = item.almacen_id;
            oIngreso.value.partida_id = item.partida_id;
            oIngreso.value.unidad_id = item.unidad_id;
            oIngreso.value.programa_id = item.programa_id;
            oIngreso.value.codigo = item.codigo;
            oIngreso.value.donacion = item.donacion;
            oIngreso.value.producto_id = item.producto_id;
            oIngreso.value.unidad_medida_id = item.unidad_medida_id;
            oIngreso.value.cantidad = item.cantidad;
            oIngreso.value.costo = item.costo;
            oIngreso.value.total = item.total;
            oIngreso.value.fecha_ingreso = item.fecha_ingreso;
            oIngreso.value._method = "PUT";
            return oIngreso;
        }
        return false;
    };

    const limpiarIngreso = () => {
        oIngreso.value.id = 0;
        oIngreso.value.almacen_id = "";
        oIngreso.value.partida_id = "";
        oIngreso.value.unidad_id = "";
        oIngreso.value.programa_id = "";
        oIngreso.value.codigo = "";
        oIngreso.value.donacion = "";
        oIngreso.value.producto_id = "";
        oIngreso.value.unidad_medida_id = "";
        oIngreso.value.cantidad = "";
        oIngreso.value.costo = "";
        oIngreso.value.total = "";
        oIngreso.value.fecha_ingreso = "";
        oIngreso.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oIngreso,
        getIngresos,
        getIngresosApi,
        saveIngreso,
        deleteIngreso,
        setIngreso,
        limpiarIngreso,
        getIngresosByTipo,
    };
};
