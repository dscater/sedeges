-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-12-2024 a las 23:22:31
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sedeges_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacens`
--

CREATE TABLE `almacens` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grupo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacens`
--

INSERT INTO `almacens` (`id`, `nombre`, `grupo`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'ALMACÉN CENTRAL', 'CENTRAL', 'UNICO ALMACEN', NULL, NULL, NULL),
(2, 'ALMACÉN FARMACIAS', 'FARMACIAS', 'UNICO ALMACEN', NULL, NULL, NULL),
(3, 'ALM PROGRAMA 1', 'PROGRAMAS', NULL, '2024-12-11', '2024-12-11 17:49:19', '2024-12-11 17:49:19'),
(4, 'ALM CENTRO 1', 'CENTROS', NULL, '2024-12-11', '2024-12-11 17:53:33', '2024-12-11 17:53:33'),
(5, 'ALM CENTRO 2', 'CENTROS', NULL, '2024-12-11', '2024-12-11 19:53:21', '2024-12-11 19:53:21'),
(6, 'ALM CENTRO 3', 'CENTROS', NULL, '2024-12-11', '2024-12-11 19:53:27', '2024-12-11 19:53:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'JEFE DE UNIDAD', '2024-11-26 00:58:53', '2024-12-05 23:15:37'),
(2, 'RESPONSABLE DE ALMACÉN', '2024-11-26 02:36:26', '2024-12-05 23:16:05'),
(3, 'AUXILIAR DE ALMACÉN', '2024-12-05 23:16:46', '2024-12-05 23:16:46'),
(4, 'RESPONSABLE DEL ÁREA DE SALUD', '2024-12-05 23:17:41', '2024-12-05 23:17:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `razon_social`, `alias`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SEDEGES', 'SEDEGES', 'logo.png', '2024-11-09 18:47:19', '2024-12-06 00:09:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_id` bigint UNSIGNED DEFAULT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `partida_id` bigint UNSIGNED DEFAULT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `destino_id` bigint UNSIGNED DEFAULT NULL,
  `cantidad` int NOT NULL,
  `costo` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `editable` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`id`, `ingreso_id`, `almacen_id`, `partida_id`, `producto_id`, `destino_id`, `cantidad`, `costo`, `total`, `fecha_registro`, `editable`, `created_at`, `updated_at`) VALUES
(1, 12, 1, 3, 3, 4, 40, 8.00, 320.00, '2024-12-11', 0, '2024-12-11 19:51:53', '2024-12-11 21:56:22'),
(2, 11, 1, 3, 5, 5, 20, 12.00, 240.00, '2024-12-11', 0, '2024-12-11 19:51:53', '2024-12-11 21:00:44'),
(3, 10, 1, 3, 2, 4, 5, 14.00, 70.00, '2024-12-11', 0, '2024-12-11 19:51:53', '2024-12-11 22:01:23'),
(4, 9, 1, 3, 1, NULL, 24, 6.80, 163.20, '2024-12-11', 1, '2024-12-11 19:51:53', '2024-12-11 19:51:53'),
(5, 8, 1, 3, 5, NULL, 10, 12.00, 120.00, '2024-12-11', 1, '2024-12-11 19:51:53', '2024-12-11 19:51:53'),
(6, 4, 1, 3, 3, NULL, 4, 6.00, 24.00, '2024-12-11', 1, '2024-12-11 19:51:53', '2024-12-11 19:51:53'),
(7, 3, 1, 3, 4, NULL, 10, 8.00, 80.00, '2024-12-11', 1, '2024-12-11 19:51:53', '2024-12-11 19:51:53'),
(8, 2, 1, 3, 2, NULL, 5, 20.00, 100.00, '2024-12-11', 1, '2024-12-11 19:51:53', '2024-12-11 19:51:53'),
(9, 1, 1, 3, 1, NULL, 4, 18.50, 74.00, '2024-12-11', 1, '2024-12-11 19:51:53', '2024-12-11 19:51:53'),
(10, 7, 1, 6, 10, NULL, 6, 38.00, 228.00, '2024-12-11', 1, '2024-12-11 21:57:38', '2024-12-11 21:57:38'),
(11, 6, 1, 6, 11, NULL, 2, 40.00, 80.00, '2024-12-11', 1, '2024-12-11 21:57:38', '2024-12-11 21:57:38'),
(12, 5, 1, 6, 10, NULL, 3, 80.00, 240.00, '2024-12-11', 1, '2024-12-11 21:57:38', '2024-12-11 21:57:38'),
(13, 13, 4, 3, 2, NULL, 20, 18.00, 360.00, '2024-12-11', 0, '2024-12-11 22:15:58', '2024-12-11 22:19:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 1<br/>nro_partida: 111<br/>nombre: PARTIDA 1<br/>abreviatura: PAU<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:12:44<br/>updated_at: 2024-11-28 15:12:56<br/>', 'id: 1<br/>nro_partida: 31110<br/>nombre: GASTOS POR REFRIGERIOS AL PERSONAL PERMANENTE<br/>abreviatura: GRP<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:12:44<br/>updated_at: 2024-12-05 19:08:41<br/>', 'PARTIDAS', '2024-12-05', '19:08:41', '2024-12-05 23:08:41', '2024-12-05 23:08:41'),
(2, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 2<br/>nro_partida: 222<br/>nombre: PARTIDA 2<br/>abreviatura: PAD<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:13:07<br/>updated_at: 2024-11-28 15:13:07<br/>', 'id: 2<br/>nro_partida: 31120<br/>nombre: GASTOS POR ALIMENTACIÓN Y OTROS SIMILARES<br/>abreviatura: GAO<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:13:07<br/>updated_at: 2024-12-05 19:09:15<br/>', 'PARTIDAS', '2024-12-05', '19:09:15', '2024-12-05 23:09:15', '2024-12-05 23:09:15'),
(3, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 3<br/>nro_partida: 42000<br/>nombre: ALIMENTOS<br/>abreviatura: ALI<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 18:38:46<br/>updated_at: 2024-12-05 18:38:46<br/>', 'id: 3<br/>nro_partida: 311130<br/>nombre: ALIMENTACIÓN COMPLEMENTARIA ESCOLAR<br/>abreviatura: ALI<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 18:38:46<br/>updated_at: 2024-12-05 19:09:42<br/>', 'PARTIDAS', '2024-12-05', '19:09:42', '2024-12-05 23:09:42', '2024-12-05 23:09:42'),
(4, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PARTIDA', 'id: 4<br/>nro_partida: 31140<br/>nombre: ALIMENTACIÓN HOSPITALARIA<br/>abreviatura: AH<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:10:17<br/>updated_at: 2024-12-05 19:10:17<br/>', NULL, 'PARTIDAS', '2024-12-05', '19:10:17', '2024-12-05 23:10:17', '2024-12-05 23:10:17'),
(5, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PARTIDA', 'id: 5<br/>nro_partida: 31150<br/>nombre: ALIMENTOS Y BEBIDAS PARA LA ATENCIÓN DE EMERGENCIAS<br/>abreviatura: ABA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:11:01<br/>updated_at: 2024-12-05 19:11:01<br/>', NULL, 'PARTIDAS', '2024-12-05', '19:11:01', '2024-12-05 23:11:01', '2024-12-05 23:11:01'),
(6, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PARTIDA', 'id: 6<br/>nro_partida: 31200<br/>nombre: ALIMENTOS PARA ANIMALES<br/>abreviatura: AAN<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:11:28<br/>updated_at: 2024-12-05 19:11:28<br/>', NULL, 'PARTIDAS', '2024-12-05', '19:11:28', '2024-12-05 23:11:28', '2024-12-05 23:11:28'),
(7, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PARTIDA', 'id: 7<br/>nro_partida: 31300<br/>nombre: PRODUCTOS AGRÍCOLAS, PECUARIOS Y FORESTALES<br/>abreviatura: PAP<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:12:14<br/>updated_at: 2024-12-05 19:12:14<br/>', NULL, 'PARTIDAS', '2024-12-05', '19:12:14', '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(8, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PARTIDA', 'id: 8<br/>nro_partida: 32100<br/>nombre: PAPEL<br/>abreviatura: PEL<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:12:49<br/>updated_at: 2024-12-05 19:12:49<br/>', NULL, 'PARTIDAS', '2024-12-05', '19:12:49', '2024-12-05 23:12:49', '2024-12-05 23:12:49'),
(9, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PARTIDA', 'id: 9<br/>nro_partida: 32200<br/>nombre: PRODUCTOS DE ARTES GRÁFICAS<br/>abreviatura: PAG<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:13:13<br/>updated_at: 2024-12-05 19:13:13<br/>', NULL, 'PARTIDAS', '2024-12-05', '19:13:13', '2024-12-05 23:13:13', '2024-12-05 23:13:13'),
(10, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD DE MEDIDA', 'id: 4<br/>nombre: HOJA<br/>abreviatura: H<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:13:50<br/>updated_at: 2024-12-05 19:13:50<br/>', NULL, 'UNIDADES DE MEDIDA', '2024-12-05', '19:13:50', '2024-12-05 23:13:50', '2024-12-05 23:13:50'),
(11, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD DE MEDIDA', 'id: 5<br/>nombre: JUEGO<br/>abreviatura: J<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:14:02<br/>updated_at: 2024-12-05 19:14:02<br/>', NULL, 'UNIDADES DE MEDIDA', '2024-12-05', '19:14:02', '2024-12-05 23:14:02', '2024-12-05 23:14:02'),
(12, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD DE MEDIDA', 'id: 6<br/>nombre: PAQUETE<br/>abreviatura: PQ<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:14:15<br/>updated_at: 2024-12-05 19:14:15<br/>', NULL, 'UNIDADES DE MEDIDA', '2024-12-05', '19:14:15', '2024-12-05 23:14:15', '2024-12-05 23:14:15'),
(13, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD DE MEDIDA', 'id: 7<br/>nombre: PARES DUAL<br/>abreviatura: PD<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:14:25<br/>updated_at: 2024-12-05 19:14:25<br/>', NULL, 'UNIDADES DE MEDIDA', '2024-12-05', '19:14:25', '2024-12-05 23:14:25', '2024-12-05 23:14:25'),
(14, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD DE MEDIDA', 'id: 8<br/>nombre: PIEZA<br/>abreviatura: PZ<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:14:33<br/>updated_at: 2024-12-05 19:14:33<br/>', NULL, 'UNIDADES DE MEDIDA', '2024-12-05', '19:14:33', '2024-12-05 23:14:33', '2024-12-05 23:14:33'),
(15, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD DE MEDIDA', 'id: 9<br/>nombre: CAJA<br/>abreviatura: CJ<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:14:52<br/>updated_at: 2024-12-05 19:14:52<br/>', NULL, 'UNIDADES DE MEDIDA', '2024-12-05', '19:14:52', '2024-12-05 23:14:52', '2024-12-05 23:14:52'),
(16, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD DE MEDIDA', 'id: 10<br/>nombre: ROLLO<br/>abreviatura: RO<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:15:04<br/>updated_at: 2024-12-05 19:15:04<br/>', NULL, 'UNIDADES DE MEDIDA', '2024-12-05', '19:15:04', '2024-12-05 23:15:04', '2024-12-05 23:15:04'),
(17, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UN CARGO', 'id: 1<br/>nombre: CARGO 1<br/>created_at: 2024-11-25 20:58:53<br/>updated_at: 2024-11-25 22:36:18<br/>', 'id: 1<br/>nombre: JEFE DE UNIDAD<br/>created_at: 2024-11-25 20:58:53<br/>updated_at: 2024-12-05 19:15:37<br/>', 'CARGOS', '2024-12-05', '19:15:37', '2024-12-05 23:15:37', '2024-12-05 23:15:37'),
(18, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UN CARGO', 'id: 2<br/>nombre: CARGO 2<br/>created_at: 2024-11-25 22:36:26<br/>updated_at: 2024-11-25 22:36:26<br/>', 'id: 2<br/>nombre: RESPONSABLE DE ALMACÉN<br/>created_at: 2024-11-25 22:36:26<br/>updated_at: 2024-12-05 19:16:05<br/>', 'CARGOS', '2024-12-05', '19:16:05', '2024-12-05 23:16:05', '2024-12-05 23:16:05'),
(19, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN CARGO', 'id: 3<br/>nombre: AUXILIAR DE ALMACÉN<br/>created_at: 2024-12-05 19:16:46<br/>updated_at: 2024-12-05 19:16:46<br/>', NULL, 'CARGOS', '2024-12-05', '19:16:46', '2024-12-05 23:16:46', '2024-12-05 23:16:46'),
(20, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN CARGO', 'id: 4<br/>nombre: RESPONSABLE DEL ÁREA DE SALUD<br/>created_at: 2024-12-05 19:17:41<br/>updated_at: 2024-12-05 19:17:41<br/>', NULL, 'CARGOS', '2024-12-05', '19:17:41', '2024-12-05 23:17:41', '2024-12-05 23:17:41'),
(21, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA UNIDAD', 'id: 1<br/>nombre: UNIDAD 1<br/>sigla: U<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-12-05 18:40:14<br/>', 'id: 1<br/>nombre: UNIDAD ADMINISTRATIVA FINACIERA<br/>sigla: UAF<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-12-05 19:19:27<br/>', 'UNIDADES', '2024-12-05', '19:19:27', '2024-12-05 23:19:27', '2024-12-05 23:19:27'),
(22, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA UNIDAD', 'id: 2<br/>nombre: UNIDAD 2<br/>sigla: U2<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 22:31:08<br/>updated_at: 2024-12-05 18:40:24<br/>', 'id: 2<br/>nombre: ÁREA DE PRESUPUESTOS<br/>sigla: ADP<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 22:31:08<br/>updated_at: 2024-12-05 19:19:56<br/>', 'UNIDADES', '2024-12-05', '19:19:56', '2024-12-05 23:19:56', '2024-12-05 23:19:56'),
(23, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD', 'id: 4<br/>nombre: UNIDAD DE SALUD<br/>sigla: UDS<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:20:22<br/>updated_at: 2024-12-05 19:20:22<br/>', NULL, 'UNIDADES', '2024-12-05', '19:20:22', '2024-12-05 23:20:22', '2024-12-05 23:20:22'),
(24, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD', 'id: 5<br/>nombre: SECCIÓN DE ALAMCENES<br/>sigla: SDA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:21:08<br/>updated_at: 2024-12-05 19:21:08<br/>', NULL, 'UNIDADES', '2024-12-05', '19:21:08', '2024-12-05 23:21:08', '2024-12-05 23:21:08'),
(25, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD', 'id: 6<br/>nombre: CENTRO DE ACOGIDA FÉLIX MÉNDEZ ARCOS<br/>sigla: CAFMA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:21:41<br/>updated_at: 2024-12-05 19:21:41<br/>', NULL, 'UNIDADES', '2024-12-05', '19:21:41', '2024-12-05 23:21:41', '2024-12-05 23:21:41'),
(26, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD', 'id: 7<br/>nombre: CENTRO DE ACOGIDA JOSÉ SORIA<br/>sigla: CAJS<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:22:04<br/>updated_at: 2024-12-05 19:22:04<br/>', NULL, 'UNIDADES', '2024-12-05', '19:22:04', '2024-12-05 23:22:04', '2024-12-05 23:22:04'),
(27, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD', 'id: 8<br/>nombre: CENTRO DE ACOGIDA NIÑO JESUS<br/>sigla: CANJ<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:22:27<br/>updated_at: 2024-12-05 19:22:27<br/>', NULL, 'UNIDADES', '2024-12-05', '19:22:27', '2024-12-05 23:22:27', '2024-12-05 23:22:27'),
(28, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA UNIDAD', 'id: 9<br/>nombre: CENTRO DE ACOGIDA ROSAURA CAMPOS<br/>sigla: CARC<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:22:51<br/>updated_at: 2024-12-05 19:22:51<br/>', NULL, 'UNIDADES', '2024-12-05', '19:22:51', '2024-12-05 23:22:51', '2024-12-05 23:22:51'),
(29, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 1<br/>nombre: ARROZ ESTAQUILLA GRANO DE ORO BOLSA DE 46 KILOS<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:25:25<br/>updated_at: 2024-12-05 19:25:25<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:25:25', '2024-12-05 23:25:25', '2024-12-05 23:25:25'),
(30, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 2<br/>nombre: ATUN (LOMITO)<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:25:35<br/>updated_at: 2024-12-05 19:25:35<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:25:35', '2024-12-05 23:25:35', '2024-12-05 23:25:35'),
(31, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 3<br/>nombre: AVENA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:25:46<br/>updated_at: 2024-12-05 19:25:46<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:25:46', '2024-12-05 23:25:46', '2024-12-05 23:25:46'),
(32, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 4<br/>nombre: AZUCAR GRANULADO<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:25:56<br/>updated_at: 2024-12-05 19:25:56<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:25:56', '2024-12-05 23:25:56', '2024-12-05 23:25:56'),
(33, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 5<br/>nombre: CAFE MOLIDO<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:26:07<br/>updated_at: 2024-12-05 19:26:07<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:26:07', '2024-12-05 23:26:07', '2024-12-05 23:26:07'),
(34, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 6<br/>nombre: CANELA ENTERA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:26:17<br/>updated_at: 2024-12-05 19:26:17<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:26:17', '2024-12-05 23:26:17', '2024-12-05 23:26:17'),
(35, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 7<br/>nombre: AZUCAR GRANULADO<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:26:26<br/>updated_at: 2024-12-05 19:26:26<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:26:26', '2024-12-05 23:26:26', '2024-12-05 23:26:26'),
(36, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 8<br/>nombre: CARNE VEGETAL DE SOYA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:26:45<br/>updated_at: 2024-12-05 19:26:45<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:26:45', '2024-12-05 23:26:45', '2024-12-05 23:26:45'),
(37, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 9<br/>nombre: CANELA ENTERA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:26:55<br/>updated_at: 2024-12-05 19:26:55<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:26:55', '2024-12-05 23:26:55', '2024-12-05 23:26:55'),
(38, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 3<br/>nro_partida: 311130<br/>nombre: ALIMENTACIÓN COMPLEMENTARIA ESCOLAR<br/>abreviatura: ALI<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 18:38:46<br/>updated_at: 2024-12-05 19:09:42<br/>', 'id: 3<br/>nro_partida: 31130<br/>nombre: ALIMENTACIÓN COMPLEMENTARIA ESCOLAR<br/>abreviatura: ALI<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 18:38:46<br/>updated_at: 2024-12-05 19:28:57<br/>', 'PARTIDAS', '2024-12-05', '19:28:57', '2024-12-05 23:28:57', '2024-12-05 23:28:57'),
(39, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 3<br/>nro_partida: 31130<br/>nombre: ALIMENTACIÓN COMPLEMENTARIA ESCOLAR<br/>abreviatura: ALI<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 18:38:46<br/>updated_at: 2024-12-05 19:28:57<br/>', 'id: 3<br/>nro_partida: 31140<br/>nombre: ALIMENTOS Y BEBIDAS PARA PERSONAS<br/>abreviatura: ABPP<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 18:38:46<br/>updated_at: 2024-12-05 19:29:42<br/>', 'PARTIDAS', '2024-12-05', '19:29:42', '2024-12-05 23:29:42', '2024-12-05 23:29:42'),
(40, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 4<br/>nro_partida: 31140<br/>nombre: ALIMENTACIÓN HOSPITALARIA<br/>abreviatura: AH<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:10:17<br/>updated_at: 2024-12-05 19:10:17<br/>', 'id: 4<br/>nro_partida: 31200<br/>nombre: ALIMENTOS PARA ANIMALES<br/>abreviatura: APA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:10:17<br/>updated_at: 2024-12-05 19:30:14<br/>', 'PARTIDAS', '2024-12-05', '19:30:14', '2024-12-05 23:30:14', '2024-12-05 23:30:14'),
(41, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 5<br/>nro_partida: 31150<br/>nombre: ALIMENTOS Y BEBIDAS PARA LA ATENCIÓN DE EMERGENCIAS<br/>abreviatura: ABA<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:11:01<br/>updated_at: 2024-12-05 19:11:01<br/>', 'id: 5<br/>nro_partida: 31300<br/>nombre: PRODUCTOS AGRICOLAS, PECUARIOS Y FORESTALES<br/>abreviatura: PAPF<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:11:01<br/>updated_at: 2024-12-05 19:30:51<br/>', 'PARTIDAS', '2024-12-05', '19:30:51', '2024-12-05 23:30:51', '2024-12-05 23:30:51'),
(42, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 6<br/>nro_partida: 31200<br/>nombre: ALIMENTOS PARA ANIMALES<br/>abreviatura: AAN<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:11:28<br/>updated_at: 2024-12-05 19:11:28<br/>', 'id: 6<br/>nro_partida: 32100<br/>nombre: PAPEL<br/>abreviatura: PEL<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:11:28<br/>updated_at: 2024-12-05 19:31:41<br/>', 'PARTIDAS', '2024-12-05', '19:31:41', '2024-12-05 23:31:41', '2024-12-05 23:31:41'),
(43, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 7<br/>nro_partida: 31300<br/>nombre: PRODUCTOS AGRÍCOLAS, PECUARIOS Y FORESTALES<br/>abreviatura: PAP<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:12:14<br/>updated_at: 2024-12-05 19:12:14<br/>', 'id: 7<br/>nro_partida: 32200<br/>nombre: PRODUCTOS DE ARTES GRAFICAS<br/>abreviatura: PAG<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:12:14<br/>updated_at: 2024-12-05 19:32:06<br/>', 'PARTIDAS', '2024-12-05', '19:32:06', '2024-12-05 23:32:06', '2024-12-05 23:32:06'),
(44, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 8<br/>nro_partida: 32100<br/>nombre: PAPEL<br/>abreviatura: PEL<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:12:49<br/>updated_at: 2024-12-05 19:12:49<br/>', 'id: 8<br/>nro_partida: 32300<br/>nombre: LIBROS, MANUALES Y REVISTAS<br/>abreviatura: LMR<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:12:49<br/>updated_at: 2024-12-05 19:32:27<br/>', 'PARTIDAS', '2024-12-05', '19:32:27', '2024-12-05 23:32:27', '2024-12-05 23:32:27'),
(45, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PARTIDA', 'id: 9<br/>nro_partida: 32200<br/>nombre: PRODUCTOS DE ARTES GRÁFICAS<br/>abreviatura: PAG<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:13:13<br/>updated_at: 2024-12-05 19:13:13<br/>', 'id: 9<br/>nro_partida: 32400<br/>nombre: TEXTOS DE ENSEÑANZA<br/>abreviatura: TEE<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:13:13<br/>updated_at: 2024-12-05 19:32:47<br/>', 'PARTIDAS', '2024-12-05', '19:32:47', '2024-12-05 23:32:47', '2024-12-05 23:32:47'),
(46, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PARTIDA', 'id: 10<br/>nro_partida: 32500<br/>nombre: PERIODICOS Y BOLETINES<br/>abreviatura: PEB<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:33:10<br/>updated_at: 2024-12-05 19:33:10<br/>', NULL, 'PARTIDAS', '2024-12-05', '19:33:10', '2024-12-05 23:33:10', '2024-12-05 23:33:10'),
(47, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 10<br/>nombre: PAQUETE DE HOJAS T/CARTA 500 HJ<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:35:32<br/>updated_at: 2024-12-05 19:35:32<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:35:32', '2024-12-05 23:35:32', '2024-12-05 23:35:32'),
(48, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 11<br/>nombre: PLIEGO DE HOJA RESMAN<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:35:55<br/>updated_at: 2024-12-05 19:35:55<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:35:55', '2024-12-05 23:35:55', '2024-12-05 23:35:55'),
(49, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN PRODUCTO', 'id: 12<br/>nombre: HOJAS BOND T/CARTA PAQUETE DE 500 HOJAS<br/>fecha_registro: 2024-12-05<br/>created_at: 2024-12-05 19:36:08<br/>updated_at: 2024-12-05 19:36:08<br/>', NULL, 'PRODUCTOS', '2024-12-05', '19:36:08', '2024-12-05 23:36:08', '2024-12-05 23:36:08'),
(50, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 1<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 2<br/>cantidad: 4<br/>costo: 18.5<br/>total: 74.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:37:50<br/>updated_at: 2024-12-05 19:37:50<br/>', NULL, 'INGRESOS', '2024-12-05', '19:37:50', '2024-12-05 23:37:50', '2024-12-05 23:37:50'),
(51, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 2<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-2<br/>nro: 2<br/>donacion: NO<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 5<br/>costo: 20<br/>total: 100.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:38:33<br/>updated_at: 2024-12-05 19:38:33<br/>', NULL, 'INGRESOS', '2024-12-05', '19:38:33', '2024-12-05 23:38:33', '2024-12-05 23:38:33'),
(52, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 3<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-3<br/>nro: 3<br/>donacion: NO<br/>producto_id: 4<br/>unidad_medida_id: 2<br/>cantidad: 10<br/>costo: 8<br/>total: 80.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:39:19<br/>updated_at: 2024-12-05 19:39:19<br/>', NULL, 'INGRESOS', '2024-12-05', '19:39:19', '2024-12-05 23:39:19', '2024-12-05 23:39:19'),
(53, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 4<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-4<br/>nro: 4<br/>donacion: NO<br/>producto_id: 3<br/>unidad_medida_id: 2<br/>cantidad: 4<br/>costo: 6<br/>total: 24.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:39:58<br/>updated_at: 2024-12-05 19:39:58<br/>', NULL, 'INGRESOS', '2024-12-05', '19:39:58', '2024-12-05 23:39:58', '2024-12-05 23:39:58'),
(54, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 5<br/>almacen_id: 1<br/>partida_id: 6<br/>unidad_id: 6<br/>programa_id: <br/>codigo: PEL-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 10<br/>unidad_medida_id: 6<br/>cantidad: 3<br/>costo: 80<br/>total: 240.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:40:35<br/>updated_at: 2024-12-05 19:40:35<br/>', NULL, 'INGRESOS', '2024-12-05', '19:40:35', '2024-12-05 23:40:35', '2024-12-05 23:40:35'),
(55, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 6<br/>almacen_id: 1<br/>partida_id: 6<br/>unidad_id: 6<br/>programa_id: <br/>codigo: PEL-2<br/>nro: 2<br/>donacion: NO<br/>producto_id: 11<br/>unidad_medida_id: 1<br/>cantidad: 2<br/>costo: 40<br/>total: 80.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:41:05<br/>updated_at: 2024-12-05 19:41:05<br/>', NULL, 'INGRESOS', '2024-12-05', '19:41:05', '2024-12-05 23:41:05', '2024-12-05 23:41:05'),
(56, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 7<br/>almacen_id: 1<br/>partida_id: 6<br/>unidad_id: 6<br/>programa_id: <br/>codigo: PEL-3<br/>nro: 3<br/>donacion: NO<br/>producto_id: 10<br/>unidad_medida_id: 1<br/>cantidad: 6<br/>costo: 38<br/>total: 228.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:41:34<br/>updated_at: 2024-12-05 19:41:34<br/>', NULL, 'INGRESOS', '2024-12-05', '19:41:34', '2024-12-05 23:41:34', '2024-12-05 23:41:34'),
(57, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 8<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-5<br/>nro: 5<br/>donacion: NO<br/>producto_id: 5<br/>unidad_medida_id: 1<br/>cantidad: 10<br/>costo: 12<br/>total: 120.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:46:02<br/>updated_at: 2024-12-05 19:46:02<br/>', NULL, 'INGRESOS', '2024-12-05', '19:46:02', '2024-12-05 23:46:02', '2024-12-05 23:46:02'),
(58, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UN INGRESO', 'id: 9<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-6<br/>nro: 6<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 2<br/>cantidad: 24<br/>costo: 6.8<br/>total: 163.20<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 2<br/>created_at: 2024-12-05 19:47:50<br/>updated_at: 2024-12-05 19:47:50<br/>', NULL, 'INGRESOS', '2024-12-05', '19:47:50', '2024-12-05 23:47:50', '2024-12-05 23:47:50'),
(59, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 6<br/>usuario: RMONTES<br/>nombre: RAMIRO<br/>paterno: MONTES<br/>materno: CONDE<br/>ci: 5555<br/>ci_exp: LP<br/>dir: LOS PEDREGALES<br/>email: ramiro@gmail.com<br/>fono: 6666666<br/>password: $2y$12$20IN4DUuHkUj.tIL17ooye7B9HingV9Q9Q/GUX4Nz8k6Vh1nFKhmS<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 2<br/>almacen_id: 1<br/>role_id: 4<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:59:07<br/>updated_at: 2024-12-05 15:59:07<br/>', 'id: 6<br/>usuario: RMONTES<br/>nombre: RAMIRO<br/>paterno: MONTES<br/>materno: CONDE<br/>ci: 5555<br/>ci_exp: LP<br/>dir: LOS PEDREGALES<br/>email: ramiro@gmail.com<br/>fono: 6666666<br/>password: $2y$12$tf5HRSZHDKp2mXl9EPbAouVII.iXMfu0nUTCu60c9yyP43a1oQ452<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 2<br/>almacen_id: 1<br/>role_id: 4<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:59:07<br/>updated_at: 2024-12-05 19:56:33<br/>', 'USUARIOS', '2024-12-05', '19:56:33', '2024-12-05 23:56:33', '2024-12-05 23:56:33'),
(60, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UN USUARIO', 'id: 6<br/>usuario: RMONTES<br/>nombre: RAMIRO<br/>paterno: MONTES<br/>materno: CONDE<br/>ci: 5555<br/>ci_exp: LP<br/>dir: LOS PEDREGALES<br/>email: ramiro@gmail.com<br/>fono: 6666666<br/>password: $2y$12$tf5HRSZHDKp2mXl9EPbAouVII.iXMfu0nUTCu60c9yyP43a1oQ452<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 2<br/>almacen_id: 1<br/>role_id: 4<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:59:07<br/>updated_at: 2024-12-05 19:56:33<br/>', 'id: 6<br/>usuario: RMONTES<br/>nombre: RAMIRO<br/>paterno: MONTES<br/>materno: CONDE<br/>ci: 5555<br/>ci_exp: LP<br/>dir: LOS PEDREGALES<br/>email: ramiro@gmail.com<br/>fono: 6666666<br/>password: $2y$12$tf5HRSZHDKp2mXl9EPbAouVII.iXMfu0nUTCu60c9yyP43a1oQ452<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 4<br/>unidad_id: 6<br/>almacen_id: 1<br/>role_id: 4<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:59:07<br/>updated_at: 2024-12-05 19:57:00<br/>', 'USUARIOS', '2024-12-05', '19:57:00', '2024-12-05 23:57:00', '2024-12-05 23:57:00'),
(61, 6, 'CREACIÓN', 'EL USUARIO RMONTES REGISTRO UN INGRESO', 'id: 10<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 6<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 5<br/>costo: 14<br/>total: 70.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:57:55<br/>updated_at: 2024-12-05 19:57:55<br/>', NULL, 'INGRESOS', '2024-12-05', '19:57:55', '2024-12-05 23:57:55', '2024-12-05 23:57:55'),
(62, 6, 'CREACIÓN', 'EL USUARIO RMONTES REGISTRO UN INGRESO', 'id: 11<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 6<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 5<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 12<br/>total: 240.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:58:21<br/>updated_at: 2024-12-05 19:58:21<br/>', NULL, 'INGRESOS', '2024-12-05', '19:58:21', '2024-12-05 23:58:21', '2024-12-05 23:58:21'),
(63, 6, 'CREACIÓN', 'EL USUARIO RMONTES REGISTRO UN INGRESO', 'id: 12<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 6<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 40<br/>costo: 8<br/>total: 320.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:58:46<br/>updated_at: 2024-12-05 19:58:46<br/>', NULL, 'INGRESOS', '2024-12-05', '19:58:46', '2024-12-05 23:58:46', '2024-12-05 23:58:46'),
(64, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UN INGRESO', 'id: 12<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 6<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 40<br/>costo: 8.00<br/>total: 320.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:58:46<br/>updated_at: 2024-12-05 19:58:46<br/>', 'id: 12<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-7<br/>nro: 7<br/>donacion: SI<br/>producto_id: 3<br/>unidad_medida_id: 2<br/>cantidad: 40<br/>costo: 8.00<br/>total: 320.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:58:46<br/>updated_at: 2024-12-05 20:00:27<br/>', 'INGRESOS', '2024-12-05', '20:00:27', '2024-12-06 00:00:27', '2024-12-06 00:00:27'),
(65, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UN INGRESO', 'id: 11<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 6<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 5<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 12.00<br/>total: 240.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:58:21<br/>updated_at: 2024-12-05 19:58:21<br/>', 'id: 11<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-8<br/>nro: 8<br/>donacion: SI<br/>producto_id: 5<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 12.00<br/>total: 240.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:58:21<br/>updated_at: 2024-12-05 20:01:11<br/>', 'INGRESOS', '2024-12-05', '20:01:11', '2024-12-06 00:01:11', '2024-12-06 00:01:11'),
(66, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 10<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 6<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 5<br/>costo: 14.00<br/>total: 70.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:57:55<br/>updated_at: 2024-12-05 19:57:55<br/>', 'id: 10<br/>almacen_id: 1<br/>partida_id: 3<br/>unidad_id: 6<br/>programa_id: <br/>codigo: ABPP-9<br/>nro: 9<br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 5<br/>costo: 14.00<br/>total: 70.00<br/>fecha_ingreso: 2024-12-05<br/>fecha_registro: 2024-12-05<br/>user_id: 6<br/>created_at: 2024-12-05 19:57:55<br/>updated_at: 2024-12-05 20:24:37<br/>', 'INGRESOS', '2024-12-05', '20:24:37', '2024-12-06 00:24:37', '2024-12-06 00:24:37'),
(67, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PROGRAMA', 'id: 3<br/>nombre: ALM PROGRAMA 1<br/>grupo: PROGRAMAS<br/>descripcion: <br/>fecha_registro: <br/>created_at: <br/>updated_at: <br/>', 'id: 3<br/>nombre: ALM PROGRAMA 1 ASD<br/>grupo: PROGRAMAS<br/>descripcion: <br/>fecha_registro: <br/>created_at: <br/>updated_at: 2024-12-11 13:48:19<br/>', 'PROGRAMAS', '2024-12-11', '13:48:19', '2024-12-11 17:48:19', '2024-12-11 17:48:19'),
(68, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN PROGRAMA', 'id: 3<br/>nombre: ALM PROGRAMA 1 ASD<br/>grupo: PROGRAMAS<br/>descripcion: <br/>fecha_registro: <br/>created_at: <br/>updated_at: 2024-12-11 13:48:19<br/>', NULL, 'PROGRAMAS', '2024-12-11', '13:49:00', '2024-12-11 17:49:00', '2024-12-11 17:49:00'),
(69, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PROGRAMA', 'id: 3<br/>nombre: ALM PROGRAMA 1<br/>grupo: PROGRAMAS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 13:49:19<br/>updated_at: 2024-12-11 13:49:19<br/>', NULL, 'PROGRAMAS', '2024-12-11', '13:49:19', '2024-12-11 17:49:19', '2024-12-11 17:49:19'),
(70, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CENTRO', 'id: 4<br/>nombre: ALM CENTRO 1<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 13:53:01<br/>updated_at: 2024-12-11 13:53:01<br/>', NULL, 'CENTROS', '2024-12-11', '13:53:01', '2024-12-11 17:53:01', '2024-12-11 17:53:01'),
(71, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CENTRO', 'id: 4<br/>nombre: ALM CENTRO 1<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 13:53:01<br/>updated_at: 2024-12-11 13:53:01<br/>', 'id: 4<br/>nombre: ALM CENTRO 1ASD<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 13:53:01<br/>updated_at: 2024-12-11 13:53:06<br/>', 'CENTROS', '2024-12-11', '13:53:06', '2024-12-11 17:53:06', '2024-12-11 17:53:06'),
(72, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN CENTRO', 'id: 4<br/>nombre: ALM CENTRO 1ASD<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 13:53:01<br/>updated_at: 2024-12-11 13:53:06<br/>', NULL, 'CENTROS', '2024-12-11', '13:53:18', '2024-12-11 17:53:18', '2024-12-11 17:53:18'),
(73, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CENTRO', 'id: 4<br/>nombre: ALM CENTRO 1<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 13:53:33<br/>updated_at: 2024-12-11 13:53:33<br/>', NULL, 'CENTROS', '2024-12-11', '13:53:33', '2024-12-11 17:53:33', '2024-12-11 17:53:33'),
(74, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733424526_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-05 18:49:57<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733424526_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-05 18:49:57<br/>', 'USUARIOS', '2024-12-11', '15:03:03', '2024-12-11 19:03:03', '2024-12-11 19:03:03'),
(75, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733424526_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-05 18:49:57<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733929406_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-11 15:03:26<br/>', 'USUARIOS', '2024-12-11', '15:03:26', '2024-12-11 19:03:26', '2024-12-11 19:03:26'),
(76, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733929406_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-11 15:03:26<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733929406_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-11 15:03:26<br/>', 'USUARIOS', '2024-12-11', '15:05:50', '2024-12-11 19:05:50', '2024-12-11 19:05:50'),
(77, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733929406_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-11 15:03:26<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733929406_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-11 15:06:42<br/>', 'USUARIOS', '2024-12-11', '15:06:42', '2024-12-11 19:06:42', '2024-12-11 19:06:42'),
(78, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733929406_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-11 15:06:42<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq<br/>foto: 1733929406_JPERES.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_todos: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-12-11 15:06:42<br/>', 'USUARIOS', '2024-12-11', '15:23:08', '2024-12-11 19:23:08', '2024-12-11 19:23:08'),
(79, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 22:17:03<br/>', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 22:17:03<br/>', 'USUARIOS', '2024-12-11', '15:23:20', '2024-12-11 19:23:20', '2024-12-11 19:23:20'),
(80, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 7<br/>usuario: MGONZALES1<br/>nombre: MARTA<br/>paterno: GONZALES<br/>materno: PERES<br/>ci: 6666<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marta@gmail.com<br/>fono: 77676767676<br/>password: $2y$12$ockZSCFccxZmgL0fkwdL.OZViJAZNCd4iTSZBb6u2KKpliep20Ncu<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-12-11<br/>acceso: 0<br/>status: <br/>created_at: 2024-12-11 15:27:03<br/>updated_at: 2024-12-11 15:27:03<br/>', NULL, 'USUARIOS', '2024-12-11', '15:27:03', '2024-12-11 19:27:03', '2024-12-11 19:27:03'),
(81, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 7<br/>usuario: MGONZALES1<br/>nombre: MARTA<br/>paterno: GONZALES<br/>materno: PERES<br/>ci: 6666<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marta@gmail.com<br/>fono: 77676767676<br/>password: $2y$12$ockZSCFccxZmgL0fkwdL.OZViJAZNCd4iTSZBb6u2KKpliep20Ncu<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-12-11<br/>acceso: 0<br/>status: 1<br/>created_at: 2024-12-11 15:27:03<br/>updated_at: 2024-12-11 15:27:03<br/>', 'id: 7<br/>usuario: MGONZALES1<br/>nombre: MARTA<br/>paterno: GONZALES<br/>materno: PERES<br/>ci: 6666<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marta@gmail.com<br/>fono: 77676767676<br/>password: $2y$12$ockZSCFccxZmgL0fkwdL.OZViJAZNCd4iTSZBb6u2KKpliep20Ncu<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-12-11<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-11 15:27:03<br/>updated_at: 2024-12-11 15:27:18<br/>', 'USUARIOS', '2024-12-11', '15:27:18', '2024-12-11 19:27:18', '2024-12-11 19:27:18'),
(82, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CENTRO', 'id: 5<br/>nombre: ALM CENTRO 2<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 15:53:21<br/>updated_at: 2024-12-11 15:53:21<br/>', NULL, 'CENTROS', '2024-12-11', '15:53:21', '2024-12-11 19:53:21', '2024-12-11 19:53:21'),
(83, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CENTRO', 'id: 6<br/>nombre: ALM CENTRO 3<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2024-12-11<br/>created_at: 2024-12-11 15:53:27<br/>updated_at: 2024-12-11 15:53:27<br/>', NULL, 'CENTROS', '2024-12-11', '15:53:27', '2024-12-11 19:53:27', '2024-12-11 19:53:27'),
(84, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: <br/>codigo: GRP0241<br/>nro: 1<br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 15:45:53<br/>', NULL, 'INGRESOS', '2024-12-11', '15:45:53', '2024-12-11 19:45:53', '2024-12-11 19:45:53'),
(85, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 14<br/>almacen_id: 2<br/>partida_id: 6<br/>unidad_id: <br/>codigo: PEL0241<br/>nro: 1<br/>donacion: NO<br/>producto_id: 10<br/>unidad_medida_id: 9<br/>cantidad: 1<br/>costo: 200<br/>total: 200.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:47:10<br/>updated_at: 2024-12-11 15:47:10<br/>', NULL, 'INGRESOS', '2024-12-11', '15:47:10', '2024-12-11 19:47:10', '2024-12-11 19:47:10'),
(86, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: <br/>codigo: GRP0241<br/>nro: 1<br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 15:45:53<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:05:08<br/>', 'INGRESOS', '2024-12-11', '18:05:08', '2024-12-11 22:05:08', '2024-12-11 22:05:08'),
(87, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:05:08<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:08:01', '2024-12-11 22:08:01', '2024-12-11 22:08:01'),
(88, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:10:08', '2024-12-11 22:10:08', '2024-12-11 22:10:08'),
(89, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:10:30', '2024-12-11 22:10:30', '2024-12-11 22:10:30'),
(90, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: 1<br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:10:40', '2024-12-11 22:10:40', '2024-12-11 22:10:40'),
(91, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:11:13', '2024-12-11 22:11:13', '2024-12-11 22:11:13'),
(92, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:11:30', '2024-12-11 22:11:30', '2024-12-11 22:11:30'),
(93, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:11:55', '2024-12-11 22:11:55', '2024-12-11 22:11:55');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(94, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'INGRESOS', '2024-12-11', '18:12:40', '2024-12-11 22:12:40', '2024-12-11 22:12:40'),
(95, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 13<br/>almacen_id: 4<br/>partida_id: <br/>unidad_id: 4<br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:08:01<br/>', 'id: 13<br/>almacen_id: 4<br/>partida_id: 3<br/>unidad_id: 4<br/>codigo: ABPP0241<br/>nro: 1<br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 20<br/>costo: 18.00<br/>total: 360.00<br/>fecha_ingreso: 2024-12-11<br/>fecha_registro: 2024-12-11<br/>user_id: 1<br/>created_at: 2024-12-11 15:45:53<br/>updated_at: 2024-12-11 18:13:53<br/>', 'INGRESOS', '2024-12-11', '18:13:53', '2024-12-11 22:13:53', '2024-12-11 22:13:53'),
(96, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 6<br/>usuario: RMONTES<br/>nombre: RAMIRO<br/>paterno: MONTES<br/>materno: CONDE<br/>ci: 5555<br/>ci_exp: LP<br/>dir: LOS PEDREGALES<br/>email: ramiro@gmail.com<br/>fono: 6666666<br/>password: $2y$12$tf5HRSZHDKp2mXl9EPbAouVII.iXMfu0nUTCu60c9yyP43a1oQ452<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 4<br/>unidad_id: 6<br/>almacen_todos: 0<br/>role_id: 4<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:59:07<br/>updated_at: 2024-12-05 19:57:00<br/>', 'id: 6<br/>usuario: RMONTES<br/>nombre: RAMIRO<br/>paterno: MONTES<br/>materno: CONDE<br/>ci: 5555<br/>ci_exp: LP<br/>dir: LOS PEDREGALES<br/>email: ramiro@gmail.com<br/>fono: 6666666<br/>password: $2y$12$vGC2J8mbyPWu..Un7Qj0UO19HmBaMEgp8q1XnG4l8GLa8cX93Lsli<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 4<br/>unidad_id: 6<br/>almacen_todos: 0<br/>role_id: 4<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:59:07<br/>updated_at: 2024-12-11 18:44:35<br/>', 'USUARIOS', '2024-12-11', '18:44:35', '2024-12-11 22:44:35', '2024-12-11 22:44:35'),
(97, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 5<br/>usuario: MGONZALES<br/>nombre: MARTHA<br/>paterno: GONZALES<br/>materno: <br/>ci: 4444<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 66666<br/>password: $2y$12$sofR9iBzvE03Smup3Z5P9.xGpAmVNt4VPOyHjbobVjG0Aqturya/i<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:39:06<br/>updated_at: 2024-12-05 15:39:06<br/>', 'id: 5<br/>usuario: MGONZALES<br/>nombre: MARTHA<br/>paterno: GONZALES<br/>materno: <br/>ci: 4444<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 66666<br/>password: $2y$12$sofR9iBzvE03Smup3Z5P9.xGpAmVNt4VPOyHjbobVjG0Aqturya/i<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 15:39:06<br/>updated_at: 2024-12-05 15:39:06<br/>', 'USUARIOS', '2024-12-11', '18:45:09', '2024-12-11 22:45:09', '2024-12-11 22:45:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `partida_id` bigint UNSIGNED DEFAULT NULL,
  `unidad_id` bigint UNSIGNED DEFAULT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro` int DEFAULT NULL,
  `donacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `unidad_medida_id` bigint UNSIGNED NOT NULL,
  `cantidad` int NOT NULL,
  `costo` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `almacen_id`, `partida_id`, `unidad_id`, `codigo`, `nro`, `donacion`, `producto_id`, `unidad_medida_id`, `cantidad`, `costo`, `total`, `fecha_ingreso`, `fecha_registro`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 6, 'ABPP241', 1, 'NO', 1, 2, 4, 18.50, 74.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:37:50', '2024-12-11 19:27:06'),
(2, 1, 3, 6, 'ABPP242', 2, 'NO', 2, 1, 5, 20.00, 100.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:38:33', '2024-12-11 19:27:06'),
(3, 1, 3, 6, 'ABPP243', 3, 'NO', 4, 2, 10, 8.00, 80.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:39:19', '2024-12-11 19:27:06'),
(4, 1, 3, 6, 'ABPP244', 4, 'NO', 3, 2, 4, 6.00, 24.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:39:58', '2024-12-11 19:27:06'),
(5, 1, 6, 6, 'PEL241', 1, 'NO', 10, 6, 3, 80.00, 240.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:40:35', '2024-12-11 19:27:06'),
(6, 1, 6, 6, 'PEL242', 2, 'NO', 11, 1, 2, 40.00, 80.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:41:05', '2024-12-11 19:27:06'),
(7, 1, 6, 6, 'PEL243', 3, 'NO', 10, 1, 6, 38.00, 228.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:41:34', '2024-12-11 19:27:06'),
(8, 1, 3, 6, 'ABPP245', 5, 'NO', 5, 1, 10, 12.00, 120.00, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:46:02', '2024-12-11 19:27:06'),
(9, 1, 3, 6, 'ABPP246', 6, 'NO', 1, 2, 24, 6.80, 163.20, '2024-12-05', '2024-12-05', 2, '2024-12-05 23:47:50', '2024-12-11 19:27:06'),
(10, 1, 3, 6, 'ABPP247', 7, 'SI', 2, 1, 5, 14.00, 70.00, '2024-12-05', '2024-12-05', 6, '2024-12-05 23:57:55', '2024-12-11 19:28:36'),
(11, 1, 3, 6, 'ABPP248', 8, 'SI', 5, 1, 20, 12.00, 240.00, '2024-12-05', '2024-12-05', 6, '2024-12-05 23:58:21', '2024-12-11 19:27:06'),
(12, 1, 3, 6, 'ABPP249', 9, 'SI', 3, 2, 40, 8.00, 320.00, '2024-12-05', '2024-12-05', 6, '2024-12-05 23:58:46', '2024-12-11 19:28:36'),
(13, 4, 3, 4, 'ABPP241', 1, 'SI', 2, 1, 20, 18.00, 360.00, '2024-12-11', '2024-12-11', 1, '2024-12-11 19:45:53', '2024-12-11 22:13:53'),
(14, 2, 6, NULL, 'PEL0241', 1, 'NO', 10, 9, 1, 200.00, 200.00, '2024-12-11', '2024-12-11', 1, '2024-12-11 19:47:10', '2024-12-11 19:47:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i_e_internos`
--

CREATE TABLE `i_e_internos` (
  `id` bigint UNSIGNED NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `ingreso_id` bigint UNSIGNED NOT NULL,
  `egreso_id` bigint UNSIGNED NOT NULL,
  `icantidad` int NOT NULL,
  `icosto` decimal(24,2) NOT NULL,
  `itotal` decimal(24,2) NOT NULL,
  `ecantidad` int DEFAULT NULL,
  `etotal` decimal(24,2) DEFAULT NULL,
  `registro_egreso` int NOT NULL DEFAULT '0',
  `fecha_registro` date NOT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `i_e_internos`
--

INSERT INTO `i_e_internos` (`id`, `almacen_id`, `producto_id`, `ingreso_id`, `egreso_id`, `icantidad`, `icosto`, `itotal`, `ecantidad`, `etotal`, `registro_egreso`, `fecha_registro`, `fecha_egreso`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 12, 1, 40, 8.00, 320.00, 40, 320.00, 0, '2024-12-11', NULL, '2024-12-11 21:00:34', '2024-12-11 22:01:53'),
(2, 5, 5, 11, 2, 20, 12.00, 240.00, NULL, NULL, 0, '2024-12-11', NULL, '2024-12-11 21:00:44', '2024-12-11 21:00:44'),
(3, 4, 2, 10, 3, 5, 14.00, 70.00, NULL, NULL, 0, '2024-12-11', NULL, '2024-12-11 22:01:23', '2024-12-11 22:01:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_01_31_165641_create_configuracions_table', 1),
(2, '2024_11_02_153309_create_roles_table', 1),
(3, '2024_11_02_153310_create_almacens_table', 1),
(4, '2024_11_02_153311_create_cargos_table', 1),
(5, '2024_11_02_153312_create_unidads_table', 1),
(6, '2024_11_02_153315_create_modulos_table', 1),
(7, '2024_11_02_153316_create_permisos_table', 1),
(8, '2024_11_02_153317_create_users_table', 1),
(9, '2024_11_02_153318_create_historial_accions_table', 1),
(10, '2024_11_25_201523_create_partidas_table', 1),
(11, '2024_11_25_201640_create_unidad_medidas_table', 1),
(12, '2024_11_25_201717_create_productos_table', 1),
(13, '2024_11_25_201813_create_ingresos_table', 1),
(14, '2024_11_25_201935_create_egresos_table', 1),
(15, '2024_11_25_203338_create_programas_table', 1),
(16, '2024_12_11_134007_create_user_almacens_table', 2),
(17, '2024_12_11_163041_create_i_e_internos_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` bigint UNSIGNED NOT NULL,
  `modulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `modulo`, `nombre`, `accion`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Gestión de usuarios', 'usuarios.index', 'VER', 'VER LA LISTA DE USUARIOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(2, 'Gestión de usuarios', 'usuarios.create', 'CREAR', 'CREAR USUARIOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(3, 'Gestión de usuarios', 'usuarios.edit', 'EDITAR', 'EDITAR USUARIOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(4, 'Gestión de usuarios', 'usuarios.destroy', 'ELIMINAR', 'ELIMINAR USUARIOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(5, 'Roles y Permisos', 'roles.index', 'VER', 'VER LA LISTA DE ROLES Y PERMISOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(6, 'Roles y Permisos', 'roles.create', 'CREAR', 'CREAR ROLES Y PERMISOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(7, 'Roles y Permisos', 'roles.edit', 'EDITAR', 'EDITAR ROLES Y PERMISOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(8, 'Roles y Permisos', 'roles.destroy', 'ELIMINAR', 'ELIMINAR ROLES Y PERMISOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(9, 'Configuración del sistema', 'configuracions.index', 'VER', 'VER INFORMACIÓN DE LA CONFIGURACIÓN DEL SISTEMA', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(10, 'Configuración del sistema', 'configuracions.edit', 'EDITAR', 'EDITAR LA CONFIGURACIÓN DEL SISTEMA', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(11, 'Cargos', 'cargos.index', 'VER', 'VER LA LISTA DE CARGOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(12, 'Cargos', 'cargos.create', 'CREAR', 'CREAR CARGOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(13, 'Cargos', 'cargos.edit', 'EDITAR', 'EDITAR CARGOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(14, 'Cargos', 'cargos.destroy', 'ELIMINAR', 'ELIMINAR CARGOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(15, 'Unidades', 'unidads.index', 'VER', 'VER LA LISTA DE UNIDADES', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(16, 'Unidades', 'unidads.create', 'CREAR', 'CREAR UNIDADES', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(17, 'Unidades', 'unidads.edit', 'EDITAR', 'EDITAR UNIDADES', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(18, 'Unidades', 'unidads.destroy', 'ELIMINAR', 'ELIMINAR UNIDADES', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(19, 'Partidas', 'partidas.index', 'VER', 'VER LA LISTA DE PARTIDAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(20, 'Partidas', 'partidas.create', 'CREAR', 'CREAR PARTIDAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(21, 'Partidas', 'partidas.edit', 'EDITAR', 'EDITAR PARTIDAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(22, 'Partidas', 'partidas.destroy', 'ELIMINAR', 'ELIMINAR PARTIDAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(23, 'Unidades de Medida', 'unidad_medidas.index', 'VER', 'VER LA LISTA DE UNIDADES DE MEDIDA', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(24, 'Unidades de Medida', 'unidad_medidas.create', 'CREAR', 'CREAR UNIDADES DE MEDIDA', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(25, 'Unidades de Medida', 'unidad_medidas.edit', 'EDITAR', 'EDITAR UNIDADES DE MEDIDA', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(26, 'Unidades de Medida', 'unidad_medidas.destroy', 'ELIMINAR', 'ELIMINAR UNIDADES DE MEDIDA', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(27, 'Productos', 'productos.index', 'VER', 'VER LA LISTA DE PRODUCTOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(28, 'Productos', 'productos.create', 'CREAR', 'CREAR PRODUCTOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(29, 'Productos', 'productos.edit', 'EDITAR', 'EDITAR PRODUCTOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(30, 'Productos', 'productos.destroy', 'ELIMINAR', 'ELIMINAR PRODUCTOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(31, 'Ingresos', 'ingresos.index', 'VER', 'VER LA LISTA DE INGRESOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(32, 'Ingresos', 'ingresos.create', 'CREAR', 'CREAR INGRESOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(33, 'Ingresos', 'ingresos.edit', 'EDITAR', 'EDITAR INGRESOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(34, 'Ingresos', 'ingresos.destroy', 'ELIMINAR', 'ELIMINAR INGRESOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(35, 'Egresos', 'egresos.index', 'VER', 'VER LA LISTA DE EGRESOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(36, 'Egresos', 'egresos.create', 'REGISTRAR', 'REGISTRAR EGRESOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(37, 'Programas', 'programas.index', 'VER', 'VER LA LISTA DE PROGRAMAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(38, 'Programas', 'programas.create', 'CREAR', 'CREAR PROGRAMAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(39, 'Programas', 'programas.edit', 'EDITAR', 'EDITAR PROGRAMAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(40, 'Programas', 'programas.destroy', 'ELIMINAR', 'ELIMINAR PROGRAMAS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(41, 'Centros', 'centros.index', 'VER', 'VER LA LISTA DE CENTROS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(42, 'Centros', 'centros.create', 'CREAR', 'CREAR CENTROS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(43, 'Centros', 'centros.edit', 'EDITAR', 'EDITAR CENTROS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(44, 'Centros', 'centros.destroy', 'ELIMINAR', 'ELIMINAR CENTROS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(45, 'Reportes', 'reportes.usuarios', 'GENERAR LISTA DE USUARIOS', 'GENERAR REPORTE LISTA DE USUARIOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(46, 'Reportes', 'reportes.bimestral', 'GENERAR REPORTE BIMESTRAL', 'GENERAR REPORTES BIMESTRAL', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(47, 'Reportes', 'reportes.cuatrimestral', 'GENERAR REPORTE CUATRIMESTRAL', 'GENERAR REPORTES CUATRIMESTRAL', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(48, 'Reportes', 'reportes.conciliacion', 'GENERAR REPORTE CONCILIACION DE PRESUPUESTO', 'GENERAR REPORTES CONCILIACION DE PRESUPUESTO', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(49, 'Reportes', 'reportes.ie_internos', 'GENERAR REPORTES DE INGRESOS Y EGRESOS INTERNOS', 'GENERAR REPORTES DE INGRESOS Y EGRESO INTERNOS DESDE EL ÁLMACEN CENTRAL A OTROS ALMACENES', '2024-12-11 17:32:23', '2024-12-11 17:32:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidas`
--

CREATE TABLE `partidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nro_partida` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abreviatura` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `partidas`
--

INSERT INTO `partidas` (`id`, `nro_partida`, `nombre`, `abreviatura`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, '31110', 'GASTOS POR REFRIGERIOS AL PERSONAL PERMANENTE', 'GRP', '2024-11-28', '2024-11-28 19:12:44', '2024-12-05 23:08:41'),
(2, '31120', 'GASTOS POR ALIMENTACIÓN Y OTROS SIMILARES', 'GAO', '2024-11-28', '2024-11-28 19:13:07', '2024-12-05 23:09:15'),
(3, '31140', 'ALIMENTOS Y BEBIDAS PARA PERSONAS', 'ABPP', '2024-12-05', '2024-12-05 22:38:46', '2024-12-05 23:29:42'),
(4, '31200', 'ALIMENTOS PARA ANIMALES', 'APA', '2024-12-05', '2024-12-05 23:10:17', '2024-12-05 23:30:14'),
(5, '31300', 'PRODUCTOS AGRICOLAS, PECUARIOS Y FORESTALES', 'PAPF', '2024-12-05', '2024-12-05 23:11:01', '2024-12-05 23:30:51'),
(6, '32100', 'PAPEL', 'PEL', '2024-12-05', '2024-12-05 23:11:28', '2024-12-05 23:31:41'),
(7, '32200', 'PRODUCTOS DE ARTES GRAFICAS', 'PAG', '2024-12-05', '2024-12-05 23:12:14', '2024-12-05 23:32:06'),
(8, '32300', 'LIBROS, MANUALES Y REVISTAS', 'LMR', '2024-12-05', '2024-12-05 23:12:49', '2024-12-05 23:32:27'),
(9, '32400', 'TEXTOS DE ENSEÑANZA', 'TEE', '2024-12-05', '2024-12-05 23:13:13', '2024-12-05 23:32:47'),
(10, '32500', 'PERIODICOS Y BOLETINES', 'PEB', '2024-12-05', '2024-12-05 23:33:10', '2024-12-05 23:33:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `modulo_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `role_id`, `modulo_id`, `created_at`, `updated_at`) VALUES
(1, 3, 31, '2024-12-11 22:03:15', '2024-12-11 22:03:15'),
(2, 3, 32, '2024-12-11 22:03:16', '2024-12-11 22:03:16'),
(3, 3, 33, '2024-12-11 22:03:18', '2024-12-11 22:03:18'),
(4, 3, 34, '2024-12-11 22:03:18', '2024-12-11 22:03:18'),
(5, 3, 35, '2024-12-11 22:03:19', '2024-12-11 22:03:19'),
(6, 3, 36, '2024-12-11 22:03:20', '2024-12-11 22:03:20'),
(7, 3, 49, '2024-12-11 22:22:21', '2024-12-11 22:22:21'),
(8, 3, 46, '2024-12-11 22:22:22', '2024-12-11 22:22:22'),
(9, 3, 47, '2024-12-11 22:22:23', '2024-12-11 22:22:23'),
(10, 3, 48, '2024-12-11 22:22:23', '2024-12-11 22:22:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'ARROZ ESTAQUILLA GRANO DE ORO BOLSA DE 46 KILOS', '2024-12-05', '2024-12-05 23:25:25', '2024-12-05 23:25:25'),
(2, 'ATUN (LOMITO)', '2024-12-05', '2024-12-05 23:25:35', '2024-12-05 23:25:35'),
(3, 'AVENA', '2024-12-05', '2024-12-05 23:25:46', '2024-12-05 23:25:46'),
(4, 'AZUCAR GRANULADO', '2024-12-05', '2024-12-05 23:25:56', '2024-12-05 23:25:56'),
(5, 'CAFE MOLIDO', '2024-12-05', '2024-12-05 23:26:07', '2024-12-05 23:26:07'),
(6, 'CANELA ENTERA', '2024-12-05', '2024-12-05 23:26:17', '2024-12-05 23:26:17'),
(7, 'AZUCAR GRANULADO', '2024-12-05', '2024-12-05 23:26:26', '2024-12-05 23:26:26'),
(8, 'CARNE VEGETAL DE SOYA', '2024-12-05', '2024-12-05 23:26:45', '2024-12-05 23:26:45'),
(9, 'CANELA ENTERA', '2024-12-05', '2024-12-05 23:26:55', '2024-12-05 23:26:55'),
(10, 'PAQUETE DE HOJAS T/CARTA 500 HJ', '2024-12-05', '2024-12-05 23:35:32', '2024-12-05 23:35:32'),
(11, 'PLIEGO DE HOJA RESMAN', '2024-12-05', '2024-12-05 23:35:55', '2024-12-05 23:35:55'),
(12, 'HOJAS BOND T/CARTA PAQUETE DE 500 HOJAS', '2024-12-05', '2024-12-05 23:36:08', '2024-12-05 23:36:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permisos` int NOT NULL DEFAULT '0',
  `usuarios` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `permisos`, `usuarios`, `created_at`, `updated_at`) VALUES
(1, 'SUPER USUARIO', 1, 0, '2024-11-26 00:59:19', '2024-11-26 00:59:19'),
(2, 'ADMINISTRADOR', 0, 1, '2024-11-26 00:59:19', '2024-11-26 00:59:19'),
(3, 'ALMACÉN', 0, 1, '2024-11-29 00:56:05', '2024-11-29 00:56:05'),
(4, 'USUARIO EXTERNO', 0, 1, '2024-12-05 19:57:48', '2024-12-05 19:57:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidads`
--

CREATE TABLE `unidads` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigla` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidads`
--

INSERT INTO `unidads` (`id`, `nombre`, `sigla`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD ADMINISTRATIVA FINACIERA', 'UAF', '2024-11-25', '2024-11-26 01:00:23', '2024-12-05 23:19:27'),
(2, 'ÁREA DE PRESUPUESTOS', 'ADP', '2024-11-25', '2024-11-26 02:31:08', '2024-12-05 23:19:56'),
(4, 'UNIDAD DE SALUD', 'UDS', '2024-12-05', '2024-12-05 23:20:22', '2024-12-05 23:20:22'),
(5, 'SECCIÓN DE ALAMCENES', 'SDA', '2024-12-05', '2024-12-05 23:21:08', '2024-12-05 23:21:08'),
(6, 'CENTRO DE ACOGIDA FÉLIX MÉNDEZ ARCOS', 'CAFMA', '2024-12-05', '2024-12-05 23:21:41', '2024-12-05 23:21:41'),
(7, 'CENTRO DE ACOGIDA JOSÉ SORIA', 'CAJS', '2024-12-05', '2024-12-05 23:22:04', '2024-12-05 23:22:04'),
(8, 'CENTRO DE ACOGIDA NIÑO JESUS', 'CANJ', '2024-12-05', '2024-12-05 23:22:27', '2024-12-05 23:22:27'),
(9, 'CENTRO DE ACOGIDA ROSAURA CAMPOS', 'CARC', '2024-12-05', '2024-12-05 23:22:51', '2024-12-05 23:22:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medidas`
--

CREATE TABLE `unidad_medidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abreviatura` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidad_medidas`
--

INSERT INTO `unidad_medidas` (`id`, `nombre`, `abreviatura`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD', 'U', '2024-11-25', '2024-11-26 00:58:53', '2024-12-05 22:40:37'),
(2, 'KILOS', 'K', '2024-12-05', '2024-12-05 19:16:56', '2024-12-05 22:40:47'),
(3, 'METROS', 'MTS', '2024-12-05', '2024-12-05 22:40:55', '2024-12-05 22:40:55'),
(4, 'HOJA', 'H', '2024-12-05', '2024-12-05 23:13:50', '2024-12-05 23:13:50'),
(5, 'JUEGO', 'J', '2024-12-05', '2024-12-05 23:14:02', '2024-12-05 23:14:02'),
(6, 'PAQUETE', 'PQ', '2024-12-05', '2024-12-05 23:14:15', '2024-12-05 23:14:15'),
(7, 'PARES DUAL', 'PD', '2024-12-05', '2024-12-05 23:14:25', '2024-12-05 23:14:25'),
(8, 'PIEZA', 'PZ', '2024-12-05', '2024-12-05 23:14:33', '2024-12-05 23:14:33'),
(9, 'CAJA', 'CJ', '2024-12-05', '2024-12-05 23:14:52', '2024-12-05 23:14:52'),
(10, 'ROLLO', 'RO', '2024-12-05', '2024-12-05 23:15:04', '2024-12-05 23:15:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo_id` bigint UNSIGNED DEFAULT NULL,
  `unidad_id` bigint UNSIGNED DEFAULT NULL,
  `almacen_todos` int NOT NULL DEFAULT '0',
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `acceso` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `email`, `fono`, `password`, `foto`, `tipo`, `cargo_id`, `unidad_id`, `almacen_todos`, `role_id`, `fecha_registro`, `acceso`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '', '0', '', '', '', '', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', NULL, 'INTERNO', 1, 1, 1, 1, '2024-11-25', 1, 1, '2024-11-26 01:00:49', '2024-11-26 01:00:49'),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1111', 'LP', 'LOS OLIVOS', 'JUAN@GMAIL.COM', '7777777', '$2y$12$JFwh7p5XpI30g9RZCkX2yOm6g5zgGjfoyLjaThtwWyy6QkBAD98zq', '1733929406_JPERES.jpg', 'INTERNO', 1, 1, 1, 2, '2024-11-25', 1, 1, '2024-11-26 02:47:09', '2024-12-11 19:06:42'),
(3, 'CMARTINES', 'CARLOS', 'MARTINES', 'PAREDES', '2222', 'LP', 'ZONA LOS OLIVOS', 'CARLOS@GMAIL.COM', '777777', '$2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra', NULL, 'EXTERNO', 2, 2, 0, 3, '2024-11-29', 1, 1, '2024-11-29 20:38:12', '2024-11-30 02:17:03'),
(4, 'MPOLO', 'MARCO', 'POLO', '', '3333', 'LP', 'LOS OLIVOS', 'marco@gmail.com', '67676767', '$2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW', '1732917793_MPOLO.jpg', 'EXTERNO', 1, 1, 0, 3, '2024-11-29', 1, 1, '2024-11-30 02:03:13', '2024-11-30 02:04:55'),
(5, 'MGONZALES', 'MARTHA', 'GONZALES', '', '4444', 'LP', 'LOS OLIVOS', NULL, '66666', '$2y$12$sofR9iBzvE03Smup3Z5P9.xGpAmVNt4VPOyHjbobVjG0Aqturya/i', NULL, 'EXTERNO', 2, 2, 0, 3, '2024-12-05', 1, 1, '2024-12-05 19:39:06', '2024-12-05 19:39:06'),
(6, 'RMONTES', 'RAMIRO', 'MONTES', 'CONDE', '5555', 'LP', 'LOS PEDREGALES', 'ramiro@gmail.com', '6666666', '$2y$12$vGC2J8mbyPWu..Un7Qj0UO19HmBaMEgp8q1XnG4l8GLa8cX93Lsli', NULL, 'EXTERNO', 4, 6, 0, 4, '2024-12-05', 1, 1, '2024-12-05 19:59:07', '2024-12-11 22:44:35'),
(7, 'MGONZALES1', 'MARTA', 'GONZALES', 'PERES', '6666', 'LP', 'LOS OLIVOS', 'marta@gmail.com', '77676767676', '$2y$12$ockZSCFccxZmgL0fkwdL.OZViJAZNCd4iTSZBb6u2KKpliep20Ncu', NULL, 'INTERNO', 2, 2, 0, 3, '2024-12-11', 1, 1, '2024-12-11 19:27:03', '2024-12-11 19:27:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_almacens`
--

CREATE TABLE `user_almacens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_almacens`
--

INSERT INTO `user_almacens` (`id`, `user_id`, `almacen_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, '2024-12-11 19:23:20', '2024-12-11 19:23:20'),
(2, 3, 2, '2024-12-11 19:23:20', '2024-12-11 19:23:20'),
(3, 3, 4, '2024-12-11 19:23:20', '2024-12-11 19:23:20'),
(4, 7, 4, '2024-12-11 19:27:03', '2024-12-11 19:27:03'),
(5, 5, 4, '2024-12-11 22:45:09', '2024-12-11 22:45:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacens`
--
ALTER TABLE `almacens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `egresos_ingreso_id_foreign` (`ingreso_id`),
  ADD KEY `egresos_almacen_id_foreign` (`almacen_id`),
  ADD KEY `egresos_partida_id_foreign` (`partida_id`),
  ADD KEY `egresos_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_accions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_almacen_id_foreign` (`almacen_id`),
  ADD KEY `ingresos_partida_id_foreign` (`partida_id`),
  ADD KEY `ingresos_producto_id_foreign` (`producto_id`),
  ADD KEY `ingresos_unidad_medida_id_foreign` (`unidad_medida_id`),
  ADD KEY `ingresos_unidad_id_foreign` (`unidad_id`),
  ADD KEY `ingresos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `i_e_internos`
--
ALTER TABLE `i_e_internos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i_e_internos_almacen_id_foreign` (`almacen_id`),
  ADD KEY `i_e_internos_producto_id_foreign` (`producto_id`),
  ADD KEY `i_e_internos_ingreso_id_foreign` (`ingreso_id`),
  ADD KEY `i_e_internos_egreso_id_foreign` (`egreso_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisos_role_id_foreign` (`role_id`),
  ADD KEY `permisos_modulo_id_foreign` (`modulo_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidads`
--
ALTER TABLE `unidads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD KEY `users_cargo_id_foreign` (`cargo_id`),
  ADD KEY `users_unidad_id_foreign` (`unidad_id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_almacens`
--
ALTER TABLE `user_almacens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_almacens_user_id_foreign` (`user_id`),
  ADD KEY `user_almacens_almacen_id_foreign` (`almacen_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacens`
--
ALTER TABLE `almacens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `i_e_internos`
--
ALTER TABLE `i_e_internos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidads`
--
ALTER TABLE `unidads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `user_almacens`
--
ALTER TABLE `user_almacens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD CONSTRAINT `egresos_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacens` (`id`),
  ADD CONSTRAINT `egresos_ingreso_id_foreign` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`),
  ADD CONSTRAINT `egresos_partida_id_foreign` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id`),
  ADD CONSTRAINT `egresos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacens` (`id`),
  ADD CONSTRAINT `ingresos_partida_id_foreign` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id`),
  ADD CONSTRAINT `ingresos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `ingresos_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidads` (`id`),
  ADD CONSTRAINT `ingresos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`),
  ADD CONSTRAINT `ingresos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `i_e_internos`
--
ALTER TABLE `i_e_internos`
  ADD CONSTRAINT `i_e_internos_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacens` (`id`),
  ADD CONSTRAINT `i_e_internos_egreso_id_foreign` FOREIGN KEY (`egreso_id`) REFERENCES `egresos` (`id`),
  ADD CONSTRAINT `i_e_internos_ingreso_id_foreign` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`),
  ADD CONSTRAINT `i_e_internos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_modulo_id_foreign` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `permisos_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidads` (`id`);

--
-- Filtros para la tabla `user_almacens`
--
ALTER TABLE `user_almacens`
  ADD CONSTRAINT `user_almacens_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacens` (`id`),
  ADD CONSTRAINT `user_almacens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
