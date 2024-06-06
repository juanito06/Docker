SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd1`
--
CREATE DATABASE IF NOT EXISTS `bd1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd1`;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `pais`
-- --------------------------------------------------------

CREATE TABLE `pais` (
  `Id_Pais` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Pais` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--
INSERT INTO `pais` (`Id_Pais`, `Nombre_Pais`) VALUES
(4, 'Afganistan'),
(32, 'Argentina'),
(56, 'Belgica'),
(68, 'Bolivia'),
(156, 'China'),
(170, 'Colombia'),
(192, 'Cuba'),
(250, 'Francia'),
(276, 'Alemania'),
(634, 'Qatar');

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `departamento`
-- --------------------------------------------------------

CREATE TABLE `departamento` (
  `Id_Departamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Departamento` varchar(20) NOT NULL,
  `Id_Pais` int(11) NOT NULL,
  PRIMARY KEY (`Id_Departamento`),
  FOREIGN KEY (`Id_Pais`) REFERENCES `pais` (`Id_Pais`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--
INSERT INTO `departamento` (`Id_Departamento`, `Nombre_Departamento`, `Id_Pais`) VALUES
(32, 'Buenos Aires', 32),
(33, 'Cordoba', 32),
(34, 'Rosario', 32),
(35, 'Munich', 276),
(36, 'Hamburgo', 276),
(37, 'Berlin', 276),
(57, 'Bruselas', 56),
(58, 'Gent', 56),
(59, 'Namur', 56),
(69, 'Sucre', 68),
(70, 'La paz', 68),
(71, 'Tarija', 68),
(92, 'Kabul', 4),
(93, 'Kandaharl', 4),
(94, 'Herat', 4),
(157, 'Pekin', 156),
(158, 'Shangai', 156),
(171, 'Bogota', 170),
(172, 'Amazonas', 170),
(173, 'Pereira', 170),
(193, 'La habana', 192),
(194, 'Santa Clara', 192),
(251, 'Paris', 250),
(635, 'Doha', 634),
(636, 'Al Khor', 634);

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `municipio`
-- --------------------------------------------------------

CREATE TABLE `municipio` (
  `Id_Municipio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Municipio` varchar(20) NOT NULL,
  `Id_Departamento` int(11) NOT NULL,
  PRIMARY KEY (`Id_Municipio`),
  FOREIGN KEY (`Id_Departamento`) REFERENCES `departamento` (`Id_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipio`
--
INSERT INTO `municipio` (`Id_Municipio`, `Nombre_Municipio`, `Id_Departamento`) VALUES
(1, 'Dashti Barchi', 92),
(2, 'Kartey Sakhi', 92),
(3, 'Ghorak', 93),
(4, 'Daman', 93),
(5, 'Shar Noe', 94),
(6, 'Fargha', 94),
(7, 'Mitte', 37),
(8, 'Pankow', 37),
(9, 'Tomesh', 36),
(10, 'Appen', 36),
(11, 'Aying', 35),
(12, 'Brunnthal', 35),
(13, 'Florencio', 32),
(14, 'Varela', 32),
(15, 'Alicia', 33),
(16, 'Alma Fuerte', 33),
(17, 'Perez', 34),
(18, 'Funes', 34),
(19, 'Jette', 57),
(20, 'Forest', 57),
(21, 'Lederberg', 58),
(22, 'Afsnee', 58),
(23, 'Ardenas', 59),
(24, 'Condroz', 59),
(25, 'San Lucas', 69),
(26, 'Monteagudo', 69),
(27, 'Laja', 70),
(28, 'Pucarani', 70),
(29, 'Bermejo', 71),
(30, 'San lorenzo', 71),
(31, 'Al Wakrah', 635),
(32, 'Al Daayen', 635),
(33, 'Beijing', 157),
(34, 'Distrito de Xicheng', 157),
(35, 'Tianjin', 158),
(36, 'Provincia de Jilin', 158),
(37, 'Habana del este', 193),
(38, 'Habana Vieja', 193),
(39, 'Ranchuelo', 194),
(40, 'Santo Domingo', 194),
(41, 'Teusaquillo', 171),
(42, 'Fontibon', 171),
(43, 'Leticia', 172),
(44, 'Puerto Alegria', 172),
(45, 'Guatica', 173),
(46, 'Belen de Umbria', 173),
(47, 'Le Marais', 251),
(48, 'Campos eliseos', 251);

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `persona`
-- --------------------------------------------------------

CREATE TABLE `persona` (
  `Correo_Electronico` varchar(50) NOT NULL,
  `Nombre` text NOT NULL,
  `Apellido` text NOT NULL,
  `Pais_Nacimiento` int(11) NOT NULL,
  `Departamento_Nacimiento` int(11) NOT NULL,
  `Municipio_Nacimiento` int(11) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Confirma_Contraseña` varchar(20) NOT NULL,
  PRIMARY KEY (`Correo_Electronico`),
  FOREIGN KEY (`Pais_Nacimiento`) REFERENCES `pais` (`Id_Pais`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Departamento_Nacimiento`) REFERENCES `departamento` (`Id_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Municipio_Nacimiento`) REFERENCES `municipio` (`Id_Municipio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--
INSERT INTO `persona` (`Correo_Electronico`, `Nombre`, `Apellido`, `Pais_Nacimiento`, `Departamento_Nacimiento`, `Municipio_Nacimiento`, `Telefono`, `Contraseña`, `Confirma_Contraseña`) VALUES
('b.isaza@utp.edu.co', 'Brahian', 'Isaza', 170, 173, 46, '2147483647', 'perro123', 'perro123'),
('brian4872@hotmail.com', 'Felipe', 'Isaza', 170, 173, 46, '2147483647', '123456', '123456'),
('jaider.gonzalez@utp.edu.co', 'Jaider', 'Gonzalez', 170, 173, 46, '2147483647', '123456', '123456'),
('jaidervs58@gmail.com', 'Jaider', 'Gonzalez', 170, 171, 42, '3105734024', '2003', '2003'),
('juan.vasquez@utp.edu.co', 'Juan', 'Vasquez', 192, 194, 40, '2147483647', 'camilo1206', 'camilo1206'),
('thomas.vetti@utp.edu.co', 'Thomas', 'Vetti', 170, 172, 43, '3165409396', 'camilo1206', 'camilo1206');

-- --------------------------------------------------------
-- Indices para tablas volcadas
-- --------------------------------------------------------

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD KEY `Id_Pais` (`Id_Pais`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD KEY `Id_Departamento` (`Id_Departamento`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD KEY `Pais_Nacimiento` (`Pais_Nacimiento`),
  ADD KEY `Departamento_Nacimiento` (`Departamento_Nacimiento`),
  ADD KEY `Municipio_Nacimiento` (`Municipio_Nacimiento`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`Id_Pais`) REFERENCES `pais` (`Id_Pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamento` (`Id_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`Pais_Nacimiento`) REFERENCES `pais` (`Id_Pais`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`Departamento_Nacimiento`) REFERENCES `departamento` (`Id_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`Municipio_Nacimiento`) REFERENCES `municipio` (`Id_Municipio`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


