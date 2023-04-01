-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-12-2022 a las 21:02:05
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd-pizza-paso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactanos`
--

DROP TABLE IF EXISTS `contactanos`;
CREATE TABLE IF NOT EXISTS `contactanos` (
  `IdContactanos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `mensaje` varchar(50) NOT NULL,
  `IdUsuario` int NOT NULL,
  PRIMARY KEY (`IdContactanos`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `contactanos`
--

INSERT INTO `contactanos` (`IdContactanos`, `nombre`, `email`, `numero`, `fecha`, `direccion`, `mensaje`, `IdUsuario`) VALUES
(1, 'Georgui Azel Pacheco Sandoval', 'azelps071del@gmail.com', '963852741', '2022-12-18', 'Av. Colombia 123', 'Necesito su servicio', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `IdDetalle` int NOT NULL AUTO_INCREMENT,
  `CantidadVendida` int NOT NULL,
  `Subtotal` float NOT NULL,
  `IDProducto` int NOT NULL,
  `IDVenta` int NOT NULL,
  PRIMARY KEY (`IdDetalle`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`IdDetalle`, `CantidadVendida`, `Subtotal`, `IDProducto`, `IDVenta`) VALUES
(1, 1, 3, 1, 0),
(2, 1, 15, 2, 0),
(3, 1, 4, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `IDProducto` int NOT NULL AUTO_INCREMENT,
  `NombreProducto` varchar(45) DEFAULT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `Precio` varchar(45) DEFAULT NULL,
  `Descripción` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`IDProducto`, `NombreProducto`, `Cantidad`, `Precio`, `Descripción`) VALUES
(1, 'DOS BOLAS DE HELADO', '100', '3', 'DOS BOLAS DE HELADO'),
(2, '1 LITRO DE HELADO', '100', '15', '1 LITRO DE HELADO'),
(3, 'PORCION DE PIZZA', '100', '4', 'PORCION DE PIZZA'),
(4, 'MEDIO DISCO DE PIZZA', '100', '21', 'MEDIO DISCO DE PIZZA'),
(5, 'DISCO COMPLETO DE PIZZA', '100', '42', 'DISCO COMPLETO DE PIZZA'),
(6, 'CAFE', '100', '2', 'CAFE'),
(7, 'GASEOSA', '100', '2', 'GASEOSA'),
(8, 'AGUA SIN GAS', '100', '1', 'AGUA SIN GAS'),
(9, 'SANDWICH CON CHICHARRÓN', '100', '15', 'SANDWICH CON CHICHARRÓN'),
(10, 'SANDWICH CON POLLO', '100', '12', 'SANDWICH CON POLLO'),
(11, 'CAFE HELADO', '100', '15', 'CAFE HELADO'),
(12, 'CAFE AMERICANO', '100', '15', 'CAFE AMERICANO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamos`
--

DROP TABLE IF EXISTS `reclamos`;
CREATE TABLE IF NOT EXISTS `reclamos` (
  `IDreclamo` int NOT NULL AUTO_INCREMENT,
  `Apellidos` varchar(50) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Teléfono` varchar(10) NOT NULL,
  `TipDocumento` varchar(15) NOT NULL,
  `NumDocumento` varchar(12) NOT NULL,
  `Dirección` varchar(40) NOT NULL,
  `TipoBien` varchar(12) NOT NULL,
  `MontoReclamo` varchar(10) NOT NULL,
  `Reclamación` varchar(150) NOT NULL,
  `Boleta` varchar(20) NOT NULL,
  `FechaPedido` varchar(10) NOT NULL,
  `Detalle` varchar(150) NOT NULL,
  `PedidoConcreto` varchar(150) NOT NULL,
  `FechaIncidente` varchar(12) NOT NULL,
  `IdUsuario` int NOT NULL,
  PRIMARY KEY (`IDreclamo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reclamos`
--

INSERT INTO `reclamos` (`IDreclamo`, `Apellidos`, `Nombres`, `Correo`, `Teléfono`, `TipDocumento`, `NumDocumento`, `Dirección`, `TipoBien`, `MontoReclamo`, `Reclamación`, `Boleta`, `FechaPedido`, `Detalle`, `PedidoConcreto`, `FechaIncidente`, `IdUsuario`) VALUES
(1, 'Pacheco Sandoval', 'Georgui Azel', '987654321', 'dni', '71637129', 'Av . Peru 47', 'producto', '159', 'Compra de ', 'reclamo', '789', '2022-12-17', 'Helado de Fresa', 'Devolución de dinero', '2022-12-11', 2),
(2, 'Isasi Sandoval', 'Magaly Edith', '963852741', 'dni', '71637129', 'Av. Manzanil', 'servicio', '456', 'Necesito l', 'queja', '465', '2022-12-21', 'El suceso sucedió en el local de la calle Av. La libertad', 'Devolución de dinero', '2022-12-25', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `IdReserva` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `IdUsuario` int NOT NULL,
  PRIMARY KEY (`IdReserva`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`IdReserva`, `username`, `numero`, `fecha`, `IdUsuario`) VALUES
(1, 'Georgui Azel Pacheco Sandoval', '963852741', '2022-12-07', 2),
(2, 'Fernanda Quintanilla Zegarra', '9876543213', '2022-12-15', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `IdUsuario` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`IdUsuario`, `fullname`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'Pacheco Sandoval', 'Georgui Azel ', 'zeusmens123@gmail.com', '123456789', '2022-12-07 19:54:02'),
(2, 'Quintanilla ', 'Fernanda ', 'azelps071del@gmail.com', '789456123', '2022-12-07 21:55:24'),
(3, 'Gonzales Fernández ', 'Fernando Juan', 'fernando071del@gmail.com', '159753', '2022-12-08 21:04:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `IDVenta` int NOT NULL AUTO_INCREMENT,
  `FechaVenta` varchar(45) DEFAULT NULL,
  `ValorPagar` int DEFAULT NULL,
  `IdUsuario` int NOT NULL,
  PRIMARY KEY (`IDVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`IDVenta`, `FechaVenta`, `ValorPagar`, `IdUsuario`) VALUES
(1, '2022-12-09 15:16:44', 55, 2),
(2, '2022-12-09 15:19:57', 22, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
