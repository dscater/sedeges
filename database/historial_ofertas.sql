-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-12-2024 a las 15:43:40
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
-- Base de datos: `unibienes_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_ofertas`
--

CREATE TABLE `historial_ofertas` (
  `id` bigint UNSIGNED NOT NULL,
  `subasta_cliente_id` bigint UNSIGNED NOT NULL,
  `subasta_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `puja` decimal(8,2) NOT NULL,
  `fecha_oferta` date DEFAULT NULL,
  `hora_oferta` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_ofertas`
--

INSERT INTO `historial_ofertas` (`id`, `subasta_cliente_id`, `subasta_id`, `cliente_id`, `puja`, `fecha_oferta`, `hora_oferta`, `created_at`, `updated_at`) VALUES
(1, 15, 21, 2, 3000.00, '2024-12-02', '13:47:22', '2024-12-02 17:47:22', '2024-12-02 17:47:22'),
(2, 16, 21, 1, 3001.00, '2024-12-02', '13:48:00', '2024-12-02 17:47:32', '2024-12-02 17:47:32'),
(3, 17, 22, 1, 20000.00, '2024-12-02', '13:56:00', '2024-12-02 17:56:06', '2024-12-02 17:56:06'),
(4, 18, 22, 3, 20500.00, '2024-12-02', '13:58:00', '2024-12-02 17:58:22', '2024-12-02 17:58:22'),
(5, 18, 22, 3, 20501.00, '2024-12-02', '13:58:52', '2024-12-02 17:58:52', '2024-12-02 17:58:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historial_ofertas`
--
ALTER TABLE `historial_ofertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_ofertas_subasta_cliente_id_foreign` (`subasta_cliente_id`),
  ADD KEY `historial_ofertas_subasta_id_foreign` (`subasta_id`),
  ADD KEY `historial_ofertas_cliente_id_foreign` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial_ofertas`
--
ALTER TABLE `historial_ofertas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_ofertas`
--
ALTER TABLE `historial_ofertas`
  ADD CONSTRAINT `historial_ofertas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `historial_ofertas_subasta_cliente_id_foreign` FOREIGN KEY (`subasta_cliente_id`) REFERENCES `subasta_clientes` (`id`),
  ADD CONSTRAINT `historial_ofertas_subasta_id_foreign` FOREIGN KEY (`subasta_id`) REFERENCES `subastas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
