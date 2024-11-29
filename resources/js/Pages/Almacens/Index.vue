<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, usePage } from "@inertiajs/vue3";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, onBeforeUnmount } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
const { props: props_page } = usePage();
const propsParams = defineProps({
    almacen: {
        type: Object,
        default: null,
    },
});

const { setLoading } = useApp();

const columns = [
    {
        title: "",
        data: "nro",
    },
    {
        title: "NOMBRE PRODUCTO",
        data: "nombre",
    },
    {
        title: "CANT. INGRESOS",
        data: "ingresos",
    },
    {
        title: "CANT. EGRESOS",
        data: "egresos",
    },
    {
        title: "STOCK ACTUAL",
        data: "stock",
    },
    {
        title: "TOTAL BS.",
        data: "total_bs",
    },
];
const loading = ref(false);

const accionesRow = () => {
    // editar
    $("#table-producto").on("click", "button.editar", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("productos.show", id)).then((response) => {
            setProducto(response.data);
            accion_dialog.value = 1;
            open_dialog.value = true;
        });
    });
};

var datatable = null;
const datatableInitialized = ref(false);
const updateDatatable = () => {
    datatable.ajax.reload();
};

onMounted(async () => {
    datatable = initDataTable(
        "#table-producto",
        columns,
        route("almacens.productos", propsParams.almacen.id)
    );
    datatableInitialized.value = true;
    accionesRow();
});
onBeforeUnmount(() => {
    if (datatable) {
        datatable.clear();
        datatable.destroy(false); // Destruye la instancia del DataTable
        datatable = null;
        datatableInitialized.value = false;
    }
});
</script>
<template>
    <Head title=""></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active"></li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header"></h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-heading -->
                <div class="panel-heading">
                    <h4 class="panel-title btn-nuevo">
                        <button
                            v-if="
                                props_page.auth?.user.permisos == '*' ||
                                props_page.auth?.user.permisos.includes(
                                    'productos.create'
                                )
                            "
                            type="button"
                            class="btn btn-primary"
                            @click="agregarRegistro"
                        >
                            <i class="fa fa-plus"></i> Nuevo
                        </button>
                    </h4>
                    <panel-toolbar
                        :mostrar_loading="loading"
                        @loading="updateDatatable"
                    />
                </div>
                <!-- END panel-heading -->
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <table
                        id="table-producto"
                        width="100%"
                        class="table table-striped table-bordered align-middle text-nowrap tabla_datos"
                    >
                        <thead>
                            <tr>
                                <th width="2%"></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
                <!-- END panel-body -->
            </div>
            <!-- END panel -->
        </div>
    </div>
</template>
