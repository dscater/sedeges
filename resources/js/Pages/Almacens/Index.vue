<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, usePage } from "@inertiajs/vue3";
import { useIngresos } from "@/composables/ingresos/useIngresos";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, onBeforeUnmount } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
const { props: props_page } = usePage();
const propsParams = defineProps({
    almacens: {
        type: Array,
        default: [],
    },
    grupo: {
        type: String,
        default: "",
    },
});

const { setLoading } = useApp();
onMounted(async () => {});
onBeforeUnmount(() => {});
</script>
<template>
    <Head title=""></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">{{ propsParams.grupo }}</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header"></h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-4" v-for="item in propsParams.almacens">
            <!-- BEGIN panel -->
            <a href="" class="panel panel-inverse">
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <h4 class="w-100 text-center">{{ item.nombre }}</h4>
                </div>
                <!-- END panel-body -->
            </a>
            <!-- END panel -->
        </div>
    </div>
</template>
