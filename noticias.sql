-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-04-2022 a las 00:12:48
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `newz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` text NOT NULL,
  `hash1` varchar(25) NOT NULL,
  `hash2` varchar(25) NOT NULL,
  `hash3` varchar(25) NOT NULL,
  `fuente1` varchar(35) NOT NULL,
  `fuente2` varchar(35) NOT NULL,
  `fuente3` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `subtitulo`, `hash1`, `hash2`, `hash3`, `fuente1`, `fuente2`, `fuente3`) VALUES
(4, 'Llega el primer edificio cripto y \"sin expensas\" de Argentina', 'El emprendedor Damián Lopo creará el primer \"edificio minable\" de la Argentina que permitirá bajar a cero el costo mensual de mantenimiento del inmueble.', '#criptomonedas', '#construcción', '#moda', '@LopoDamian', '@CryptoBuildings', '@AmbitoFinanciero'),
(2, 'Twitter añadirá subtítulos automáticos a los videos', 'La red social de los ciento cuarenta caracteres creó un equipo especializado en accesibilidad para crear funciones diferentes.', '#accesibilidad', '#twitter', '#subtitulos', '@twitter', '@mundosub', '@infobae'),
(3, 'Los 8 errores comunes que degradan la batería de su iPhone', 'Van desde cerrar aplicaciones en la multitarea, hasta cumplir innecesariamente ciclos de carga.', '#iphone', '#apple', '#tips', '@iphone', '@dexterOK', '@tecnomix');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
