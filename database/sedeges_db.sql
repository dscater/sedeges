-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-11-2024 a las 22:47:40
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
(9, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$P2Dr07a6aQvUhqc3OML6SO8TdB9I4P6FdHurNdZ6FsQq76E6SV2pq<br/>foto: 1732574829_JPERES.jpg<br/>tipo: DOCTOR<br/>cargo_id: 1<br/>unidad_id: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 0<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-11-25 22:47:09<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 7777777<br/>password: $2y$12$RC6QphnlynnEK3o4El.p7ukQuDPBlPscBGHgLx4uWqnL3vFRRBE76<br/>foto: 1732574829_JPERES.jpg<br/>tipo: DOCTOR<br/>cargo_id: 1<br/>unidad_id: 1<br/>role_id: 2<br/>fecha_registro: 2024-11-25<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-25 22:47:09<br/>updated_at: 2024-11-25 22:47:13<br/>', 'USUARIOS', '2024-11-25', '22:47:13', '2024-11-26 02:47:13', '2024-11-26 02:47:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `partida_id` bigint UNSIGNED DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `donacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `unidad_medida_id` bigint UNSIGNED NOT NULL,
  `cantidad` int NOT NULL,
  `costo` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(31, 'Almacén', 'almacen1.index', 'VER', 'VER LA LISTA DE PRODUCTOS DEL ALMACÉN CENTROS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(32, 'Almacén', 'almacen2.index', 'VER', 'VER LA LISTA DE PRODUCTOS DEL ALMACÉN PROGRAMAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
(33, 'Almacén', 'almacen3.index', 'VER', 'VER LA LISTA DE PRODUCTOS DEL ALMACÉN FARMACIAS', '2024-11-26 01:03:40', '2024-11-26 01:03:40'),
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
(2, 'ADMINISTRADOR', 0, 1, '2024-11-26 00:59:19', '2024-11-26 00:59:19');

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

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `email`, `fono`, `password`, `foto`, `tipo`, `cargo_id`, `unidad_id`, `role_id`, `fecha_registro`, `acceso`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '', '0', '', '', '', '', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', NULL, '', 1, 1, 1, '2024-11-25', 1, 1, '2024-11-26 01:00:49', '2024-11-26 01:00:49'),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1111', 'LP', 'LOS OLIVOS', 'JUAN@GMAIL.COM', '7777777', '$2y$12$RC6QphnlynnEK3o4El.p7ukQuDPBlPscBGHgLx4uWqnL3vFRRBE76', '1732574829_JPERES.jpg', 'DOCTOR', 1, 1, 2, '2024-11-25', 1, 1, '2024-11-26 02:47:09', '2024-11-26 02:47:13');

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
  ADD KEY `ingresos_unidad_medida_id_foreign` (`unidad_medida_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `ingresos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`);

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
