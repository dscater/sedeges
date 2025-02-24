<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Ingreso</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 0.5cm;
            margin-bottom: 0.5cm;
            margin-left: 1.5cm;
            margin-right: 0.5cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            page-break-before: avoid;
        }

        .header img {
            height: 70px;
        }

        .header td {
            vertical-align: middle;
        }

        .pl {
            padding-left: 5px;
        }

        .bold {
            font-weight: bold;
        }

        .centreado {
            text-align: center;
        }

        .text-red {
            color: red;
        }

        table.info {
            margin-top: 3px;
        }

        table.info thead tr th {
            background-color: rgb(245, 245, 245);
        }

        table.info td {
            font-size: 10pt;
        }

        .derecha {
            text-align: right;
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    <table class=header border="1">
        <tbody>
            <tr>
                <td rowspan="2" class="pl" width="13%">
                    {{ $configuracion->first()->alias }}
                </td>
                <td rowspan="2" width="70%" class="centreado">
                    <span class="bold">GOBIERNO AUTÓNOMO DEPARTAMENTAL DE LA PAZ</span><br />
                    CONTROL SOBRE INGRESOS DE MATERIALES AL ALMACÉN <br/>{{ $ingreso->almacen->nombre }}
                </td>
                <td class="pl">ASF-01</td>
            </tr>
            <tr>
                <td class="pl text-red">N° {{ $ingreso->nro_cod }}</td>
            </tr>
        </tbody>
    </table>
    <table border="1" class="info">
        <tbody>
            <tr>
                <td class="pl">PROVEEDOR: <span class="bold">{{ $ingreso->proveedor }}</span></td>
                <td class="pl">CON FONDOS: <span class="bold">{{ $ingreso->con_fondos ?? '' }}</span></td>
            </tr>
            <tr>
                <td class="pl">FECHA DE INGRESO: <span class="bold">{{ $ingreso->fecha_ingreso_t }}</span></td>
                <td class="pl">CON DESTINO: <span class="bold">{{ $ingreso->almacen->nombre }}</span></td>
            </tr>
            <tr>
                <td class="pl">No. FACTURA: <span class="bold">{{ $ingreso->nro_factura ?? '' }}</span></td>
                <td class="pl">DE PEDIDO INTERNO: <span class="bold">{{ $ingreso->pedido_interno ?? '' }}</span>
                </td>
            </tr>
        </tbody>
    </table>
    <table class="info" border="1">
        <thead>
            <tr>
                <th width="7%">Item</th>
                <th width="12%">Cantidad</th>
                <th width="12%">Unidad</th>
                <th>Detalle</th>
                <th width="10%">Precio Unitario</th>
                <th width="10%">Precio Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($ingreso->ingreso_detalles as $key => $item)
                <tr>
                    <td class="centreado">{{ $key + 1 }}</td>
                    <td class="centreado">{{ $item->cantidad }}</td>
                    <td class="centreado">{{ $item->unidad_medida->nombre }}</td>
                    <td class="pl">{{ $item->producto->nombre }}</td>
                    <td class="centreado derecha">{{ $item->costo }}</td>
                    <td class="centreado derecha">{{ $item->total }}</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="5" class="derecha bold">{{ $literal }}</td>
                <td class="derecha bold">{{ $ingreso->total }}</td>
            </tr>
        </tbody>
    </table>
</body>

</html>
