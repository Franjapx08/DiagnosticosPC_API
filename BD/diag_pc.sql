-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-11-2019 a las 09:12:33
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `diag_pc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(199) NOT NULL,
  `email` varchar(199) NOT NULL,
  `Celular` varchar(50) NOT NULL,
  `Referencia` varchar(99) NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `Nombre`, `email`, `Celular`, `Referencia`, `estatus`) VALUES
(1, 'Esteban Prado', 'esteban@gmail.com', '6121570206', 'EMPRESA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(199) NOT NULL,
  `Marca` varchar(199) NOT NULL,
  `Modelo` varchar(199) NOT NULL,
  `NoSerie` varchar(199) NOT NULL,
  `Observacion` longtext NOT NULL,
  `ReporteFalla` longtext NOT NULL,
  `FechaIngreso` date NOT NULL,
  `HoraIngreso` time NOT NULL,
  `FechaPrometida` date NOT NULL,
  `HoraPrometida` time NOT NULL,
  `estatus` int(11) NOT NULL,
  `estatus_act` int(11) NOT NULL,
  `Usuarios_id` int(11) NOT NULL,
  `Clientes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Producto_Usuarios_idx` (`Usuarios_id`),
  KEY `fk_Producto_Clientes1_idx` (`Clientes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `producto`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(199) NOT NULL,
  `email` varchar(199) NOT NULL,
  `password` varchar(99) NOT NULL,
  `tipoUser` int(11) NOT NULL COMMENT '0 = admin\n1 = normal',
  `estatus` int(11) NOT NULL COMMENT '0 = activo\n1 = desactivo\n2 = eliminado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `tipoUser`, `estatus`) VALUES
(1, 'Jesus Vega', 'jesus_bmx_playforlife_@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Clientes1` FOREIGN KEY (`Clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Usuarios` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
