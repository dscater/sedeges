-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-11-2024 a las 12:03:12
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
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacens`
--

INSERT INTO `almacens` (`id`, `nombre`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'ALMACÉN CENTROS', NULL, NULL, NULL, NULL),
(2, 'ALMACÉN PROGRAMAS', NULL, NULL, NULL, NULL),
(3, 'ALMACÉN FARMACIAS', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'CARGO 1', '2024-11-26 00:58:53', '2024-11-26 02:36:18'),
(2, 'CARGO 2', '2024-11-26 02:36:26', '2024-11-26 02:36:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `razon_social`, `alias`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SEDEGES S.A.', 'SEDEGES S.A.', 'logo.png', '2024-11-09 18:47:19', '2024-11-26 01:42:55');

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
  `cantidad` int NOT NULL,
  `costo` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`id`, `ingreso_id`, `almacen_id`, `partida_id`, `producto_id`, `cantidad`, `costo`, `total`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 2, 300, 20.00, 6000.00, '2024-11-28', '2024-11-29 00:04:13', '2024-11-29 00:40:51'),
(2, 1, 1, 1, 1, 70, 40.00, 2800.00, '2024-11-28', '2024-11-29 00:04:13', '2024-11-30 15:49:37'),
(3, 3, 2, 2, 1, 200, 45.00, 9000.00, '2024-11-28', '2024-11-29 00:42:03', '2024-11-29 00:42:03'),
(4, 4, 1, 1, 3, 500, 20.00, 10000.00, '2024-11-28', '2024-11-29 00:42:52', '2024-11-29 19:36:42'),
(5, 5, 1, 2, 1, 157, 50.00, 7850.00, '2024-11-29', '2024-11-30 03:44:51', '2024-11-30 03:44:51'),
(6, 7, 3, 1, 1, 30, 40.00, 1200.00, '2024-11-30', '2024-11-30 16:02:35', '2024-11-30 16:02:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA UNIDAD', 'id: 1<br/>nombre: UNIDAD 1<br/>sigla: U1<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-11-25 21:00:23<br/>', 'id: 1<br/>nombre: UNIDAD 1<br/>sigla: U1<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-11-25 21:00:23<br/>', 'UNIDADES', '2024-11-25', '22:30:18', '2024-11-26 02:30:18', '2024-11-26 02:30:18'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA UNIDAD', 'id: 1<br/>nombre: UNIDAD 1<br/>sigla: U1<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-11-25 21:00:23<br/>', 'id: 1<br/>nombre: UNIDAD 2<br/>sigla: U1<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-11-25 22:30:23<br/>', 'UNIDADES', '2024-11-25', '22:30:23', '2024-11-26 02:30:23', '2024-11-26 02:30:23'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA UNIDAD', 'id: 1<br/>nombre: UNIDAD 2<br/>sigla: U1<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-11-25 22:30:23<br/>', 'id: 1<br/>nombre: UNIDAD 1<br/>sigla: U1<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 21:00:23<br/>updated_at: 2024-11-25 22:30:59<br/>', 'UNIDADES', '2024-11-25', '22:30:59', '2024-11-26 02:30:59', '2024-11-26 02:30:59'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA UNIDAD', 'id: 2<br/>nombre: UNIDAD2<br/>sigla: U2<br/>fecha_registro: 2024-11-25<br/>created_at: 2024-11-25 22:31:08<br/>updated_at: 2024-11-25 22:31:08<br/>', NULL, 'UNIDADES', '2024-11-25', '22:31:08', '2024-11-26 02:31:08', '2024-11-26 02:31:08'),
(5, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CARGO', 'id: 1<br/>nombre: CARGO 1<br/>created_at: 2024-11-25 20:58:53<br/>updated_at: 2024-11-25 20:58:53<br/>', 'id: 1<br/>nombre: CARGO 1S<br/>created_at: 2024-11-25 20:58:53<br/>updated_at: 2024-11-25 22:36:14<br/>', 'CARGOS', '2024-11-25', '22:36:14', '2024-11-26 02:36:14', '2024-11-26 02:36:14'),
(6, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CARGO', 'id: 1<br/>nombre: CARGO 1S<br/>created_at: 2024-11-25 20:58:53<br/>updated_at: 2024-11-25 22:36:14<br/>', 'id: 1<br/>nombre: CARGO 1<br/>created_at: 2024-11-25 20:58:53<br/>updated_at: 2024-11-25 22:36:18<br/>', 'CARGOS', '2024-11-25', '22:36:18', '2024-11-26 02:36:18', '2024-11-26 02:36:18'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CARGO', 'id: 2<br/>nombre: CARGO 2<br/>created_at: 2024-11-25 22:36:26<br/>updated_at: 2024-11-25 22:36:26<br/>', NULL, 'CARGOS', '2024-11-25', '22:36:26', '2024-11-26 02:36:26', '2024-11-26 02:36:26'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$P2Dr07a6aQvUhqc3OML6SO8TdB9I4P6FdHurNdZ6FsQq76E6SV2pq<br/>foto: 1732574829_JPERES.jpg<br/>tipo: DOCTOR<br/>cargo_id: 1<br/>unidad_id: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 0<br/>status: <br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-11-25 22:47:09<br/>', NULL, 'USUARIOS', '2024-11-25', '22:47:09', '2024-11-26 02:47:09', '2024-11-26 02:47:09'),
(9, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$P2Dr07a6aQvUhqc3OML6SO8TdB9I4P6FdHurNdZ6FsQq76E6SV2pq<br/>foto: 1732574829_JPERES.jpg<br/>tipo: DOCTOR<br/>cargo_id: 1<br/>unidad_id: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 0<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-11-25 22:47:09<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$RC6QphnlynnEK3o4El.p7ukQuDPBlPscBGHgLx4uWqnL3vFRRBE76<br/>foto: 1732574829_JPERES.jpg<br/>tipo: DOCTOR<br/>cargo_id: 1<br/>unidad_id: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-11-25 22:47:13<br/>', 'USUARIOS', '2024-11-25', '22:47:13', '2024-11-26 02:47:13', '2024-11-26 02:47:13'),
(10, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PARTIDA', 'id: 1<br/>nro_partida: 111<br/>nombre: PARTIDA 1<br/>abreviatura: PAU<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:12:44<br/>updated_at: 2024-11-28 15:12:44<br/>', NULL, 'PARTIDAS', '2024-11-28', '15:12:44', '2024-11-28 19:12:44', '2024-11-28 19:12:44'),
(11, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA PARTIDA', 'id: 1<br/>nro_partida: 111<br/>nombre: PARTIDA 1<br/>abreviatura: PAU<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:12:44<br/>updated_at: 2024-11-28 15:12:44<br/>', 'id: 1<br/>nro_partida: 111<br/>nombre: PARTIDA 1<br/>abreviatura: PAUS<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:12:44<br/>updated_at: 2024-11-28 15:12:51<br/>', 'PARTIDAS', '2024-11-28', '15:12:51', '2024-11-28 19:12:51', '2024-11-28 19:12:51'),
(12, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA PARTIDA', 'id: 1<br/>nro_partida: 111<br/>nombre: PARTIDA 1<br/>abreviatura: PAUS<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:12:44<br/>updated_at: 2024-11-28 15:12:51<br/>', 'id: 1<br/>nro_partida: 111<br/>nombre: PARTIDA 1<br/>abreviatura: PAU<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:12:44<br/>updated_at: 2024-11-28 15:12:56<br/>', 'PARTIDAS', '2024-11-28', '15:12:56', '2024-11-28 19:12:56', '2024-11-28 19:12:56'),
(13, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA PARTIDA', 'id: 2<br/>nro_partida: 222<br/>nombre: PARTIDA 2<br/>abreviatura: PAD<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:13:07<br/>updated_at: 2024-11-28 15:13:07<br/>', NULL, 'PARTIDAS', '2024-11-28', '15:13:07', '2024-11-28 19:13:07', '2024-11-28 19:13:07'),
(14, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 1<br/>nombre: PRODUCTO1<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:36:49<br/>updated_at: 2024-11-28 15:36:49<br/>', NULL, 'PRODUCTOS', '2024-11-28', '15:36:49', '2024-11-28 19:36:49', '2024-11-28 19:36:49'),
(15, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PRODUCTO', 'id: 1<br/>nombre: PRODUCTO1<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:36:49<br/>updated_at: 2024-11-28 15:36:49<br/>', 'id: 1<br/>nombre: PRODUCTO1ASD<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:36:49<br/>updated_at: 2024-11-28 15:36:54<br/>', 'PRODUCTOS', '2024-11-28', '15:36:54', '2024-11-28 19:36:54', '2024-11-28 19:36:54'),
(16, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PRODUCTO', 'id: 1<br/>nombre: PRODUCTO1ASD<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:36:49<br/>updated_at: 2024-11-28 15:36:54<br/>', 'id: 1<br/>nombre: PRODUCTO1<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:36:49<br/>updated_at: 2024-11-28 15:36:57<br/>', 'PRODUCTOS', '2024-11-28', '15:36:57', '2024-11-28 19:36:57', '2024-11-28 19:36:57'),
(17, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 2<br/>nombre: PRODUCTO2<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 15:37:03<br/>updated_at: 2024-11-28 15:37:03<br/>', NULL, 'PRODUCTOS', '2024-11-28', '15:37:03', '2024-11-28 19:37:03', '2024-11-28 19:37:03'),
(18, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 1<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 100<br/>costo: 40<br/>total: 4000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:02:26<br/>updated_at: 2024-11-28 19:02:26<br/>', NULL, 'INGRESOS', '2024-11-28', '19:02:26', '2024-11-28 23:02:26', '2024-11-28 23:02:26'),
(19, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 2<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-2<br/>nro: 2<br/>donacion: NO<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 300<br/>costo: 20<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:05:24<br/>updated_at: 2024-11-28 19:05:24<br/>', NULL, 'INGRESOS', '2024-11-28', '19:05:24', '2024-11-28 23:05:24', '2024-11-28 23:05:24'),
(20, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 1<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 100<br/>costo: 40.00<br/>total: 4000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:02:26<br/>updated_at: 2024-11-28 19:02:26<br/>', 'id: 1<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 1000<br/>costo: 40.00<br/>total: 40000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:02:26<br/>updated_at: 2024-11-28 19:07:18<br/>', 'INGRESOS', '2024-11-28', '19:07:18', '2024-11-28 23:07:18', '2024-11-28 23:07:18'),
(21, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 1<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 1000<br/>costo: 40.00<br/>total: 40000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:02:26<br/>updated_at: 2024-11-28 19:07:18<br/>', 'id: 1<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 100<br/>costo: 40.00<br/>total: 4000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:02:26<br/>updated_at: 2024-11-28 19:07:25<br/>', 'INGRESOS', '2024-11-28', '19:07:25', '2024-11-28 23:07:25', '2024-11-28 23:07:25'),
(22, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PROGRAMA', 'id: 1<br/>nombre: PROGRAMA1<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:10:42<br/>updated_at: 2024-11-28 19:10:42<br/>', NULL, 'PROGRAMAS', '2024-11-28', '19:10:42', '2024-11-28 23:10:42', '2024-11-28 23:10:42'),
(23, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 3<br/>almacen_id: 2<br/>partida_id: 2<br/>unidad_id: <br/>programa_id: 1<br/>codigo: PAD-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 200<br/>costo: 45<br/>total: 9000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 19:11:17<br/>updated_at: 2024-11-28 19:11:17<br/>', NULL, 'INGRESOS', '2024-11-28', '19:11:17', '2024-11-28 23:11:17', '2024-11-28 23:11:17'),
(24, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 3<br/>nombre: PRODUCTO3<br/>fecha_registro: 2024-11-28<br/>created_at: 2024-11-28 20:42:29<br/>updated_at: 2024-11-28 20:42:29<br/>', NULL, 'PRODUCTOS', '2024-11-28', '20:42:29', '2024-11-29 00:42:29', '2024-11-29 00:42:29'),
(25, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 4<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-3<br/>nro: 3<br/>donacion: NO<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 500<br/>costo: 20<br/>total: 10000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>user_id: 1<br/>created_at: 2024-11-28 20:42:45<br/>updated_at: 2024-11-28 20:42:45<br/>', NULL, 'INGRESOS', '2024-11-28', '20:42:45', '2024-11-29 00:42:45', '2024-11-29 00:42:45'),
(26, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 3<br/>nombre: ALMACÉN<br/>permisos: 0<br/>usuarios: <br/>created_at: 2024-11-28 20:56:05<br/>updated_at: 2024-11-28 20:56:05<br/>', NULL, 'ROLES', '2024-11-28', '20:56:05', '2024-11-29 00:56:05', '2024-11-29 00:56:05'),
(27, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 1<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-1<br/>nro: 1<br/>donacion: NO<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 100<br/>costo: 40.00<br/>total: 4000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>user_id: 1<br/>created_at: 2024-11-28 19:02:26<br/>updated_at: 2024-11-28 19:07:25<br/>', 'id: 1<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-1<br/>nro: 1<br/>donacion: SI<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 100<br/>costo: 40.00<br/>total: 4000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>user_id: 1<br/>created_at: 2024-11-28 19:02:26<br/>updated_at: 2024-11-28 21:39:50<br/>', 'INGRESOS', '2024-11-28', '21:39:50', '2024-11-29 01:39:50', '2024-11-29 01:39:50'),
(28, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 2<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-2<br/>nro: 2<br/>donacion: NO<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 300<br/>costo: 20.00<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>user_id: 1<br/>created_at: 2024-11-28 19:05:24<br/>updated_at: 2024-11-28 19:05:24<br/>', 'id: 2<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-2<br/>nro: 2<br/>donacion: SI<br/>producto_id: 2<br/>unidad_medida_id: 1<br/>cantidad: 300<br/>costo: 20.00<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-28<br/>fecha_registro: 2024-11-28<br/>user_id: 1<br/>created_at: 2024-11-28 19:05:24<br/>updated_at: 2024-11-28 21:39:54<br/>', 'INGRESOS', '2024-11-28', '21:39:54', '2024-11-29 01:39:54', '2024-11-29 01:39:54'),
(29, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: DOCTOR<br/>cargo_id: 2<br/>unidad_id: 2<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: <br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 16:38:12<br/>', NULL, 'USUARIOS', '2024-11-29', '16:38:12', '2024-11-29 20:38:12', '2024-11-29 20:38:12'),
(30, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: 3<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: <br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:03:13<br/>', NULL, 'USUARIOS', '2024-11-29', '22:03:13', '2024-11-30 02:03:13', '2024-11-30 02:03:13'),
(31, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: 3<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:03:13<br/>', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marco@gmail.com<br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: 3<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:04:05<br/>', 'USUARIOS', '2024-11-29', '22:04:05', '2024-11-30 02:04:05', '2024-11-30 02:04:05'),
(32, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marco@gmail.com<br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: 3<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:04:05<br/>', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marco@gmail.com<br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: <br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:04:39<br/>', 'USUARIOS', '2024-11-29', '22:04:39', '2024-11-30 02:04:39', '2024-11-30 02:04:39'),
(33, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marco@gmail.com<br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: INTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: <br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:04:39<br/>', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marco@gmail.com<br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: 3<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:04:55<br/>', 'USUARIOS', '2024-11-29', '22:04:55', '2024-11-30 02:04:55', '2024-11-30 02:04:55'),
(34, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marco@gmail.com<br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: 3<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:04:55<br/>', 'id: 4<br/>usuario: MPOLO<br/>nombre: MARCO<br/>paterno: POLO<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marco@gmail.com<br/>fono: 67676767<br/>password: $2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW<br/>foto: 1732917793_MPOLO.jpg<br/>tipo: EXTERNO<br/>cargo_id: 1<br/>unidad_id: 1<br/>almacen_id: 3<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 22:03:13<br/>updated_at: 2024-11-29 22:04:55<br/>', 'USUARIOS', '2024-11-29', '22:05:07', '2024-11-30 02:05:07', '2024-11-30 02:05:07'),
(35, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_id: <br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 16:38:12<br/>', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_id: 1<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 22:10:21<br/>', 'USUARIOS', '2024-11-29', '22:10:21', '2024-11-30 02:10:21', '2024-11-30 02:10:21'),
(36, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_id: 1<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 22:10:21<br/>', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_id: 2<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 22:15:27<br/>', 'USUARIOS', '2024-11-29', '22:15:27', '2024-11-30 02:15:27', '2024-11-30 02:15:27'),
(37, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_id: 2<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 22:15:27<br/>', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_id: 1<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 16:38:12<br/>updated_at: 2024-11-29 22:17:03<br/>', 'USUARIOS', '2024-11-29', '22:17:03', '2024-11-30 02:17:03', '2024-11-30 02:17:03'),
(38, 3, 'CREACIÓN', 'EL USUARIO CMARTINES REGISTRO UN INGRESO', 'id: 5<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 2<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 157<br/>costo: 50<br/>total: 7850.00<br/>fecha_ingreso: 2024-11-29<br/>fecha_registro: 2024-11-29<br/>user_id: 3<br/>created_at: 2024-11-29 22:21:53<br/>updated_at: 2024-11-29 22:21:53<br/>', NULL, 'INGRESOS', '2024-11-29', '22:21:53', '2024-11-30 02:21:53', '2024-11-30 02:21:53'),
(39, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 5<br/>almacen_id: 1<br/>partida_id: <br/>unidad_id: 2<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: SI<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 157<br/>costo: 50.00<br/>total: 7850.00<br/>fecha_ingreso: 2024-11-29<br/>fecha_registro: 2024-11-29<br/>user_id: 3<br/>created_at: 2024-11-29 22:21:53<br/>updated_at: 2024-11-29 22:21:53<br/>', 'id: 5<br/>almacen_id: 1<br/>partida_id: 2<br/>unidad_id: 2<br/>programa_id: <br/>codigo: PAD-2<br/>nro: 2<br/>donacion: SI<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 157<br/>costo: 50.00<br/>total: 7850.00<br/>fecha_ingreso: 2024-11-29<br/>fecha_registro: 2024-11-29<br/>user_id: 3<br/>created_at: 2024-11-29 22:21:53<br/>updated_at: 2024-11-29 22:24:31<br/>', 'INGRESOS', '2024-11-29', '22:24:31', '2024-11-30 02:24:31', '2024-11-30 02:24:31'),
(40, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 6<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-4<br/>nro: 4<br/>donacion: NO<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 200<br/>costo: 30<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-30<br/>fecha_registro: 2024-11-30<br/>user_id: 1<br/>created_at: 2024-11-30 11:51:35<br/>updated_at: 2024-11-30 11:51:35<br/>', NULL, 'INGRESOS', '2024-11-30', '11:51:36', '2024-11-30 15:51:36', '2024-11-30 15:51:36'),
(41, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 6<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAU-4<br/>nro: 4<br/>donacion: NO<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 200<br/>costo: 30.00<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-30<br/>fecha_registro: 2024-11-30<br/>user_id: 1<br/>created_at: 2024-11-30 11:51:35<br/>updated_at: 2024-11-30 11:51:35<br/>', 'id: 6<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: NO<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 200<br/>costo: 30.00<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-30<br/>fecha_registro: 2024-11-30<br/>user_id: 1<br/>created_at: 2024-11-30 11:51:35<br/>updated_at: 2024-11-30 11:54:07<br/>', 'INGRESOS', '2024-11-30', '11:54:07', '2024-11-30 15:54:07', '2024-11-30 15:54:07'),
(42, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO', 'id: 6<br/>almacen_id: 1<br/>partida_id: 1<br/>unidad_id: 1<br/>programa_id: <br/>codigo: <br/>nro: <br/>donacion: NO<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 200<br/>costo: 30.00<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-30<br/>fecha_registro: 2024-11-30<br/>user_id: 1<br/>created_at: 2024-11-30 11:51:35<br/>updated_at: 2024-11-30 11:54:07<br/>', 'id: 6<br/>almacen_id: 1<br/>partida_id: 2<br/>unidad_id: 1<br/>programa_id: <br/>codigo: PAD-3<br/>nro: 3<br/>donacion: NO<br/>producto_id: 3<br/>unidad_medida_id: 1<br/>cantidad: 200<br/>costo: 30.00<br/>total: 6000.00<br/>fecha_ingreso: 2024-11-30<br/>fecha_registro: 2024-11-30<br/>user_id: 1<br/>created_at: 2024-11-30 11:51:35<br/>updated_at: 2024-11-30 11:57:03<br/>', 'INGRESOS', '2024-11-30', '11:57:03', '2024-11-30 15:57:03', '2024-11-30 15:57:03'),
(43, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 7<br/>almacen_id: 3<br/>partida_id: 1<br/>unidad_id: <br/>programa_id: <br/>codigo: PAU-4<br/>nro: 4<br/>donacion: SI<br/>producto_id: 1<br/>unidad_medida_id: 1<br/>cantidad: 30<br/>costo: 40<br/>total: 1200.00<br/>fecha_ingreso: 2024-11-30<br/>fecha_registro: 2024-11-30<br/>user_id: 1<br/>created_at: 2024-11-30 11:58:03<br/>updated_at: 2024-11-30 11:58:03<br/>', NULL, 'INGRESOS', '2024-11-30', '11:58:03', '2024-11-30 15:58:03', '2024-11-30 15:58:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `partida_id` bigint UNSIGNED DEFAULT NULL,
  `unidad_id` bigint UNSIGNED DEFAULT NULL,
  `programa_id` bigint UNSIGNED DEFAULT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro` int DEFAULT NULL,
  `donacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `ingresos` (`id`, `almacen_id`, `partida_id`, `unidad_id`, `programa_id`, `codigo`, `nro`, `donacion`, `producto_id`, `unidad_medida_id`, `cantidad`, `costo`, `total`, `fecha_ingreso`, `fecha_registro`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, 'PAU-1', 1, 'SI', 1, 1, 100, 40.00, 4000.00, '2024-11-28', '2024-11-28', 1, '2024-11-28 23:02:26', '2024-11-29 01:39:50'),
(2, 1, 1, 1, NULL, 'PAU-2', 2, 'SI', 2, 1, 300, 20.00, 6000.00, '2024-11-28', '2024-11-28', 1, '2024-11-28 23:05:24', '2024-11-29 01:39:54'),
(3, 2, 2, NULL, 1, 'PAD-1', 1, 'NO', 1, 1, 200, 45.00, 9000.00, '2024-11-28', '2024-11-28', 1, '2024-11-28 23:11:17', '2024-11-28 23:11:17'),
(4, 1, 1, 1, NULL, 'PAU-3', 3, 'NO', 3, 1, 500, 20.00, 10000.00, '2024-11-28', '2024-11-28', 1, '2024-11-29 00:42:45', '2024-11-29 00:42:45'),
(5, 1, 2, 2, NULL, 'PAD-2', 2, 'SI', 1, 1, 157, 50.00, 7850.00, '2024-11-29', '2024-11-29', 3, '2024-11-30 02:21:53', '2024-11-30 02:24:31'),
(6, 1, 2, 1, NULL, 'PAD-3', 3, 'NO', 3, 1, 200, 30.00, 6000.00, '2024-11-30', '2024-11-30', 1, '2024-11-30 15:51:35', '2024-11-30 15:57:03'),
(7, 3, 1, NULL, NULL, 'PAU-4', 4, 'SI', 1, 1, 30, 40.00, 1200.00, '2024-11-30', '2024-11-30', 1, '2024-11-30 15:58:03', '2024-11-30 15:58:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(15, '2024_11_25_203338_create_programas_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` bigint UNSIGNED NOT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `modulo`, `nombre`, `accion`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Gestión de usuarios', 'usuarios.index', 'VER', 'VER LA LISTA DE USUARIOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(2, 'Gestión de usuarios', 'usuarios.create', 'CREAR', 'CREAR USUARIOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(3, 'Gestión de usuarios', 'usuarios.edit', 'EDITAR', 'EDITAR USUARIOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(4, 'Gestión de usuarios', 'usuarios.destroy', 'ELIMINAR', 'ELIMINAR USUARIOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(5, 'Roles y Permisos', 'roles.index', 'VER', 'VER LA LISTA DE ROLES Y PERMISOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(6, 'Roles y Permisos', 'roles.create', 'CREAR', 'CREAR ROLES Y PERMISOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(7, 'Roles y Permisos', 'roles.edit', 'EDITAR', 'EDITAR ROLES Y PERMISOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(8, 'Roles y Permisos', 'roles.destroy', 'ELIMINAR', 'ELIMINAR ROLES Y PERMISOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(9, 'Configuración del sistema', 'configuracions.index', 'VER', 'VER INFORMACIÓN DE LA CONFIGURACIÓN DEL SISTEMA', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(10, 'Configuración del sistema', 'configuracions.edit', 'EDITAR', 'EDITAR LA CONFIGURACIÓN DEL SISTEMA', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(11, 'Cargos', 'cargos.index', 'VER', 'VER LA LISTA DE CARGOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(12, 'Cargos', 'cargos.create', 'CREAR', 'CREAR CARGOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(13, 'Cargos', 'cargos.edit', 'EDITAR', 'EDITAR CARGOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(14, 'Cargos', 'cargos.destroy', 'ELIMINAR', 'ELIMINAR CARGOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(15, 'Unidades', 'unidads.index', 'VER', 'VER LA LISTA DE UNIDADES', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(16, 'Unidades', 'unidads.create', 'CREAR', 'CREAR UNIDADES', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(17, 'Unidades', 'unidads.edit', 'EDITAR', 'EDITAR UNIDADES', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(18, 'Unidades', 'unidads.destroy', 'ELIMINAR', 'ELIMINAR UNIDADES', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(19, 'Partidas', 'partidas.index', 'VER', 'VER LA LISTA DE PARTIDAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(20, 'Partidas', 'partidas.create', 'CREAR', 'CREAR PARTIDAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(21, 'Partidas', 'partidas.edit', 'EDITAR', 'EDITAR PARTIDAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(22, 'Partidas', 'partidas.destroy', 'ELIMINAR', 'ELIMINAR PARTIDAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(23, 'Unidades de Medida', 'unidad_medidas.index', 'VER', 'VER LA LISTA DE UNIDADES DE MEDIDA', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(24, 'Unidades de Medida', 'unidad_medidas.create', 'CREAR', 'CREAR UNIDADES DE MEDIDA', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(25, 'Unidades de Medida', 'unidad_medidas.edit', 'EDITAR', 'EDITAR UNIDADES DE MEDIDA', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(26, 'Unidades de Medida', 'unidad_medidas.destroy', 'ELIMINAR', 'ELIMINAR UNIDADES DE MEDIDA', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(27, 'Productos', 'productos.index', 'VER', 'VER LA LISTA DE PRODUCTOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(28, 'Productos', 'productos.create', 'CREAR', 'CREAR PRODUCTOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(29, 'Productos', 'productos.edit', 'EDITAR', 'EDITAR PRODUCTOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(30, 'Productos', 'productos.destroy', 'ELIMINAR', 'ELIMINAR PRODUCTOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(31, 'Almacén', 'almacen1.index', 'ALMACÉN CENTROS', 'VER LA LISTA DE PRODUCTOS DEL ALMACÉN CENTROS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(32, 'Almacén', 'almacen2.index', 'ALMACÉN PROGRAMAS', 'VER LA LISTA DE PRODUCTOS DEL ALMACÉN PROGRAMAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(33, 'Almacén', 'almacen3.index', 'ALMACÉN FARMACIAS', 'VER LA LISTA DE PRODUCTOS DEL ALMACÉN FARMACIAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(34, 'Ingresos', 'ingresos.index', 'VER', 'VER LA LISTA DE INGRESOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(35, 'Ingresos', 'ingresos.create', 'CREAR', 'CREAR INGRESOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(36, 'Ingresos', 'ingresos.edit', 'EDITAR', 'EDITAR INGRESOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(37, 'Ingresos', 'ingresos.destroy', 'ELIMINAR', 'ELIMINAR INGRESOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(38, 'Egresos', 'egresos.index', 'VER', 'VER LA LISTA DE EGRESOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(39, 'Egresos', 'egresos.create', 'REGISTRAR', 'REGISTRAR EGRESOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(40, 'Programas', 'programas.index', 'VER', 'VER LA LISTA DE PROGRAMAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(41, 'Programas', 'programas.create', 'CREAR', 'CREAR PROGRAMAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(42, 'Programas', 'programas.edit', 'EDITAR', 'EDITAR PROGRAMAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(43, 'Programas', 'programas.destroy', 'ELIMINAR', 'ELIMINAR PROGRAMAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(44, 'Reportes', 'reportes.usuarios', 'GENERAR LISTA DE USUARIOS', 'GENERAR REPORTE LISTA DE USUARIOS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(45, 'Reportes', 'reportes.bimestral', 'GENERAR REPORTE BIMESTRAL', 'GENERAR REPORTES BIMESTRAL', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(46, 'Reportes', 'reportes.cuatrimestral', 'GENERAR REPORTE CUATRIMESTRAL', 'GENERAR REPORTES CUATRIMESTRAL', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(47, 'Reportes', 'reportes.conciliacion', 'GENERAR REPORTE CONCILIACION DE PRESUPUESTO', 'GENERAR REPORTES CONCILIACION DE PRESUPUESTO', '2024-11-26 01:03:40', '2024-11-26 01:03:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidas`
--

CREATE TABLE `partidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nro_partida` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abreviatura` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `partidas`
--

INSERT INTO `partidas` (`id`, `nro_partida`, `nombre`, `abreviatura`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, '111', 'PARTIDA 1', 'PAU', '2024-11-28', '2024-11-28 19:12:44', '2024-11-28 19:12:56'),
(2, '222', 'PARTIDA 2', 'PAD', '2024-11-28', '2024-11-28 19:13:07', '2024-11-28 19:13:07');

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
(1, 3, 19, '2024-11-29 20:38:53', '2024-11-29 20:38:53'),
(2, 3, 23, '2024-11-29 20:38:54', '2024-11-29 20:38:54'),
(3, 3, 27, '2024-11-29 20:38:56', '2024-11-29 20:38:56'),
(4, 3, 31, '2024-11-29 20:38:58', '2024-11-29 20:38:58'),
(5, 3, 34, '2024-11-29 20:40:09', '2024-11-29 20:40:09'),
(6, 3, 35, '2024-11-29 20:40:10', '2024-11-29 20:40:10'),
(7, 3, 38, '2024-11-29 20:40:12', '2024-11-29 20:40:12'),
(9, 3, 40, '2024-11-29 20:40:14', '2024-11-29 20:40:14'),
(11, 3, 46, '2024-11-29 20:40:16', '2024-11-29 20:40:16'),
(12, 3, 47, '2024-11-29 20:40:17', '2024-11-29 20:40:17'),
(13, 3, 45, '2024-11-29 20:41:05', '2024-11-29 20:41:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'PRODUCTO1', '2024-11-28', '2024-11-28 19:36:49', '2024-11-28 19:36:57'),
(2, 'PRODUCTO2', '2024-11-28', '2024-11-28 19:37:03', '2024-11-28 19:37:03'),
(3, 'PRODUCTO3', '2024-11-28', '2024-11-29 00:42:29', '2024-11-29 00:42:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id`, `nombre`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'PROGRAMA1', '2024-11-28', '2024-11-28 23:10:42', '2024-11-28 23:10:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(3, 'ALMACÉN', 0, 1, '2024-11-29 00:56:05', '2024-11-29 00:56:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidads`
--

CREATE TABLE `unidads` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigla` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidads`
--

INSERT INTO `unidads` (`id`, `nombre`, `sigla`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD 1', 'U1', '2024-11-25', '2024-11-26 01:00:23', '2024-11-26 02:30:59'),
(2, 'UNIDAD2', 'U2', '2024-11-25', '2024-11-26 02:31:08', '2024-11-26 02:31:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medidas`
--

CREATE TABLE `unidad_medidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abreviatura` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidad_medidas`
--

INSERT INTO `unidad_medidas` (`id`, `nombre`, `abreviatura`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD MEDIDA 1', 'U1', '2024-11-25', '2024-11-26 00:58:53', '2024-11-26 00:58:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo_id` bigint UNSIGNED DEFAULT NULL,
  `unidad_id` bigint UNSIGNED DEFAULT NULL,
  `almacen_id` bigint UNSIGNED DEFAULT NULL,
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

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `email`, `fono`, `password`, `foto`, `tipo`, `cargo_id`, `unidad_id`, `almacen_id`, `role_id`, `fecha_registro`, `acceso`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '', '0', '', '', '', '', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', NULL, 'INTERNO', 1, 1, NULL, 1, '2024-11-25', 1, 1, '2024-11-26 01:00:49', '2024-11-26 01:00:49'),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1111', 'LP', 'LOS OLIVOS', 'JUAN@GMAIL.COM', '7777777', '$2y$12$RC6QphnlynnEK3o4El.p7ukQuDPBlPscBGHgLx4uWqnL3vFRRBE76', '1732574829_JPERES.jpg', 'INTERNO', 1, 1, NULL, 2, '2024-11-25', 1, 1, '2024-11-26 02:47:09', '2024-11-26 02:47:13'),
(3, 'CMARTINES', 'CARLOS', 'MARTINES', 'PAREDES', '2222', 'LP', 'ZONA LOS OLIVOS', 'CARLOS@GMAIL.COM', '777777', '$2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra', NULL, 'EXTERNO', 2, 2, 1, 3, '2024-11-29', 1, 1, '2024-11-29 20:38:12', '2024-11-30 02:17:03'),
(4, 'MPOLO', 'MARCO', 'POLO', '', '3333', 'LP', 'LOS OLIVOS', 'marco@gmail.com', '67676767', '$2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW', '1732917793_MPOLO.jpg', 'EXTERNO', 1, 1, 3, 3, '2024-11-29', 1, 1, '2024-11-30 02:03:13', '2024-11-30 02:04:55');

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
  ADD UNIQUE KEY `ingresos_codigo_unique` (`codigo`),
  ADD KEY `ingresos_almacen_id_foreign` (`almacen_id`),
  ADD KEY `ingresos_partida_id_foreign` (`partida_id`),
  ADD KEY `ingresos_producto_id_foreign` (`producto_id`),
  ADD KEY `ingresos_unidad_medida_id_foreign` (`unidad_medida_id`),
  ADD KEY `ingresos_unidad_id_foreign` (`unidad_id`),
  ADD KEY `ingresos_programa_id_foreign` (`programa_id`),
  ADD KEY `ingresos_user_id_foreign` (`user_id`);

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
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacens`
--
ALTER TABLE `almacens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `unidads`
--
ALTER TABLE `unidads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `ingresos_programa_id_foreign` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`),
  ADD CONSTRAINT `ingresos_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidads` (`id`),
  ADD CONSTRAINT `ingresos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`),
  ADD CONSTRAINT `ingresos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
