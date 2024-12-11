<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { useIngresos } from "@/composables/ingresos/useIngresos";
import { useProductos } from "@/composables/productos/useProductos";
import Formulario from "../Productos/Formulario.vue";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
const props = defineProps({
    p_almacen_id: {
        type: Number,
        default: 0,
    },
    open_dialog: {
        type: Boolean,
        default: false,
    },
    accion_dialog: {
        type: Number,
        default: 0,
    },
});

const { limpiarProducto } = useProductos();

const obtenerFechaActual = () => {
    const fecha = new Date();
    const anio = fecha.getFullYear();
    const mes = String(fecha.getMonth() + 1).padStart(2, "0"); // Mes empieza desde 0
    const dia = String(fecha.getDate()).padStart(2, "0"); // Día del mes
    return `${anio}-${mes}-${dia}`;
};

const { flash, auth } = usePage().props;

const { oIngreso, limpiarIngreso } = useIngresos();
const accion = ref(props.accion_dialog);
const dialog = ref(props.open_dialog);
let form = useForm(oIngreso.value);
const listAlmacens = ref([]);
const listPartidas = ref([]);
const listProductos = ref([]);
const listUnidadMedidas = ref([]);
const listUnidads = ref([]);
const listProgramas = ref([]);
const oAlmacen = ref(null);
const oUnidad = ref(null);

watch(
    () => props.open_dialog,
    async (newValue) => {
        dialog.value = newValue;
        if (dialog.value) {
            cargarListas();
            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
            form = useForm(oIngreso.value);
            if (auth.user.tipo == "EXTERNO") {
                form.donacion = "SI";
            }
            if (form.id == 0) {
                form.fecha_ingreso = obtenerFechaActual();
            }
            // verificar tipo
            if (auth.user.tipo == "EXTERNO") {
                form.almacen_id = auth.user.almacen_id;
                form.unidad_id = auth.user.unidad_id;
                getInfoAlmacen(form.almacen_id);
                getInfoUnidad(form.unidad_id);
            }
            if (props.p_almacen_id != 0) {
                form.almacen_id = props.p_almacen_id;
                getInfoAlmacen(form.almacen_id);
            }
            if (form.id != 0 && form.almacen_id) {
                getInfoAlmacen(form.almacen_id);
            }
        }
    }
);
watch(
    () => props.accion_dialog,
    (newValue) => {
        accion.value = newValue;
    }
);
watch(
    () => props.p_almacen_id,
    (newValue) => {
        if (newValue != 0) {
            form.almacen_id == props.p_almacen_id;
            getInfoAlmacen(form.almacen_id);
        }
    }
);

const tituloDialog = computed(() => {
    return accion.value == 0
        ? `<i class="fa fa-plus"></i> Agregar Registro`
        : `<i class="fa fa-edit"></i> Editar Registro`;
});

const enviarFormulario = () => {
    let url =
        form["_method"] == "POST"
            ? route("ingresos.store")
            : route("ingresos.update", form.id);

    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            dialog.value = false;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            limpiarIngreso();
            emits("envio-formulario");
        },
        onError: (err) => {
            console.log("ERROR");
            Swal.fire({
                icon: "info",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.error
                        ? err.error
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
        },
    });
};

const emits = defineEmits(["cerrar-dialog", "envio-formulario"]);

watch(dialog, (newVal) => {
    if (!newVal) {
        emits("cerrar-dialog");
    }
});

const cerrarDialog = () => {
    dialog.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
};

const cargarAlmacens = () => {
    axios.get(route("almacens.listadoByUser")).then((response) => {
        listAlmacens.value = response.data.almacens;
    });
};

const cargarPartidas = () => {
    axios.get(route("partidas.listado")).then((response) => {
        listPartidas.value = response.data.partidas;
    });
};

const cargarProductos = () => {
    axios.get(route("productos.listado")).then((response) => {
        listProductos.value = response.data.productos;
    });
};

const cargarUnidadMedidas = () => {
    axios.get(route("unidad_medidas.listado")).then((response) => {
        listUnidadMedidas.value = response.data.unidad_medidas;
    });
};

const cargarUnidads = () => {
    axios.get(route("unidads.listado")).then((response) => {
        listUnidads.value = response.data.unidads;
    });
};

const cargarProgramas = () => {
    axios.get(route("programas.listado")).then((response) => {
        listProgramas.value = response.data.programas;
    });
};

const calculaTotal = () => {
    const costo = form.costo;
    const cantidad = form.cantidad;
    if (costo && cantidad) {
        form.total = cantidad * costo;
        form.total = parseFloat(form.total).toFixed(2);
    } else {
        form.total = 0;
    }
};

const getInfoAlmacen = (id) => {
    form.donacion = "";
    if (!id) {
        oAlmacen.value = null;
        return;
    }
    axios.get(route("almacens.show", id)).then((response) => {
        oAlmacen.value = response.data;
        if (oAlmacen.value.grupo == "CENTROS") {
            form.donacion = "SI";
        }
        console.log(oAlmacen.value);
        console.log(form);
    });
};

const getInfoUnidad = (id) => {
    if (!id) {
        oUnidad.value = null;
        return;
    }
    axios.get(route("unidads.show", id)).then((response) => {
        oUnidad.value = response.data;
    });
};

const accion_dialog = ref(0);
const open_dialog = ref(false);

const agregarProducto = () => {
    limpiarProducto();
    accion_dialog.value = 0;
    open_dialog.value = true;
};

const cargarListas = () => {
    cargarAlmacens();
    cargarPartidas();
    cargarProductos();
    cargarUnidadMedidas();
    cargarUnidads();
    cargarProgramas();
};

onMounted(() => {});
</script>

<template>
    <div
        class="modal fade"
        :class="{
            show: dialog,
        }"
        id="modal-dialog-form"
        :style="{
            display: dialog ? 'block' : 'none',
        }"
    >
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title" v-html="tituloDialog"></h4>
                    <button
                        type="button"
                        class="btn-close"
                        @click="cerrarDialog()"
                    ></button>
                </div>
                <div class="modal-body">
                    <form @submit.prevent="enviarFormulario()">
                        <div class="row">
                            <template
                                v-if="
                                    (auth.user.tipo == 'INTERNO' ||
                                        auth.user.id == 1) &&
                                    props.p_almacen_id == 0
                                "
                            >
                                <div class="col-md-4">
                                    <label>Seleccionar almacén*</label>
                                    <el-select
                                        class="w-100"
                                        placeholder="- Seleccione -"
                                        :class="{
                                            'border border-red rounded':
                                                form.errors?.almacen_id,
                                        }"
                                        v-model="form.almacen_id"
                                        filterable
                                        @change="getInfoAlmacen"
                                    >
                                        <el-option value=""
                                            >- Seleccione -</el-option
                                        >
                                        <el-option
                                            v-for="item in listAlmacens"
                                            :value="item.id"
                                            :label="item.nombre"
                                        >
                                            {{ item.nombre }}
                                        </el-option>
                                    </el-select>
                                    <ul
                                        v-if="form.errors?.almacen_id"
                                        class="parsley-errors-list filled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.almacen_id }}
                                        </li>
                                    </ul>
                                </div>
                                <!-- unidad -->
                                <div
                                    class="col-md-4"
                                    v-if="oAlmacen?.grupo == 'CENTROS'"
                                >
                                    <label>Seleccionar Unidad/Centro*</label>
                                    <el-select
                                        class="w-100"
                                        placeholder="- Seleccione -"
                                        :class="{
                                            'border border-red rounded':
                                                form.errors?.unidad_id,
                                        }"
                                        v-model="form.unidad_id"
                                        filterable
                                    >
                                        <el-option value=""
                                            >- Seleccione -</el-option
                                        >
                                        <el-option
                                            v-for="item in listUnidads"
                                            :value="item.id"
                                            :label="item.nombre"
                                        >
                                            {{ item.nombre }}
                                        </el-option>
                                    </el-select>
                                    <ul
                                        v-if="form.errors?.unidad_id"
                                        class="parsley-errors-list filled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.unidad_id }}
                                        </li>
                                    </ul>
                                </div>
                            </template>
                            <template v-else>
                                <div class="col-md-4">
                                    <label>Almacén:</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        :value="oAlmacen?.nombre"
                                        readonly
                                    />
                                    <ul
                                        v-if="form.errors?.almacen_id"
                                        class="parsley-errors-list filled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.almacen_id }}
                                        </li>
                                    </ul>
                                </div>

                                <!-- unidad -->
                                <div
                                    class="col-md-4"
                                    v-if="
                                        oAlmacen?.grupo == 'CENTROS' &&
                                        (auth.user.tipo == 'INTERNO' ||
                                            auth.user.id == 1)
                                    "
                                >
                                    <label>Seleccionar Unidad/Centro*</label>
                                    <el-select
                                        class="w-100"
                                        placeholder="- Seleccione -"
                                        :class="{
                                            'border border-red rounded':
                                                form.errors?.unidad_id,
                                        }"
                                        v-model="form.unidad_id"
                                        filterable
                                    >
                                        <el-option value=""
                                            >- Seleccione -</el-option
                                        >
                                        <el-option
                                            v-for="item in listUnidads"
                                            :value="item.id"
                                            :label="item.nombre"
                                        >
                                            {{ item.nombre }}
                                        </el-option>
                                    </el-select>
                                    <ul
                                        v-if="form.errors?.unidad_id"
                                        class="parsley-errors-list filled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.unidad_id }}
                                        </li>
                                    </ul>
                                </div>

                                <template v-else>
                                    <!-- unidad text -->
                                    <div
                                        class="col-md-4"
                                        v-if="oAlmacen?.grupo == 'CENTROS'"
                                    >
                                        <label
                                            >Seleccionar Unidad/Centro*</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            :value="oUnidad?.nombre"
                                            readonly
                                        />
                                        <ul
                                            v-if="form.errors?.unidad_id"
                                            class="parsley-errors-list filled"
                                        >
                                            <li class="parsley-required">
                                                {{ form.errors?.unidad_id }}
                                            </li>
                                        </ul>
                                    </div>
                                </template>
                            </template>
                            <div
                                class="col-md-8"
                                v-if="auth.user.tipo != 'EXTERNO'"
                            >
                                <label>Seleccionar partida*</label>
                                <el-select
                                    class="w-100"
                                    placeholder="- Seleccione -"
                                    :class="{
                                        'border border-red rounded':
                                            form.errors?.partida_id,
                                    }"
                                    v-model="form.partida_id"
                                    filterable
                                >
                                    <el-option value=""
                                        >- Seleccione -</el-option
                                    >
                                    <el-option
                                        v-for="item in listPartidas"
                                        :value="item.id"
                                        :label="
                                            item.nro_partida +
                                            ' - ' +
                                            item.nombre
                                        "
                                    >
                                        {{ item.nro_partida }} -
                                        {{ item.nombre }}
                                    </el-option>
                                </el-select>
                                <ul
                                    v-if="form.errors?.partida_id"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.partida_id }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-4"
                                v-if="oAlmacen?.grupo != 'CENTROS'"
                            >
                                <label>Donación*</label>
                                <select
                                    class="form-control"
                                    :class="{
                                        'parsley-error': form.errors?.donacion,
                                    }"
                                    v-model="form.donacion"
                                >
                                    <option value="">- Seleccione -</option>
                                    <option
                                        v-for="item in ['NO', 'SI']"
                                        :value="item"
                                    >
                                        {{ item }}
                                    </option>
                                </select>
                                <ul
                                    v-if="form.errors?.donacion"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.donacion }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Seleccionar producto * </label>
                                <div class="input-group mb-3">
                                    <div class="flex-1">
                                        <el-select
                                            class="w-100 rounded-0"
                                            placeholder="- Seleccione -"
                                            :class="{
                                                'border border-red':
                                                    form.errors?.producto_id,
                                            }"
                                            v-model="form.producto_id"
                                            filterable
                                        >
                                            <el-option value=""
                                                >- Seleccione -</el-option
                                            >
                                            <el-option
                                                v-for="item in listProductos"
                                                :value="item.id"
                                                :label="item.nombre"
                                            >
                                                {{ item.nombre }}
                                            </el-option>
                                        </el-select>
                                    </div>
                                    <button
                                        v-if="
                                            auth?.user.permisos == '*' ||
                                            auth?.user.permisos.includes(
                                                'productos.create'
                                            )
                                        "
                                        type="button"
                                        class="btn btn-sm btn-outline-primary rounded-0"
                                        @click="agregarProducto"
                                    >
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                                <ul
                                    v-if="form.errors?.producto_id"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.producto_id }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Seleccionar unidad de medida*</label>
                                <el-select
                                    class="w-100"
                                    placeholder="- Seleccione -"
                                    :class="{
                                        'border border-red rounded':
                                            form.errors?.unidad_medida_id,
                                    }"
                                    v-model="form.unidad_medida_id"
                                    filterable
                                >
                                    <el-option value=""
                                        >- Seleccione -</el-option
                                    >
                                    <el-option
                                        v-for="item in listUnidadMedidas"
                                        :value="item.id"
                                        :label="item.nombre"
                                    >
                                        {{ item.nombre }}
                                    </el-option>
                                </el-select>
                                <ul
                                    v-if="form.errors?.unidad_medida_id"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.unidad_medida_id }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Cantidad*</label>
                                <input
                                    type="number"
                                    step="1"
                                    class="form-control"
                                    :class="{
                                        'parsley-error': form.errors?.cantidad,
                                    }"
                                    v-model="form.cantidad"
                                    @keyup="calculaTotal"
                                />
                                <ul
                                    v-if="form.errors?.cantidad"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.cantidad }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Costo/Unidad*</label>
                                <input
                                    type="number"
                                    step="1"
                                    class="form-control"
                                    :class="{
                                        'parsley-error': form.errors?.costo,
                                    }"
                                    v-model="form.costo"
                                    @keyup="calculaTotal"
                                />
                                <ul
                                    v-if="form.errors?.costo"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.costo }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Total*</label>
                                <input
                                    type="number"
                                    step="0.01"
                                    class="form-control"
                                    :class="{
                                        'parsley-error': form.errors?.total,
                                    }"
                                    v-model="form.total"
                                    readonly
                                />
                                <ul
                                    v-if="form.errors?.total"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.total }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Fecha de ingreso*</label>
                                <input
                                    type="date"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors?.fecha_ingreso,
                                    }"
                                    v-model="form.fecha_ingreso"
                                />
                                <ul
                                    v-if="form.errors?.fecha_ingreso"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.fecha_ingreso }}
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a
                        href="javascript:;"
                        class="btn btn-white"
                        @click="cerrarDialog()"
                        ><i class="fa fa-times"></i> Cerrar</a
                    >
                    <button
                        type="button"
                        @click="enviarFormulario()"
                        class="btn btn-primary"
                    >
                        <i class="fa fa-save"></i>
                        Guardar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <Formulario
        :open_dialog="open_dialog"
        :accion_dialog="accion_dialog"
        @envio-formulario="cargarProductos"
        :oculta_fondo="false"
        :url="route('productos.storeJson')"
        @cerrar-dialog="open_dialog = false"
    ></Formulario>
</template>
