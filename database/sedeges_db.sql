-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-04-2025 a las 14:46:42
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
  `grupo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(6, 'ALM CENTRO 3', 'CENTROS', NULL, '2024-12-11', '2024-12-11 19:53:27', '2024-12-11 19:53:27'),
(7, 'ALM CENTRO 4', 'CENTROS', NULL, '2025-01-15', '2025-01-15 13:43:46', '2025-01-15 13:43:46'),
(8, 'INSTITUTO DE REHABILITACIÓN INFANTIL', 'CENTROS', NULL, '2025-04-01', '2025-04-01 11:48:33', '2025-04-01 11:48:33'),
(9, 'PROGRAMA DE ATENCIÓN INTEGRAL A LA PRIMERA INFANCIA', 'PROGRAMAS', NULL, '2025-04-01', '2025-04-01 11:49:23', '2025-04-01 11:49:23'),
(10, 'INSTITUTO DE ADAPTACION INFANTIL', 'CENTROS', NULL, '2025-04-03', '2025-04-03 10:30:44', '2025-04-03 10:30:44'),
(11, 'PROGRAMA PROTECCION Y DEFENSA CONTRA LA MUJER IDH', 'PROGRAMAS', NULL, '2025-04-03', '2025-04-03 10:31:17', '2025-04-03 10:31:17');

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
(1, 'JEFE DE UNIDAD', '2024-11-26 00:58:53', '2024-12-05 23:15:37'),
(2, 'RESPONSABLE DE ALMACÉN', '2024-11-26 02:36:26', '2024-12-05 23:16:05'),
(3, 'AUXILIAR DE ALMACÉN', '2024-12-05 23:16:46', '2024-12-05 23:16:46'),
(4, 'RESPONSABLE DEL ÁREA DE SALUD', '2024-12-05 23:17:41', '2024-12-05 23:17:41'),
(5, 'ADMINISTRADOR(A)', '2025-04-01 11:43:12', '2025-04-01 11:43:12'),
(6, 'COORDINADOR(A)', '2025-04-01 11:43:32', '2025-04-01 11:43:32');

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
(1, 'SEDEGES', 'SEDEGES', 'logo.png', '2024-11-09 18:47:19', '2024-12-06 00:09:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_id` bigint UNSIGNED DEFAULT NULL,
  `ingreso_detalle_id` bigint UNSIGNED NOT NULL,
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

INSERT INTO `egresos` (`id`, `ingreso_id`, `ingreso_detalle_id`, `almacen_id`, `partida_id`, `producto_id`, `destino_id`, `cantidad`, `costo`, `total`, `fecha_registro`, `editable`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 8, 3, 13, NULL, 2, 230.00, 460.00, '2025-04-03', 1, '2025-04-03 09:56:58', '2025-04-03 09:56:58'),
(2, 3, 4, 9, 3, 3, NULL, 17, 4.50, 76.50, '2025-04-03', 1, '2025-04-03 10:19:45', '2025-04-03 10:20:13'),
(3, 1, 1, 1, 3, 4, 2, 20, 420.00, 8400.00, '2025-04-03', 1, '2025-04-03 10:55:41', '2025-04-23 14:46:14'),
(4, 1, 2, 1, 3, 2, 4, 185, 35.00, 6475.00, '2025-04-03', 1, '2025-04-03 10:55:41', '2025-04-23 14:03:40'),
(5, 4, 5, 4, 3, 3, NULL, 7, 4.80, 33.60, '2025-04-23', 1, '2025-04-23 14:02:25', '2025-04-23 14:02:25');

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
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 11<br/>usuario: CVILLCA<br/>nombre: CRISTIAN ENRIQUE<br/>paterno: VILLCA<br/>materno: LLANCO<br/>ci: 6944068<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: cvillcallanco@gmail.com<br/>fono: 70640850<br/>password: $2y$12$RhZtKl7kp2TT.YTrdc2zCe/xbFdjQ5J5Wj8q04CApwhzbQxWdsHnW<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 5<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: <br/>created_at: 2025-04-01 11:38:15<br/>updated_at: 2025-04-01 11:38:15<br/>', NULL, 'USUARIOS', '2025-04-01', '11:38:15', '2025-04-01 11:38:15', '2025-04-01 11:38:15'),
(2, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN USUARIO', 'id: 3<br/>usuario: CMARTINES<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: PAREDES<br/>ci: 2222<br/>ci_exp: LP<br/>dir: ZONA LOS OLIVOS<br/>email: CARLOS@GMAIL.COM<br/>fono: 777777<br/>password: $2y$12$5Od4Mg4s7778FMtVsfTSYeD.blo/B//MxzlfMfyoUZVov.PAIcxra<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-11-29<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-11-29 20:38:12<br/>updated_at: 2025-02-24 14:42:16<br/>', NULL, 'USUARIOS', '2025-04-01', '11:38:32', '2025-04-01 11:38:32', '2025-04-01 11:38:32'),
(3, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN USUARIO', 'id: 5<br/>usuario: MGONZALES<br/>nombre: MARTHA<br/>paterno: GONZALES<br/>materno: <br/>ci: 4444<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 66666<br/>password: $2y$12$sofR9iBzvE03Smup3Z5P9.xGpAmVNt4VPOyHjbobVjG0Aqturya/i<br/>foto: <br/>tipo: EXTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-12-05<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-05 19:39:06<br/>updated_at: 2024-12-05 19:39:06<br/>', NULL, 'USUARIOS', '2025-04-01', '11:38:41', '2025-04-01 11:38:41', '2025-04-01 11:38:41'),
(4, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN USUARIO', 'id: 7<br/>usuario: MGONZALES1<br/>nombre: MARTA<br/>paterno: GONZALES<br/>materno: PERES<br/>ci: 6666<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: marta@gmail.com<br/>fono: 77676767676<br/>password: $2y$12$ockZSCFccxZmgL0fkwdL.OZViJAZNCd4iTSZBb6u2KKpliep20Ncu<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 2<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2024-12-11<br/>acceso: 1<br/>status: 1<br/>created_at: 2024-12-11 19:27:03<br/>updated_at: 2024-12-11 19:27:18<br/>', NULL, 'USUARIOS', '2025-04-01', '11:38:48', '2025-04-01 11:38:48', '2025-04-01 11:38:48'),
(5, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CARGO', 'id: 5<br/>nombre: ADMINISTRADOR(A)<br/>created_at: 2025-04-01 11:43:12<br/>updated_at: 2025-04-01 11:43:12<br/>', NULL, 'CARGOS', '2025-04-01', '11:43:12', '2025-04-01 11:43:12', '2025-04-01 11:43:12'),
(6, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CARGO', 'id: 6<br/>nombre: COORDINADOR(A)<br/>created_at: 2025-04-01 11:43:32<br/>updated_at: 2025-04-01 11:43:32<br/>', NULL, 'CARGOS', '2025-04-01', '11:43:32', '2025-04-01 11:43:32', '2025-04-01 11:43:32'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 5<br/>nombre: CENTROS E INSTITUTOS<br/>permisos: 0<br/>usuarios: <br/>created_at: 2025-04-01 11:47:00<br/>updated_at: 2025-04-01 11:47:00<br/>', NULL, 'ROLES', '2025-04-01', '11:47:00', '2025-04-01 11:47:00', '2025-04-01 11:47:00'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 6<br/>nombre: PROGRAMAS<br/>permisos: 0<br/>usuarios: <br/>created_at: 2025-04-01 11:47:12<br/>updated_at: 2025-04-01 11:47:12<br/>', NULL, 'ROLES', '2025-04-01', '11:47:12', '2025-04-01 11:47:12', '2025-04-01 11:47:12'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CENTRO', 'id: 8<br/>nombre: INSTITUTO DE REHABILITACIÓN INFANTIL<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2025-04-01<br/>created_at: 2025-04-01 11:48:33<br/>updated_at: 2025-04-01 11:48:33<br/>', NULL, 'CENTROS', '2025-04-01', '11:48:33', '2025-04-01 11:48:33', '2025-04-01 11:48:33'),
(10, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PROGRAMA', 'id: 9<br/>nombre: PROGRAMA DE ATENCIÓN INTEGRAL A LA PRIMERA INFANCIA<br/>grupo: PROGRAMAS<br/>descripcion: <br/>fecha_registro: 2025-04-01<br/>created_at: 2025-04-01 11:49:23<br/>updated_at: 2025-04-01 11:49:23<br/>', NULL, 'PROGRAMAS', '2025-04-01', '11:49:23', '2025-04-01 11:49:23', '2025-04-01 11:49:23'),
(11, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA UNIDAD', 'id: 10<br/>nombre: INSTITUTO DE REHABILITACIÓN INFANTIL<br/>sigla: IRI<br/>fecha_registro: 2025-04-01<br/>created_at: 2025-04-01 11:51:26<br/>updated_at: 2025-04-01 11:51:26<br/>', NULL, 'UNIDADES', '2025-04-01', '11:51:26', '2025-04-01 11:51:26', '2025-04-01 11:51:26'),
(12, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 12<br/>usuario: APAYE<br/>nombre: ABIGAIL<br/>paterno: PAYE<br/>materno: CHIPANA<br/>ci: 606225<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: abigailpaye@gmail.com<br/>fono: 73450907<br/>password: $2y$12$7xpGEQoHp0K4wA2/GJ1aLegGMnUqua6/2C6qkvdUboIYznce9knR2<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 5<br/>unidad_id: 10<br/>almacen_todos: 0<br/>role_id: 5<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: <br/>created_at: 2025-04-01 11:54:08<br/>updated_at: 2025-04-01 11:54:09<br/>', NULL, 'USUARIOS', '2025-04-01', '11:54:09', '2025-04-01 11:54:09', '2025-04-01 11:54:09'),
(13, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA UNIDAD', 'id: 11<br/>nombre: PROGRAMA DE DESARROLLO INTEGRAL A LA PRIMERA INFANCIA<br/>sigla: PAIPI<br/>fecha_registro: 2025-04-01<br/>created_at: 2025-04-01 11:56:23<br/>updated_at: 2025-04-01 11:56:23<br/>', NULL, 'UNIDADES', '2025-04-01', '11:56:23', '2025-04-01 11:56:23', '2025-04-01 11:56:23'),
(14, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 13<br/>usuario: CTAPIA<br/>nombre: CARLOS<br/>paterno: TAPIA<br/>materno: TAPIA<br/>ci: 6062240<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: tapiacarlos@gmail.com<br/>fono: 71525148<br/>password: $2y$12$HQul/AeOyXph7MBf0zIvuuiXv.Mfxv3dHj4mIlv5BUUDe7Dw91/Jy<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 6<br/>unidad_id: 11<br/>almacen_todos: 0<br/>role_id: 6<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: <br/>created_at: 2025-04-01 11:57:30<br/>updated_at: 2025-04-01 11:57:30<br/>', NULL, 'USUARIOS', '2025-04-01', '11:57:30', '2025-04-01 11:57:30', '2025-04-01 11:57:30'),
(15, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 11<br/>usuario: CVILLCA<br/>nombre: CRISTIAN ENRIQUE<br/>paterno: VILLCA<br/>materno: LLANCO<br/>ci: 6944068<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: cvillcallanco@gmail.com<br/>fono: 70640850<br/>password: $2y$12$RhZtKl7kp2TT.YTrdc2zCe/xbFdjQ5J5Wj8q04CApwhzbQxWdsHnW<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 5<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: 1<br/>created_at: 2025-04-01 11:38:15<br/>updated_at: 2025-04-01 11:38:15<br/>', 'id: 11<br/>usuario: CVILLCA<br/>nombre: CRISTIAN ENRIQUE<br/>paterno: VILLCA<br/>materno: LLANCO<br/>ci: 6944068<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: cvillcallanco@gmail.com<br/>fono: 70640850<br/>password: $2y$12$9puWzN3UxC5QBpN6wc31TeKbdTZjZRPuGy/gu6/FxxrSVXH.Amtiy<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 5<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: 1<br/>created_at: 2025-04-01 11:38:15<br/>updated_at: 2025-04-01 12:01:45<br/>', 'USUARIOS', '2025-04-01', '12:01:45', '2025-04-01 12:01:45', '2025-04-01 12:01:45'),
(16, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 11<br/>usuario: CVILLCA<br/>nombre: CRISTIAN ENRIQUE<br/>paterno: VILLCA<br/>materno: LLANCO<br/>ci: 6944068<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: cvillcallanco@gmail.com<br/>fono: 70640850<br/>password: $2y$12$9puWzN3UxC5QBpN6wc31TeKbdTZjZRPuGy/gu6/FxxrSVXH.Amtiy<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 5<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: 1<br/>created_at: 2025-04-01 11:38:15<br/>updated_at: 2025-04-01 12:01:45<br/>', 'id: 11<br/>usuario: CVILLCA<br/>nombre: CRISTIAN ENRIQUE<br/>paterno: VILLCA<br/>materno: LLANCO<br/>ci: 6944068<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: cvillcallanco@gmail.com<br/>fono: 70640850<br/>password: $2y$12$IfnzTxKkMwp3vpsKppthROoJHeRYk7p0kPsM8vpoPIO.LoCeWo2pO<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 5<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: 1<br/>created_at: 2025-04-01 11:38:15<br/>updated_at: 2025-04-01 12:02:30<br/>', 'USUARIOS', '2025-04-01', '12:02:30', '2025-04-01 12:02:30', '2025-04-01 12:02:30'),
(17, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 11<br/>usuario: CVILLCA<br/>nombre: CRISTIAN ENRIQUE<br/>paterno: VILLCA<br/>materno: LLANCO<br/>ci: 6944068<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: cvillcallanco@gmail.com<br/>fono: 70640850<br/>password: $2y$12$IfnzTxKkMwp3vpsKppthROoJHeRYk7p0kPsM8vpoPIO.LoCeWo2pO<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 5<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: 1<br/>created_at: 2025-04-01 11:38:15<br/>updated_at: 2025-04-01 12:02:30<br/>', 'id: 11<br/>usuario: CVILLCA<br/>nombre: CRISTIAN ENRIQUE<br/>paterno: VILLCA<br/>materno: LLANCO<br/>ci: 6944068<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: cvillcallanco@gmail.com<br/>fono: 70640850<br/>password: $2y$12$IfnzTxKkMwp3vpsKppthROoJHeRYk7p0kPsM8vpoPIO.LoCeWo2pO<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 2<br/>unidad_id: 5<br/>almacen_todos: 0<br/>role_id: 3<br/>fecha_registro: 2025-04-01<br/>acceso: 1<br/>status: 1<br/>created_at: 2025-04-01 11:38:15<br/>updated_at: 2025-04-01 12:04:25<br/>', 'USUARIOS', '2025-04-01', '12:04:25', '2025-04-01 12:04:25', '2025-04-01 12:04:25'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 12<br/>usuario: APAYE<br/>nombre: ABIGAIL<br/>paterno: PAYE<br/>materno: CHIPANA<br/>ci: 606225<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: abigailpaye@gmail.com<br/>fono: 73450907<br/>password: $2y$12$7xpGEQoHp0K4wA2/GJ1aLegGMnUqua6/2C6qkvdUboIYznce9knR2<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 5<br/>unidad_id: 10<br/>almacen_todos: 0<br/>role_id: 5<br/>fecha_registro: 2025-04-01<br/>acceso: 0<br/>status: 1<br/>created_at: 2025-04-01 11:54:08<br/>updated_at: 2025-04-01 11:54:09<br/>', 'id: 12<br/>usuario: APAYE<br/>nombre: ABIGAIL<br/>paterno: PAYE<br/>materno: CHIPANA<br/>ci: 606225<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: abigailpaye@gmail.com<br/>fono: 73450907<br/>password: $2y$12$7xpGEQoHp0K4wA2/GJ1aLegGMnUqua6/2C6qkvdUboIYznce9knR2<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 5<br/>unidad_id: 10<br/>almacen_todos: 0<br/>role_id: 5<br/>fecha_registro: 2025-04-01<br/>acceso: 1<br/>status: 1<br/>created_at: 2025-04-01 11:54:08<br/>updated_at: 2025-04-01 12:04:35<br/>', 'USUARIOS', '2025-04-01', '12:04:35', '2025-04-01 12:04:35', '2025-04-01 12:04:35'),
(19, 11, 'CREACIÓN', 'EL USUARIO CVILLCA REGISTRO UN INGRESO', 'id: 1<br/>codigo: 5754<br/>donacion: NO<br/>almacen_id: 1<br/>unidad_id: <br/>proveedor: MARTHA TINTA TINTA<br/>con_fondos: <br/>fecha_nota: 2024-12-23<br/>nro_factura: 295<br/>fecha_factura: 2024-12-23<br/>pedido_interno: CM-420/2024<br/>total: 16975<br/>fecha_ingreso: 2024-12-23<br/>hora_ingreso: 10:17<br/>observaciones: <br/>para: <br/>fecha_registro: 2025-04-01<br/>user_id: 11<br/>created_at: 2025-04-01 12:11:41<br/>updated_at: 2025-04-01 12:11:41<br/>', NULL, 'INGRESOS', '2025-04-01', '12:11:41', '2025-04-01 12:11:41', '2025-04-01 12:11:41'),
(20, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 12<br/>usuario: APAYE<br/>nombre: ABIGAIL<br/>paterno: PAYE<br/>materno: CHIPANA<br/>ci: 606225<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: abigailpaye@gmail.com<br/>fono: 73450907<br/>password: $2y$12$7xpGEQoHp0K4wA2/GJ1aLegGMnUqua6/2C6qkvdUboIYznce9knR2<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 5<br/>unidad_id: 10<br/>almacen_todos: 0<br/>role_id: 5<br/>fecha_registro: 2025-04-01<br/>acceso: 1<br/>status: 1<br/>created_at: 2025-04-01 11:54:08<br/>updated_at: 2025-04-01 12:04:35<br/>', 'id: 12<br/>usuario: APAYE<br/>nombre: ABIGAIL<br/>paterno: PAYE<br/>materno: CHIPANA<br/>ci: 606225<br/>ci_exp: LP<br/>dir: 16 DE JULIO<br/>email: abigailpaye@gmail.com<br/>fono: 73450907<br/>password: $2y$12$ae9u6FvwV4kcamSI8e1WMOWVzGxsoBbh0XysXDwKZ05UZiewsB.ge<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 5<br/>unidad_id: 10<br/>almacen_todos: 0<br/>role_id: 5<br/>fecha_registro: 2025-04-01<br/>acceso: 1<br/>status: 1<br/>created_at: 2025-04-01 11:54:08<br/>updated_at: 2025-04-01 12:16:29<br/>', 'USUARIOS', '2025-04-01', '12:16:29', '2025-04-01 12:16:29', '2025-04-01 12:16:29'),
(21, 12, 'CREACIÓN', 'EL USUARIO APAYE REGISTRO UN PRODUCTO', 'id: 13<br/>nombre: TORTA<br/>fecha_registro: 2025-04-01<br/>created_at: 2025-04-01 12:18:00<br/>updated_at: 2025-04-01 12:18:00<br/>', NULL, 'PRODUCTOS', '2025-04-01', '12:18:00', '2025-04-01 12:18:00', '2025-04-01 12:18:00'),
(22, 12, 'CREACIÓN', 'EL USUARIO APAYE REGISTRO UNA UNIDAD DE MEDIDA', 'id: 11<br/>nombre: UNIDAD<br/>abreviatura: U<br/>fecha_registro: 2025-04-01<br/>created_at: 2025-04-01 12:18:25<br/>updated_at: 2025-04-01 12:18:25<br/>', NULL, 'UNIDADES DE MEDIDA', '2025-04-01', '12:18:25', '2025-04-01 12:18:25', '2025-04-01 12:18:25'),
(23, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 2<br/>codigo: 3737<br/>donacion: SI<br/>almacen_id: 8<br/>unidad_id: <br/>proveedor: PATELERIA MICHELLINE<br/>con_fondos: <br/>fecha_nota: <br/>nro_factura: <br/>fecha_factura: <br/>pedido_interno: NELLY FLORES CABIÑA<br/>total: 460<br/>fecha_ingreso: 2024-11-29<br/>hora_ingreso: 11:30<br/>observaciones: <br/>para: LOS NIÑOS DEL CENTRO<br/>fecha_registro: 2025-04-01<br/>user_id: 1<br/>created_at: 2025-04-01 12:22:21<br/>updated_at: 2025-04-01 12:22:21<br/>', NULL, 'INGRESOS', '2025-04-01', '12:22:21', '2025-04-01 12:22:21', '2025-04-01 12:22:21'),
(24, 11, 'CREACIÓN', 'EL USUARIO CVILLCA REGISTRO UNA UNIDAD DE MEDIDA', 'id: 12<br/>nombre: QUINTAL<br/>abreviatura: QQ<br/>fecha_registro: 2025-04-02<br/>created_at: 2025-04-02 11:27:12<br/>updated_at: 2025-04-02 11:27:12<br/>', NULL, 'UNIDADES DE MEDIDA', '2025-04-02', '11:27:12', '2025-04-02 11:27:12', '2025-04-02 11:27:12'),
(25, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ROLE', 'id: 4<br/>nombre: USUARIO EXTERNO<br/>permisos: 0<br/>usuarios: 1<br/>created_at: 2024-12-05 19:57:48<br/>updated_at: 2024-12-05 19:57:48<br/>', 'id: 4<br/>nombre: USUARIO EXTERNO<br/>permisos: 0<br/>usuarios: 1<br/>created_at: 2024-12-05 19:57:48<br/>updated_at: 2024-12-05 19:57:48<br/>', 'ROLES', '2025-04-03', '08:58:10', '2025-04-03 08:58:10', '2025-04-03 08:58:10'),
(26, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 3<br/>codigo: 5347<br/>donacion: SI<br/>almacen_id: 9<br/>unidad_id: <br/>proveedor: CEIBO<br/>con_fondos: <br/>fecha_nota: 2025-04-02<br/>nro_factura: <br/>fecha_factura: <br/>pedido_interno: ALAMECES<br/>total: 76.5<br/>fecha_ingreso: 2025-04-03<br/>hora_ingreso: 14:00<br/>observaciones: <br/>para: PARA LOS NIÑOS Y NIÑAS<br/>fecha_registro: 2025-04-03<br/>user_id: 1<br/>created_at: 2025-04-03 10:17:55<br/>updated_at: 2025-04-03 10:17:55<br/>', NULL, 'INGRESOS', '2025-04-03', '10:17:55', '2025-04-03 10:17:55', '2025-04-03 10:17:55'),
(27, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 14<br/>nombre: PAN MOLDE<br/>fecha_registro: 2025-04-03<br/>created_at: 2025-04-03 10:20:48<br/>updated_at: 2025-04-03 10:20:48<br/>', NULL, 'PRODUCTOS', '2025-04-03', '10:20:48', '2025-04-03 10:20:48', '2025-04-03 10:20:48'),
(28, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA UNIDAD DE MEDIDA', 'id: 13<br/>nombre: JUEGO DE MESA<br/>abreviatura: JM<br/>fecha_registro: 2025-04-03<br/>created_at: 2025-04-03 10:23:18<br/>updated_at: 2025-04-03 10:23:18<br/>', NULL, 'UNIDADES DE MEDIDA', '2025-04-03', '10:23:18', '2025-04-03 10:23:18', '2025-04-03 10:23:18'),
(29, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA UNIDAD', 'id: 12<br/>nombre: INSTITUTO DE ADAPTACION  INFANTIL<br/>sigla: IDAI<br/>fecha_registro: 2025-04-03<br/>created_at: 2025-04-03 10:29:58<br/>updated_at: 2025-04-03 10:29:58<br/>', NULL, 'UNIDADES', '2025-04-03', '10:29:58', '2025-04-03 10:29:58', '2025-04-03 10:29:58'),
(30, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CENTRO', 'id: 10<br/>nombre: INSTITUTO DE ADAPTACION INFANTIL<br/>grupo: CENTROS<br/>descripcion: <br/>fecha_registro: 2025-04-03<br/>created_at: 2025-04-03 10:30:44<br/>updated_at: 2025-04-03 10:30:44<br/>', NULL, 'CENTROS', '2025-04-03', '10:30:44', '2025-04-03 10:30:44', '2025-04-03 10:30:44'),
(31, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PROGRAMA', 'id: 11<br/>nombre: PROGRAMA PROTECCION Y DEFENSA CONTRA LA MUJER IDH<br/>grupo: PROGRAMAS<br/>descripcion: <br/>fecha_registro: 2025-04-03<br/>created_at: 2025-04-03 10:31:17<br/>updated_at: 2025-04-03 10:31:17<br/>', NULL, 'PROGRAMAS', '2025-04-03', '10:31:17', '2025-04-03 10:31:17', '2025-04-03 10:31:17'),
(32, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 14<br/>usuario: CCHAVEZ<br/>nombre: CRISTINA<br/>paterno: CHAVEZ<br/>materno: ORTUÑO<br/>ci: 15726955<br/>ci_exp: LP<br/>dir: GARITA<br/>email: CRISTINA089@GMAIL.COM<br/>fono: 76512692<br/>password: $2y$12$haXLwJhEcYC2zEfr75ZF7eGTCQXzvcR2W1StWtx533G/uWRdOGd7e<br/>foto: <br/>tipo: INTERNO<br/>cargo_id: 5<br/>unidad_id: 12<br/>almacen_todos: 0<br/>role_id: 2<br/>fecha_registro: 2025-04-03<br/>acceso: 0<br/>status: <br/>created_at: 2025-04-03 10:54:25<br/>updated_at: 2025-04-03 10:54:25<br/>', NULL, 'USUARIOS', '2025-04-03', '10:54:25', '2025-04-03 10:54:25', '2025-04-03 10:54:25'),
(33, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 4<br/>codigo: 3554<br/>donacion: SI<br/>almacen_id: 4<br/>unidad_id: <br/>proveedor: ALMACEN CENTRAL<br/>con_fondos: <br/>fecha_nota: 2025-04-02<br/>nro_factura: <br/>fecha_factura: <br/>pedido_interno: ALAMCENES<br/>total: 33.6<br/>fecha_ingreso: 2025-04-03<br/>hora_ingreso: 13:00<br/>observaciones: <br/>para: PARA EL PERSONAL<br/>fecha_registro: 2025-04-03<br/>user_id: 1<br/>created_at: 2025-04-03 11:01:57<br/>updated_at: 2025-04-03 11:01:57<br/>', NULL, 'INGRESOS', '2025-04-03', '11:01:57', '2025-04-03 11:01:57', '2025-04-03 11:01:57'),
(34, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 5<br/>codigo: 5151<br/>donacion: SI<br/>almacen_id: 2<br/>unidad_id: <br/>proveedor: EL MATADERO<br/>con_fondos: <br/>fecha_nota: <br/>nro_factura: <br/>fecha_factura: <br/>pedido_interno: ALMACEN CENTRAL<br/>total: 114.2<br/>fecha_ingreso: 2025-04-03<br/>hora_ingreso: 12:00<br/>observaciones: <br/>para: PARA LOS ANIMALES<br/>fecha_registro: 2025-04-03<br/>user_id: 1<br/>created_at: 2025-04-03 11:11:08<br/>updated_at: 2025-04-03 11:11:08<br/>', NULL, 'INGRESOS', '2025-04-03', '11:11:08', '2025-04-03 11:11:08', '2025-04-03 11:11:08'),
(35, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO', 'id: 6<br/>codigo: 3565<br/>donacion: NO<br/>almacen_id: 1<br/>unidad_id: <br/>proveedor: LIBRERIA<br/>con_fondos: 2313<br/>fecha_nota: 2025-04-02<br/>nro_factura: 15163<br/>fecha_factura: 2025-04-03<br/>pedido_interno: <br/>total: 233.79999999999998<br/>fecha_ingreso: 2025-04-03<br/>hora_ingreso: 15:00<br/>observaciones: <br/>para: <br/>fecha_registro: 2025-04-03<br/>user_id: 1<br/>created_at: 2025-04-03 11:21:40<br/>updated_at: 2025-04-03 11:21:40<br/>', NULL, 'INGRESOS', '2025-04-03', '11:21:40', '2025-04-03 11:21:40', '2025-04-03 11:21:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `donacion` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `unidad_id` bigint UNSIGNED DEFAULT NULL,
  `proveedor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `con_fondos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nota` date DEFAULT NULL,
  `nro_factura` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `pedido_interno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `para` varchar(700) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `codigo`, `donacion`, `almacen_id`, `unidad_id`, `proveedor`, `con_fondos`, `fecha_nota`, `nro_factura`, `fecha_factura`, `pedido_interno`, `total`, `fecha_ingreso`, `hora_ingreso`, `observaciones`, `para`, `fecha_registro`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '5754', 'NO', 1, NULL, 'MARTHA TINTA TINTA', '', '2024-12-23', '295', '2024-12-23', 'CM-420/2024', 16975.00, '2024-12-23', '10:17:00', '', '', '2025-04-01', 11, '2025-04-01 12:11:41', '2025-04-01 12:11:41'),
(2, '3737', 'SI', 8, NULL, 'PATELERIA MICHELLINE', '', NULL, NULL, NULL, 'NELLY FLORES CABIÑA', 460.00, '2024-11-29', '11:30:00', '', 'LOS NIÑOS DEL CENTRO', '2025-04-01', 1, '2025-04-01 12:22:21', '2025-04-01 12:22:21'),
(3, '5347', 'SI', 9, NULL, 'CEIBO', '', '2025-04-02', NULL, NULL, 'ALAMECES', 76.50, '2025-04-03', '14:00:00', '', 'PARA LOS NIÑOS Y NIÑAS', '2025-04-03', 1, '2025-04-03 10:17:55', '2025-04-03 10:17:55'),
(4, '3554', 'SI', 4, NULL, 'ALMACEN CENTRAL', '', '2025-04-02', NULL, NULL, 'ALAMCENES', 33.60, '2025-04-03', '13:00:00', '', 'PARA EL PERSONAL', '2025-04-03', 1, '2025-04-03 11:01:57', '2025-04-03 11:01:57'),
(5, '5151', 'SI', 2, NULL, 'EL MATADERO', '', NULL, NULL, NULL, 'ALMACEN CENTRAL', 114.20, '2025-04-03', '12:00:00', '', 'PARA LOS ANIMALES', '2025-04-03', 1, '2025-04-03 11:11:08', '2025-04-03 11:11:08'),
(6, '3565', 'NO', 1, NULL, 'LIBRERIA', '2313', '2025-04-02', '15163', '2025-04-03', '', 233.80, '2025-04-03', '15:00:00', '', '', '2025-04-03', 1, '2025-04-03 11:21:40', '2025-04-03 11:21:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_detalles`
--

CREATE TABLE `ingreso_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_id` bigint UNSIGNED NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `unidad_id` bigint UNSIGNED DEFAULT NULL,
  `partida_id` bigint UNSIGNED DEFAULT NULL,
  `donacion` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NO',
  `producto_id` bigint UNSIGNED NOT NULL,
  `unidad_medida_id` bigint UNSIGNED NOT NULL,
  `cantidad` int NOT NULL,
  `costo` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingreso_detalles`
--

INSERT INTO `ingreso_detalles` (`id`, `ingreso_id`, `almacen_id`, `unidad_id`, `partida_id`, `donacion`, `producto_id`, `unidad_medida_id`, `cantidad`, `costo`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 3, 'NO', 4, 1, 25, 420.00, 10500.00, '2025-04-01 12:11:41', '2025-04-01 12:11:41'),
(2, 1, 1, NULL, 3, 'NO', 2, 1, 185, 35.00, 6475.00, '2025-04-01 12:11:41', '2025-04-01 12:11:41'),
(3, 2, 8, NULL, 3, 'SI', 13, 1, 2, 230.00, 460.00, '2025-04-01 12:22:21', '2025-04-01 12:22:21'),
(4, 3, 9, NULL, 3, 'SI', 3, 9, 17, 4.50, 76.50, '2025-04-03 10:17:55', '2025-04-03 10:17:55'),
(5, 4, 4, NULL, 3, 'SI', 3, 10, 7, 4.80, 33.60, '2025-04-03 11:01:57', '2025-04-03 11:01:57'),
(6, 5, 2, NULL, 4, 'SI', 8, 2, 2, 57.10, 114.20, '2025-04-03 11:11:08', '2025-04-03 11:11:08'),
(7, 6, 1, NULL, 7, 'NO', 12, 1, 7, 33.40, 233.80, '2025-04-03 11:21:40', '2025-04-03 11:21:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `i_e_internos`
--

CREATE TABLE `i_e_internos` (
  `id` bigint UNSIGNED NOT NULL,
  `almacen_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `ingreso_id` bigint UNSIGNED NOT NULL,
  `ingreso_detalle_id` bigint UNSIGNED NOT NULL,
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

INSERT INTO `i_e_internos` (`id`, `almacen_id`, `producto_id`, `ingreso_id`, `ingreso_detalle_id`, `egreso_id`, `icantidad`, `icosto`, `itotal`, `ecantidad`, `etotal`, `registro_egreso`, `fecha_registro`, `fecha_egreso`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 1, 1, 3, 25, 420.00, 10500.00, NULL, NULL, 0, '2025-04-23', NULL, '2025-04-23 14:03:20', '2025-04-23 14:03:20'),
(2, 4, 2, 1, 2, 4, 185, 35.00, 6475.00, NULL, NULL, 0, '2025-04-23', NULL, '2025-04-23 14:03:40', '2025-04-23 14:03:40');

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
(15, '2024_11_25_203338_create_programas_table', 1),
(16, '2024_12_11_134007_create_user_almacens_table', 2),
(17, '2024_12_11_163041_create_i_e_internos_table', 3),
(18, '2025_02_24_105337_create_ingreso_detalles_table', 4);

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
(49, 'Reportes', 'reportes.ie_internos', 'GENERAR REPORTES DE INGRESOS Y EGRESOS INTERNOS', 'GENERAR REPORTES DE INGRESOS Y EGRESO INTERNOS DESDE EL ÁLMACEN CENTRAL A OTROS ALMACENES', '2024-12-11 17:32:23', '2024-12-11 17:32:23'),
(50, 'Egresos', 'egresos.edit', 'EDITAR', 'EDITAR EGRESOS', '2024-12-11 17:32:23', '2024-12-11 17:32:23');

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
(10, 3, 48, '2024-12-11 22:22:23', '2024-12-11 22:22:23'),
(11, 4, 35, '2025-02-24 19:42:44', '2025-02-24 19:42:44'),
(13, 4, 31, '2025-02-24 19:42:46', '2025-02-24 19:42:46'),
(15, 3, 23, '2025-04-01 11:58:45', '2025-04-01 11:58:45'),
(16, 3, 27, '2025-04-01 11:58:46', '2025-04-01 11:58:46'),
(17, 3, 24, '2025-04-01 11:58:47', '2025-04-01 11:58:47'),
(18, 3, 28, '2025-04-01 11:58:48', '2025-04-01 11:58:48'),
(19, 3, 15, '2025-04-01 11:58:52', '2025-04-01 11:58:52'),
(20, 3, 19, '2025-04-01 11:58:54', '2025-04-01 11:58:54'),
(21, 3, 20, '2025-04-01 11:58:55', '2025-04-01 11:58:55'),
(22, 3, 37, '2025-04-01 11:59:13', '2025-04-01 11:59:13'),
(23, 3, 41, '2025-04-01 11:59:15', '2025-04-01 11:59:15'),
(24, 3, 38, '2025-04-01 11:59:20', '2025-04-01 11:59:20'),
(25, 3, 42, '2025-04-01 11:59:21', '2025-04-01 11:59:21'),
(26, 3, 39, '2025-04-01 11:59:22', '2025-04-01 11:59:22'),
(27, 3, 43, '2025-04-01 11:59:22', '2025-04-01 11:59:22'),
(28, 5, 41, '2025-04-01 11:59:39', '2025-04-01 11:59:39'),
(29, 5, 42, '2025-04-01 11:59:40', '2025-04-01 11:59:40'),
(30, 5, 43, '2025-04-01 11:59:42', '2025-04-01 11:59:42'),
(31, 5, 46, '2025-04-01 11:59:48', '2025-04-01 11:59:48'),
(32, 5, 49, '2025-04-01 11:59:56', '2025-04-01 11:59:56'),
(33, 5, 15, '2025-04-01 12:00:04', '2025-04-01 12:00:04'),
(34, 5, 16, '2025-04-01 12:00:05', '2025-04-01 12:00:05'),
(35, 5, 23, '2025-04-01 12:00:12', '2025-04-01 12:00:12'),
(36, 5, 24, '2025-04-01 12:00:13', '2025-04-01 12:00:13'),
(37, 5, 27, '2025-04-01 12:00:16', '2025-04-01 12:00:16'),
(38, 5, 28, '2025-04-01 12:00:17', '2025-04-01 12:00:17'),
(39, 6, 37, '2025-04-01 12:00:36', '2025-04-01 12:00:36'),
(40, 6, 38, '2025-04-01 12:00:37', '2025-04-01 12:00:37'),
(41, 6, 39, '2025-04-01 12:00:38', '2025-04-01 12:00:38'),
(42, 6, 46, '2025-04-01 12:00:40', '2025-04-01 12:00:40'),
(43, 6, 49, '2025-04-01 12:00:42', '2025-04-01 12:00:42'),
(44, 6, 19, '2025-04-01 12:01:03', '2025-04-01 12:01:03'),
(46, 6, 23, '2025-04-01 12:01:06', '2025-04-01 12:01:06'),
(47, 6, 24, '2025-04-01 12:01:07', '2025-04-01 12:01:07'),
(48, 6, 20, '2025-04-01 12:01:08', '2025-04-01 12:01:08'),
(49, 6, 27, '2025-04-01 12:01:18', '2025-04-01 12:01:18'),
(50, 6, 28, '2025-04-01 12:01:19', '2025-04-01 12:01:19');

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
(12, 'HOJAS BOND T/CARTA PAQUETE DE 500 HOJAS', '2024-12-05', '2024-12-05 23:36:08', '2024-12-05 23:36:08'),
(13, 'TORTA', '2025-04-01', '2025-04-01 12:18:00', '2025-04-01 12:18:00'),
(14, 'PAN MOLDE', '2025-04-03', '2025-04-03 10:20:48', '2025-04-03 10:20:48');

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
(3, 'ALMACÉN', 0, 1, '2024-11-29 00:56:05', '2024-11-29 00:56:05'),
(4, 'USUARIO EXTERNO', 0, 1, '2024-12-05 19:57:48', '2024-12-05 19:57:48'),
(5, 'CENTROS E INSTITUTOS', 0, 1, '2025-04-01 11:47:00', '2025-04-01 11:47:00'),
(6, 'PROGRAMAS', 0, 1, '2025-04-01 11:47:12', '2025-04-01 11:47:12');

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
(1, 'UNIDAD ADMINISTRATIVA FINACIERA', 'UAF', '2024-11-25', '2024-11-26 01:00:23', '2024-12-05 23:19:27'),
(2, 'ÁREA DE PRESUPUESTOS', 'ADP', '2024-11-25', '2024-11-26 02:31:08', '2024-12-05 23:19:56'),
(4, 'UNIDAD DE SALUD', 'UDS', '2024-12-05', '2024-12-05 23:20:22', '2024-12-05 23:20:22'),
(5, 'SECCIÓN DE ALAMCENES', 'SDA', '2024-12-05', '2024-12-05 23:21:08', '2024-12-05 23:21:08'),
(6, 'CENTRO DE ACOGIDA FÉLIX MÉNDEZ ARCOS', 'CAFMA', '2024-12-05', '2024-12-05 23:21:41', '2024-12-05 23:21:41'),
(7, 'CENTRO DE ACOGIDA JOSÉ SORIA', 'CAJS', '2024-12-05', '2024-12-05 23:22:04', '2024-12-05 23:22:04'),
(8, 'CENTRO DE ACOGIDA NIÑO JESUS', 'CANJ', '2024-12-05', '2024-12-05 23:22:27', '2024-12-05 23:22:27'),
(9, 'CENTRO DE ACOGIDA ROSAURA CAMPOS', 'CARC', '2024-12-05', '2024-12-05 23:22:51', '2024-12-05 23:22:51'),
(10, 'INSTITUTO DE REHABILITACIÓN INFANTIL', 'IRI', '2025-04-01', '2025-04-01 11:51:26', '2025-04-01 11:51:26'),
(11, 'PROGRAMA DE DESARROLLO INTEGRAL A LA PRIMERA INFANCIA', 'PAIPI', '2025-04-01', '2025-04-01 11:56:23', '2025-04-01 11:56:23'),
(12, 'INSTITUTO DE ADAPTACION  INFANTIL', 'IDAI', '2025-04-03', '2025-04-03 10:29:58', '2025-04-03 10:29:58');

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
(1, 'UNIDAD', 'U', '2024-11-25', '2024-11-26 00:58:53', '2024-12-05 22:40:37'),
(2, 'KILOS', 'K', '2024-12-05', '2024-12-05 19:16:56', '2024-12-05 22:40:47'),
(3, 'METROS', 'MTS', '2024-12-05', '2024-12-05 22:40:55', '2024-12-05 22:40:55'),
(4, 'HOJA', 'H', '2024-12-05', '2024-12-05 23:13:50', '2024-12-05 23:13:50'),
(5, 'JUEGO', 'J', '2024-12-05', '2024-12-05 23:14:02', '2024-12-05 23:14:02'),
(6, 'PAQUETE', 'PQ', '2024-12-05', '2024-12-05 23:14:15', '2024-12-05 23:14:15'),
(7, 'PARES DUAL', 'PD', '2024-12-05', '2024-12-05 23:14:25', '2024-12-05 23:14:25'),
(8, 'PIEZA', 'PZ', '2024-12-05', '2024-12-05 23:14:33', '2024-12-05 23:14:33'),
(9, 'CAJA', 'CJ', '2024-12-05', '2024-12-05 23:14:52', '2024-12-05 23:14:52'),
(10, 'ROLLO', 'RO', '2024-12-05', '2024-12-05 23:15:04', '2024-12-05 23:15:04'),
(11, 'UNIDAD', 'U', '2025-04-01', '2025-04-01 12:18:25', '2025-04-01 12:18:25'),
(12, 'QUINTAL', 'QQ', '2025-04-02', '2025-04-02 11:27:12', '2025-04-02 11:27:12'),
(13, 'JUEGO DE MESA', 'JM', '2025-04-03', '2025-04-03 10:23:18', '2025-04-03 10:23:18');

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
(4, 'MPOLO', 'MARCO', 'POLO', '', '3333', 'LP', 'LOS OLIVOS', 'marco@gmail.com', '67676767', '$2y$12$tDcC3LnN6kaPBkhkDweEoeNRbC6edaXBOyfVjUpIenEvM0Xw2YFOW', '1732917793_MPOLO.jpg', 'EXTERNO', 1, 1, 0, 3, '2024-11-29', 1, 1, '2024-11-30 02:03:13', '2024-11-30 02:04:55'),
(6, 'RMONTES', 'RAMIRO', 'MONTES', 'CONDE', '5555', 'LP', 'LOS PEDREGALES', 'ramiro@gmail.com', '6666666', '$2y$12$vGC2J8mbyPWu..Un7Qj0UO19HmBaMEgp8q1XnG4l8GLa8cX93Lsli', NULL, 'EXTERNO', 4, 6, 0, 4, '2024-12-05', 1, 1, '2024-12-05 19:59:07', '2024-12-11 22:44:35'),
(8, 'ABORDEGON', 'ALFONSO', 'BORDEGON', '', '7777', 'LP', 'ZONA OS OLIVOS', 'alfonso@gmail.com', '77887788', '$2y$12$lkwwc7AmQmQ4od7dY05HneGCrEw3XrtrcYYySUf3tZocVhU/0E9s.', NULL, 'INTERNO', 1, 1, 1, 2, '2025-01-21', 1, 1, '2025-01-21 14:11:09', '2025-01-21 14:11:09'),
(10, 'PGONZALES', 'PABLO', 'GONZALES', 'GONZALES', '8888', 'CB', 'LOS OLIVOS', NULL, '7676676767', '$2y$12$EB0oBO9KQ7kJFY4dLJplruQ6PNe3C3Z7DEXiziGblTh9Tp7p9DKC.', NULL, 'INTERNO', 3, 1, 1, 4, '2025-02-24', 1, 1, '2025-02-24 19:43:24', '2025-02-24 19:43:24'),
(11, 'CVILLCA', 'CRISTIAN ENRIQUE', 'VILLCA', 'LLANCO', '6944068', 'LP', '16 DE JULIO', 'cvillcallanco@gmail.com', '70640850', '$2y$12$IfnzTxKkMwp3vpsKppthROoJHeRYk7p0kPsM8vpoPIO.LoCeWo2pO', NULL, 'INTERNO', 2, 5, 0, 3, '2025-04-01', 1, 1, '2025-04-01 11:38:15', '2025-04-01 12:04:25'),
(12, 'APAYE', 'ABIGAIL', 'PAYE', 'CHIPANA', '606225', 'LP', '16 DE JULIO', 'abigailpaye@gmail.com', '73450907', '$2y$12$ae9u6FvwV4kcamSI8e1WMOWVzGxsoBbh0XysXDwKZ05UZiewsB.ge', NULL, 'INTERNO', 5, 10, 0, 5, '2025-04-01', 1, 1, '2025-04-01 11:54:08', '2025-04-01 12:16:29'),
(13, 'CTAPIA', 'CARLOS', 'TAPIA', 'TAPIA', '6062240', 'LP', '16 DE JULIO', 'tapiacarlos@gmail.com', '71525148', '$2y$12$HQul/AeOyXph7MBf0zIvuuiXv.Mfxv3dHj4mIlv5BUUDe7Dw91/Jy', NULL, 'INTERNO', 6, 11, 0, 6, '2025-04-01', 0, 1, '2025-04-01 11:57:30', '2025-04-01 11:57:30'),
(14, 'CCHAVEZ', 'CRISTINA', 'CHAVEZ', 'ORTUÑO', '15726955', 'LP', 'GARITA', 'CRISTINA089@GMAIL.COM', '76512692', '$2y$12$haXLwJhEcYC2zEfr75ZF7eGTCQXzvcR2W1StWtx533G/uWRdOGd7e', NULL, 'INTERNO', 5, 12, 0, 2, '2025-04-03', 0, 1, '2025-04-03 10:54:25', '2025-04-03 10:54:25');

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
(8, 6, 1, '2025-01-21 14:32:37', '2025-01-21 14:32:37'),
(9, 6, 4, '2025-01-21 14:32:37', '2025-01-21 14:32:37'),
(10, 6, 7, '2025-01-21 14:32:37', '2025-01-21 14:32:37'),
(16, 11, 1, '2025-04-01 11:38:15', '2025-04-01 11:38:15'),
(17, 12, 8, '2025-04-01 11:54:09', '2025-04-01 11:54:09'),
(18, 13, 9, '2025-04-01 11:57:30', '2025-04-01 11:57:30'),
(19, 14, 1, '2025-04-03 10:54:25', '2025-04-03 10:54:25');

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
  ADD KEY `ingresos_unidad_id_foreign` (`unidad_id`),
  ADD KEY `ingresos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_detalles_ingreso_id_foreign` (`ingreso_id`),
  ADD KEY `ingreso_detalles_almacen_id_foreign` (`almacen_id`),
  ADD KEY `ingreso_detalles_unidad_id_foreign` (`unidad_id`),
  ADD KEY `ingreso_detalles_partida_id_foreign` (`partida_id`),
  ADD KEY `ingreso_detalles_producto_id_foreign` (`producto_id`),
  ADD KEY `ingreso_detalles_unidad_medida_id_foreign` (`unidad_medida_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `i_e_internos`
--
ALTER TABLE `i_e_internos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `unidads`
--
ALTER TABLE `unidads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `user_almacens`
--
ALTER TABLE `user_almacens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  ADD CONSTRAINT `ingresos_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidads` (`id`),
  ADD CONSTRAINT `ingresos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD CONSTRAINT `ingreso_detalles_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacens` (`id`),
  ADD CONSTRAINT `ingreso_detalles_ingreso_id_foreign` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`),
  ADD CONSTRAINT `ingreso_detalles_partida_id_foreign` FOREIGN KEY (`partida_id`) REFERENCES `partidas` (`id`),
  ADD CONSTRAINT `ingreso_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `ingreso_detalles_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidads` (`id`),
  ADD CONSTRAINT `ingreso_detalles_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`);

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
