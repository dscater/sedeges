<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, usePage } from "@inertiajs/vue3";
import { ref, onMounted, onBeforeUnmount } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
const { user, url_assets } = usePage().props;
const form = ref({
    almacen_id: "",
    partida_id: "",
});

const listAlmacens = ref([]);
const listPartidas = ref([]);

const cargarAlmacens = () => {
    axios.get(route("almacens.listado")).then((response) => {
        listAlmacens.value = response.data.almacens;
    });
};

const cargarPartidas = () => {
    axios.get(route("partidas.listado")).then((response) => {
        listPartidas.value = response.data.partidas;
    });
};

const loading = ref(false);
const cargandoRegistros = ref(false);
const listIngresos = ref([]);
const cargarIngresoAlmacenPartida = () => {
    if (form.value.almacen_id && form.value.partida_id) {
        cargandoRegistros.value = true;
        axios
            .get(route("ingresos.almacen_partida"), {
                params: form.value,
            })
            .then((response) => {
                cargandoRegistros.value = false;
                listIngresos.value = response.data;
            })
            .catch((error) => {
                cargandoRegistros.value = false;
                console.log("ERROR");
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    text: `Ocurrió un error al intentar cargar los registros, intente mas tarde.`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
            });
    } else {
        listIngresos.value = [];
    }
};

const intervalKeyup = ref(null);
const spin = ref(null);
const detectaKeyUpCantidad = async (e, index) => {
    let value = e.target.value;
    let oIngreso = listIngresos.value[index];
    spin.value = document.getElementById("spin" + index);
    clearInterval(intervalKeyup.value);
    spin.value.classList.remove("oculto");
    if (value && value > 0 && value <= oIngreso.cantidad) {
        intervalKeyup.value = setTimeout(async () => {
            const res = await actualizaCantidad(value, oIngreso.egreso.id);
            if (res) {
                listIngresos.value[index].egreso = res;
                spin.value.classList.add("oculto");
            }
        }, 700);
    } else {
        spin.value.classList.add("oculto");
        $.gritter.add({
            title: "Error",
            text:
                "Debes ingresar una cantidad mayor a 0 y menor o igual a " +
                oIngreso.cantidad,
            image: url_assets + "imgs/error.png",
            sticky: false,
            time: 1300,
            class_name: "my-sticky-class",
        });
    }
};

const actualizaCantidad = async (value, id) => {
    try {
        const response = await axios.post(
            route("egresos.update", id),
            {
                _method: "put",
                cantidad: value,
            },
            {
                headers: { Accept: "application/json" },
            }
        );
        if (response) {
            $.gritter.add({
                title: "Registro actualizado",
                text: "",
                image: url_assets + "imgs/check.png",
                sticky: false,
                time: 1000,
                class_name: "my-sticky-class",
            });
        }
        return response.data;
    } catch (error) {
        console.log(error);
        $.gritter.add({
            title: "No se pudo actualizar el registro",
            text: "",
            image: url_assets + "imgs/error.png",
            sticky: false,
            time: 1000,
            class_name: "my-sticky-class",
        });
    }
};

onMounted(async () => {
    cargarAlmacens();
    cargarPartidas();
});
onBeforeUnmount(() => {});
</script>
<template>
    <Head title="Egresos"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">Egresos</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Egresos</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-heading -->
                <div class="panel-heading">
                    <h4 class="panel-title btn-nuevo"></h4>
                    <panel-toolbar :mostrar_loading="loading" />
                </div>
                <!-- END panel-heading -->
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label>Seleccionar almacén</label>
                            <select
                                class="form-control"
                                :class="{
                                    'parsley-error': form.errors?.almacen_id,
                                }"
                                v-model="form.almacen_id"
                                @change="cargarIngresoAlmacenPartida"
                            >
                                <option value="">- Seleccione -</option>
                                <option
                                    v-for="item in listAlmacens"
                                    :value="item.id"
                                >
                                    {{ item.nombre }}
                                </option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Seleccionar partida</label>
                            <select
                                class="form-control"
                                :class="{
                                    'parsley-error': form.errors?.partida_id,
                                }"
                                v-model="form.partida_id"
                                @change="cargarIngresoAlmacenPartida"
                            >
                                <option value="">- Seleccione -</option>
                                <option
                                    v-for="item in listPartidas"
                                    :value="item.id"
                                >
                                    {{ item.nombre }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="overflow: auto">
                            <table class="table table-bordered mitabla mt-3">
                                <thead>
                                    <tr>
                                        <th rowspan="2">N°</th>
                                        <th rowspan="2">CÓDIGO</th>
                                        <th rowspan="2">UNIDAD</th>
                                        <th rowspan="2">DESCRIPCIÓN</th>
                                        <th rowspan="2">FECHA INGRESO</th>
                                        <th colspan="3" class="text-center bg1">
                                            INGRESO ALMACENES
                                        </th>
                                        <th colspan="3" class="text-center bg2">
                                            SALIDA ALMACENES
                                        </th>
                                        <th colspan="3" class="text-center bg3">
                                            SALDO
                                        </th>
                                    </tr>
                                    <tr>
                                        <th class="bg1">CANT.</th>
                                        <th class="bg1">C/U</th>
                                        <th class="bg1">TOTAL BS.</th>
                                        <th class="bg2">CANT.</th>
                                        <th class="bg2">C/U</th>
                                        <th class="bg2">TOTAL BS.</th>
                                        <th class="bg3">CANT.</th>
                                        <th class="bg3">C/U</th>
                                        <th class="bg3">TOTAL BS.</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template
                                        v-if="
                                            !cargandoRegistros &&
                                            listIngresos.length > 0
                                        "
                                    >
                                        <tr
                                            v-for="(
                                                item, index
                                            ) in listIngresos"
                                        >
                                            <td>{{ index + 1 }}</td>
                                            <td>{{ item.codigo }}</td>
                                            <td>
                                                {{ item.unidad_medida.nombre }}
                                            </td>
                                            <td>{{ item.producto.nombre }}</td>
                                            <td>{{ item.fecha_ingreso_t }}</td>
                                            <td class="bg1">
                                                {{ item.cantidad }}
                                            </td>
                                            <td class="bg1">
                                                {{ item.costo }}
                                            </td>
                                            <td class="bg1">
                                                {{ item.total }}
                                            </td>
                                            <td class="bg2 text-center">
                                                <input
                                                    type="number"
                                                    class="form-control"
                                                    v-model="
                                                        item.egreso.cantidad
                                                    "
                                                    @keyup="
                                                        detectaKeyUpCantidad(
                                                            $event,
                                                            index
                                                        )
                                                    "
                                                />
                                                <i
                                                    class="fa fa-spin fa-spinner oculto"
                                                    :id="'spin' + index"
                                                ></i>
                                            </td>
                                            <td class="bg2">
                                                {{ item.egreso.costo }}
                                            </td>
                                            <td class="bg2">
                                                {{ item.egreso.total }}
                                            </td>
                                            <td class="bg3">
                                                {{ item.egreso.s_cantidad }}
                                            </td>
                                            <td class="bg3">
                                                {{ item.costo }}
                                            </td>
                                            <td class="bg3">
                                                {{ item.egreso.s_total }}
                                            </td>
                                        </tr>
                                    </template>
                                    <tr v-if="cargandoRegistros">
                                        <td colspan="8">
                                            Obteniendo registros...
                                        </td>
                                    </tr>
                                    <tr
                                        v-if="
                                            listIngresos.length == 0 &&
                                            !cargandoRegistros
                                        "
                                    >
                                        <td colspan="8">
                                            No se encontrarón registros...
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- END panel-body -->
            </div>
            <!-- END panel -->
        </div>
    </div>
</template>
<style scoped>
.bg1 {
    background-color: rgb(176, 248, 209);
}
.bg2 {
    background-color: rgb(253, 229, 222);
}
.bg3 {
    background-color: rgb(222, 232, 253);
}
.oculto {
    display: none;
}
</style>
