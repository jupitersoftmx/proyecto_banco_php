-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-04-2023 a las 21:43:17
-- Versión del servidor: 10.11.2-MariaDB-1
-- Versión de PHP: 8.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_paypal`
--

CREATE TABLE `cuentas_paypal` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas_paypal`
--

INSERT INTO `cuentas_paypal` (`id`, `email`, `contraseña`) VALUES
(1, 'juan.perez@example.com', 'supersegura123'),
(2, 'juan.perez@example.com', 'supersegura123'),
(3, 'juan.perez@ejemplo.com', 'supersegura123'),
(4, 'maria.rodriguez@ejemplo.com', 'micontraseña456'),
(5, 'carlos.gonzalez@ejemplo.com', 'password789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_transferencias`
--

CREATE TABLE `sucursal_transferencias` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tienda_origen` varchar(255) NOT NULL,
  `tienda_destino` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursal_transferencias`
--

INSERT INTO `sucursal_transferencias` (`id`, `usuario_id`, `tienda_origen`, `tienda_destino`, `monto`) VALUES
(1, 1, 'tienda1', 'tienda2', 500.00),
(2, 3, 'tienda1', 'tienda3', 300.00),
(3, 4, 'tienda2', 'tienda1', 450.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre_tarjeta` varchar(255) NOT NULL,
  `numero_tarjeta` varchar(255) NOT NULL,
  `fecha_expiracion` varchar(7) NOT NULL,
  `cvv` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `moneda` varchar(3) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id`, `usuario_id`, `payment_method`, `payment_status`, `total`, `moneda`, `fecha`) VALUES
(1, 2, 'paypal', 'completed', 100.00, 'USD', '2023-04-16 09:14:30'),
(2, 3, 'paypal', 'completed', 100.00, 'USD', '2023-04-16 09:14:49'),
(3, 4, 'credit', 'completed', 150.00, 'GTQ', '2023-04-16 09:15:06'),
(4, 5, 'paypal', 'completed', 100.00, 'USD', '2023-04-16 09:29:38'),
(5, 6, 'credit', 'completed', 200.00, 'GTQ', '2023-04-16 09:30:14'),
(6, 7, 'paypal', 'completed', 100.00, 'USD', '2023-04-16 09:35:33'),
(7, 8, 'paypal', 'completed', 100.00, 'USD', '2023-04-16 09:37:11'),
(8, 9, 'paypal', 'completed', 100.00, 'USD', '2023-04-16 09:37:28'),
(9, 10, 'paypal', 'completed', 300.00, 'USD', '2023-04-16 09:37:44'),
(10, 11, 'credit', 'completed', 190.00, 'GTQ', '2023-04-16 09:39:03'),
(11, 13, 'paypal', 'completed', 300.00, 'USD', '2023-04-16 09:47:08'),
(12, 1, 'sucursal', 'completed', 500.00, 'USD', '2023-04-16 10:14:30'),
(13, 3, 'sucursal', 'completed', 300.00, 'USD', '2023-04-16 10:14:49'),
(14, 4, 'sucursal', 'completed', 450.00, 'USD', '2023-04-16 10:15:06'),
(15, 15, 'sucursal', 'pending', 200.00, 'USD', '2023-04-16 14:57:44'),
(16, 16, 'tarjeta', 'completed', 300.00, 'GTQ', '2023-04-16 14:58:25'),
(17, 17, 'paypal', 'completed', 20000.00, 'USD', '2023-04-16 15:05:36'),
(18, 18, 'paypal', 'completed', 20000.00, 'USD', '2023-04-16 15:07:12'),
(19, 19, 'paypal', 'completed', 20000.00, 'USD', '2023-04-16 15:07:24'),
(20, 20, 'paypal', 'completed', 333.00, 'USD', '2023-04-16 15:10:35'),
(21, 21, 'sucursal', 'pending', 333.00, 'USD', '2023-04-16 15:10:51'),
(22, 22, 'tarjeta', 'completed', 333.00, 'GTQ', '2023-04-16 15:10:57'),
(23, 23, 'paypal', 'completed', 44444.00, 'USD', '2023-04-16 15:12:56'),
(24, 24, 'paypal', 'completed', 3333.00, 'USD', '2023-04-16 15:14:31'),
(25, 25, 'paypal', 'completed', 23423.00, 'USD', '2023-04-16 15:27:46'),
(26, 26, 'paypal', 'completed', 234234.00, 'USD', '2023-04-16 15:29:41'),
(27, 28, 'paypal', 'completed', 234234.00, 'USD', '2023-04-16 15:42:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion_entrega` text NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha_compra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_completo`, `email`, `direccion_entrega`, `estado`, `fecha_compra`) VALUES
(1, 'Juan Pérez', 'juan.perez@ejemplo.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(2, 'Juan Pérez', 'juan.perez@ejemplo.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(3, 'Juan Pérez', 'juan.perez@ejemplo.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(4, 'Pedro Garcia', NULL, '456 Pine St. Anytown, CA 98765', 'California', '2023-04-16'),
(5, 'Juan Pérez', 'juan.perez@example.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(6, 'Pedro Rodríguez', NULL, '456 High St. Anytown, NY 12345', 'California', '2023-04-16'),
(7, 'Juan Pérez', 'juan.perez@example.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(8, 'Juan Pérez', 'juan.perez@example.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(9, 'Juan Pérez', 'juan.perez@example.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(10, 'Juan Pérez', 'juan.perez@example.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(11, 'Pedro Rodríguez', NULL, '456 High St. Anytown, NY 12345', 'California', '2023-04-16'),
(12, 'Juan Pérez', 'juan.perez@example.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(13, 'Juan Pérez', 'juan.perez@example.com', '123 Main St. Anytown, NY 12345', 'California', '2023-04-16'),
(14, 'John Doe', 'johndoe@example.com', 'Calle 123, Ciudad', 'activo', '2023-04-16'),
(15, 'Jane Doe', 'janedoe@example.com', 'Avenida 456, Ciudad', 'activo', '2023-04-16'),
(16, 'Michael Smith', 'michael@example.com', 'Calle 789, Ciudad', 'activo', '2023-04-16'),
(17, 'Juan Perez', 'juan.perez@example.com', 'supersegura123', 'activo', '2023-04-16'),
(18, 'Juan Perez', 'juan.perez@example.com', 'supersegura123', 'activo', '2023-04-16'),
(19, 'Juan Perez', 'juan.perez@example.com', 'supersegura123', 'activo', '2023-04-16'),
(20, 'Juan Perez', 'juan.perez@example.com', 'ksjhdakjdhaksjdhaksjdh', 'activo', '2023-04-16'),
(21, 'Juan Perez', 'juan.perez@example.com', 'ksjhdakjdhaksjdhaksjdh', 'activo', '2023-04-16'),
(22, 'Juan Perez', 'juan.perez@example.com', 'ksjhdakjdhaksjdhaksjdh', 'activo', '2023-04-16'),
(23, 'Juan Perez', 'juan.perez@example.com', 'ksjhdakjdhaksjdhaksjdh', 'activo', '2023-04-16'),
(24, 'Juan Perez', 'juan.perez@example.com', 'adasdasd', 'activo', '2023-04-16'),
(25, 'Juan Perez', 'juan.perez@example.com', 'lalalala', 'activo', '2023-04-16'),
(26, 'Juan Perez', 'juan.perez@example.com', 'asdfasdfasdf', 'activo', '2023-04-16'),
(27, 'Juan Perez', 'juan.perez@example.com', 'sdfsdfsdfsdfsdf', 'activo', '2023-04-16'),
(28, 'Juan Perez', 'juan.perez@example.com', 'sdfsdfsdfsdfsdf', 'activo', '2023-04-16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentas_paypal`
--
ALTER TABLE `cuentas_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursal_transferencias`
--
ALTER TABLE `sucursal_transferencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas_paypal`
--
ALTER TABLE `cuentas_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sucursal_transferencias`
--
ALTER TABLE `sucursal_transferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sucursal_transferencias`
--
ALTER TABLE `sucursal_transferencias`
  ADD CONSTRAINT `sucursal_transferencias_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
