-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2022 a las 14:19:55
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fabricaeliquidExportada`
--
CREATE DATABASE IF NOT EXISTS `fabricaeliquidExportada` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fabricaeliquidExportada`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aroma`
--

CREATE TABLE `aroma` (
  `codAroma` varchar(4) NOT NULL,
  `aroma` varchar(20) NOT NULL,
  `categoria` enum('frutal','postre','tabaquil','artificial') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aroma`
--

INSERT INTO `aroma` (`codAroma`, `aroma`, `categoria`) VALUES
('0001', 'manzana', 'frutal'),
('0002', 'melón', 'frutal'),
('0003', 'coco', 'frutal'),
('0004', 'mango', 'frutal'),
('0005', 'kiwi', 'frutal'),
('0006', 'nata', 'postre'),
('0007', 'galleta', 'postre'),
('0008', 'vainilla', 'postre'),
('0009', 'tabaco rubio', 'tabaquil'),
('0010', 'ron', 'artificial'),
('0011', 'cacao', 'postre'),
('0012', 'leche', 'postre'),
('0013', 'chocolate', 'postre'),
('0014', 'reserva', 'artificial'),
('0015', 'tutti frutti', 'frutal'),
('0016', 'oreo', 'postre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base`
--

CREATE TABLE `base` (
  `codBase` varchar(4) NOT NULL,
  `proporcion` varchar(6) NOT NULL
) ;

--
-- Volcado de datos para la tabla `base`
--

INSERT INTO `base` (`codBase`, `proporcion`) VALUES
('0001', '00%VG'),
('0002', '00%VG'),
('0003', '30%VG'),
('0004', '30%VG'),
('0005', '50%VG'),
('0006', '50%VG'),
('0007', '80%VG'),
('0008', '80%VG'),
('0009', '100%VG'),
('0010', '100%VG'),
('0011', '00%VG'),
('0012', '30%VG'),
('0013', '50%VG'),
('0014', '80%VG'),
('0015', '100%VG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `color` varchar(15) NOT NULL,
  `codLiquido` varchar(4) NOT NULL,
  `codRecipiente` varchar(4) NOT NULL
) ;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`color`, `codLiquido`, `codRecipiente`) VALUES
('00,30,81,11', '0001', '0001'),
('00,30,81,11', '0002', '0001'),
('00,30,81,11', '0003', '0001'),
('00,30,81,11', '0007', '0001'),
('00,30,81,11', '0008', '0001'),
('00,30,81,11', '0009', '0001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envasado`
--

CREATE TABLE `envasado` (
  `codLiquido` varchar(4) NOT NULL,
  `codRecipiente` varchar(4) NOT NULL,
  `diseño` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidoBasico`
--

CREATE TABLE `liquidoBasico` (
  `nombreLiquido` varchar(20) NOT NULL,
  `codBase` varchar(4) NOT NULL,
  `codAroma` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `liquidoBasico`
--

INSERT INTO `liquidoBasico` (`nombreLiquido`, `codBase`, `codAroma`) VALUES
('Apple Punch', '0014', '0001'),
('Cookies & Crème', '0004', '0016'),
('Don Juan Reserva', '0008', '0014'),
('Fruit Garden', '0005', '0015');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidoFinal`
--

CREATE TABLE `liquidoFinal` (
  `codLiquido` varchar(4) NOT NULL,
  `nombreLiquido` varchar(20) NOT NULL,
  `concentracionNicotina` enum('0,3mg/mL','0,6mg/mL','1.2mg/mL') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `liquidoFinal`
--

INSERT INTO `liquidoFinal` (`codLiquido`, `nombreLiquido`, `concentracionNicotina`) VALUES
('0001', 'Apple Punch', '0,3mg/mL'),
('0002', 'Apple Punch', '0,6mg/mL'),
('0003', 'Apple Punch', '1.2mg/mL'),
('0004', 'Cookies & Crème', '0,3mg/mL'),
('0005', 'Cookies & Crème', '0,6mg/mL'),
('0006', 'Cookies & Crème', '1.2mg/mL'),
('0007', 'Don Juan Reserva', '0,3mg/mL'),
('0008', 'Don Juan Reserva', '0,6mg/mL'),
('0009', 'Don Juan Reserva', '1.2mg/mL'),
('0010', 'Fruit Garden', '0,3mg/mL'),
('0011', 'Fruit Garden', '0,6mg/mL'),
('0012', 'Fruit Garden', '1.2mg/mL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maceracion`
--

CREATE TABLE `maceracion` (
  `nombreLiquido` varchar(20) NOT NULL,
  `concentracionNicotina` enum('0,3mg/mL','0,6mg/mL','1.2mg/mL') NOT NULL,
  `tmacerado` tinyint(4) NOT NULL
) ;

--
-- Volcado de datos para la tabla `maceracion`
--

INSERT INTO `maceracion` (`nombreLiquido`, `concentracionNicotina`, `tmacerado`) VALUES
('Apple Punch', '0,3mg/mL', 6),
('Apple Punch', '0,6mg/mL', 8),
('Apple Punch', '1.2mg/mL', 10),
('Cookies & Crème', '0,3mg/mL', 16),
('Cookies & Crème', '0,6mg/mL', 18),
('Cookies & Crème', '1.2mg/mL', 20),
('Don Juan Reserva', '0,3mg/mL', 15),
('Don Juan Reserva', '0,6mg/mL', 20),
('Don Juan Reserva', '1.2mg/mL', 28),
('Fruit Garden', '0,3mg/mL', 10),
('Fruit Garden', '0,6mg/mL', 12),
('Fruit Garden', '1.2mg/mL', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mezclaAromas`
--

CREATE TABLE `mezclaAromas` (
  `aroma` varchar(4) NOT NULL,
  `aromaCompuesto` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mezclaAromas`
--

INSERT INTO `mezclaAromas` (`aroma`, `aromaCompuesto`) VALUES
('0001', '0015'),
('0002', '0015'),
('0003', '0014'),
('0004', '0015'),
('0005', '0015'),
('0006', '0016'),
('0007', '0016'),
('0008', '0014'),
('0009', '0014'),
('0010', '0014'),
('0011', '0013'),
('0012', '0013'),
('0013', '0014'),
('0013', '0016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moleculas`
--

CREATE TABLE `moleculas` (
  `molecula` enum('frescor','golpe de garganta') NOT NULL,
  `codBase` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `moleculas`
--

INSERT INTO `moleculas` (`molecula`, `codBase`) VALUES
('frescor', '0001'),
('frescor', '0003'),
('frescor', '0005'),
('frescor', '0007'),
('frescor', '0009'),
('frescor', '0011'),
('frescor', '0012'),
('frescor', '0013'),
('frescor', '0014'),
('frescor', '0015'),
('golpe de garganta', '0002'),
('golpe de garganta', '0004'),
('golpe de garganta', '0006'),
('golpe de garganta', '0008'),
('golpe de garganta', '0010'),
('golpe de garganta', '0011'),
('golpe de garganta', '0012'),
('golpe de garganta', '0013'),
('golpe de garganta', '0014'),
('golpe de garganta', '0015');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recipiente`
--

CREATE TABLE `recipiente` (
  `codRecipiente` varchar(4) NOT NULL,
  `volumen` enum('5mL','10mL','50mL','100mL') NOT NULL,
  `tipo` enum('chubby','cristal') DEFAULT 'chubby'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recipiente`
--

INSERT INTO `recipiente` (`codRecipiente`, `volumen`, `tipo`) VALUES
('0001', '5mL', 'chubby'),
('0005', '5mL', 'cristal'),
('0002', '10mL', 'chubby'),
('0006', '10mL', 'cristal'),
('0003', '50mL', 'chubby'),
('0007', '50mL', 'cristal'),
('0004', '100mL', 'chubby'),
('0008', '100mL', 'cristal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aroma`
--
ALTER TABLE `aroma`
  ADD PRIMARY KEY (`codAroma`),
  ADD UNIQUE KEY `aroma` (`aroma`);

--
-- Indices de la tabla `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`codBase`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`color`,`codLiquido`,`codRecipiente`),
  ADD KEY `FkrecipienteColores` (`codRecipiente`),
  ADD KEY `FkliquidoColores` (`codLiquido`);

--
-- Indices de la tabla `envasado`
--
ALTER TABLE `envasado`
  ADD PRIMARY KEY (`codLiquido`,`codRecipiente`),
  ADD KEY `FkrecipienteEnvasado` (`codRecipiente`);

--
-- Indices de la tabla `liquidoBasico`
--
ALTER TABLE `liquidoBasico`
  ADD PRIMARY KEY (`nombreLiquido`),
  ADD KEY `FkbaseLiquidoBasico` (`codBase`),
  ADD KEY `FkaromaLiquidoBasico` (`codAroma`);

--
-- Indices de la tabla `liquidoFinal`
--
ALTER TABLE `liquidoFinal`
  ADD PRIMARY KEY (`codLiquido`),
  ADD UNIQUE KEY `UkliquidoFinal` (`nombreLiquido`,`concentracionNicotina`),
  ADD KEY `FknicotinaLiquidoFin` (`concentracionNicotina`);

--
-- Indices de la tabla `maceracion`
--
ALTER TABLE `maceracion`
  ADD PRIMARY KEY (`nombreLiquido`,`concentracionNicotina`),
  ADD KEY `IndexconcentracionNicotina` (`concentracionNicotina`);

--
-- Indices de la tabla `mezclaAromas`
--
ALTER TABLE `mezclaAromas`
  ADD PRIMARY KEY (`aroma`,`aromaCompuesto`),
  ADD KEY `Fkmezclaaroma2` (`aromaCompuesto`);

--
-- Indices de la tabla `moleculas`
--
ALTER TABLE `moleculas`
  ADD PRIMARY KEY (`molecula`,`codBase`),
  ADD KEY `FkbaseMoleculas` (`codBase`);

--
-- Indices de la tabla `recipiente`
--
ALTER TABLE `recipiente`
  ADD PRIMARY KEY (`codRecipiente`),
  ADD UNIQUE KEY `Ukrecipiente` (`volumen`,`tipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `colores`
--
ALTER TABLE `colores`
  ADD CONSTRAINT `FkliquidoColores` FOREIGN KEY (`codLiquido`) REFERENCES `liquidoFinal` (`codLiquido`),
  ADD CONSTRAINT `FkrecipienteColores` FOREIGN KEY (`codRecipiente`) REFERENCES `recipiente` (`codRecipiente`);

--
-- Filtros para la tabla `envasado`
--
ALTER TABLE `envasado`
  ADD CONSTRAINT `FkliquidoEnvasado` FOREIGN KEY (`codLiquido`) REFERENCES `liquidoFinal` (`codLiquido`),
  ADD CONSTRAINT `FkrecipienteEnvasado` FOREIGN KEY (`codRecipiente`) REFERENCES `recipiente` (`codRecipiente`);

--
-- Filtros para la tabla `liquidoBasico`
--
ALTER TABLE `liquidoBasico`
  ADD CONSTRAINT `FkaromaLiquidoBasico` FOREIGN KEY (`codAroma`) REFERENCES `aroma` (`codAroma`),
  ADD CONSTRAINT `FkbaseLiquidoBasico` FOREIGN KEY (`codBase`) REFERENCES `base` (`codBase`);

--
-- Filtros para la tabla `liquidoFinal`
--
ALTER TABLE `liquidoFinal`
  ADD CONSTRAINT `FknicotinaLiquidoFin` FOREIGN KEY (`concentracionNicotina`) REFERENCES `maceracion` (`concentracionNicotina`),
  ADD CONSTRAINT `FknliquidoLiquidoFinal` FOREIGN KEY (`nombreLiquido`) REFERENCES `liquidoBasico` (`nombreLiquido`);

--
-- Filtros para la tabla `maceracion`
--
ALTER TABLE `maceracion`
  ADD CONSTRAINT `FknliquidoMaceracion` FOREIGN KEY (`nombreLiquido`) REFERENCES `liquidoBasico` (`nombreLiquido`);

--
-- Filtros para la tabla `mezclaAromas`
--
ALTER TABLE `mezclaAromas`
  ADD CONSTRAINT `Fkmezclaaroma1` FOREIGN KEY (`aroma`) REFERENCES `aroma` (`codAroma`),
  ADD CONSTRAINT `Fkmezclaaroma2` FOREIGN KEY (`aromaCompuesto`) REFERENCES `aroma` (`codAroma`);

--
-- Filtros para la tabla `moleculas`
--
ALTER TABLE `moleculas`
  ADD CONSTRAINT `FkbaseMoleculas` FOREIGN KEY (`codBase`) REFERENCES `base` (`codBase`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;