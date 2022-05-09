-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-05-2022 a las 02:00:48
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
  `img_id` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `subtitulo`, `hash1`, `hash2`, `hash3`, `fuente1`, `fuente2`, `fuente3`, `img_id`) VALUES
(4, 'Llega el primer edificio cripto y \"sin expensas\" de Argentina', 'El emprendedor Damián Lopo creará el primer \"edificio minable\" de la Argentina que permitirá bajar a cero el costo mensual de mantenimiento del inmueble.', '#criptomonedas', '#construcción', '#moda', '@LopoDamian', '@CryptoBuildings', '@AmbitoFinanciero', 's0hicivldqj87w8vpzkb'),
(2, 'Twitter añadirá subtítulos automáticos a los videos', 'La red social de los ciento cuarenta caracteres creó un equipo especializado en accesibilidad para crear funciones diferentes.', '#accesibilidad', '#twitter', '#subtitulos', '@twitter', '@mundosub', '@infobae', 'jntkaftisx5zbtwzaqd2'),
(3, 'Los 8 errores comunes que degradan la batería de su iPhone', 'Van desde cerrar aplicaciones en la multitarea, hasta cumplir innecesariamente ciclos de carga.', '#iphone', '#apple', '#tips', '@iphone', '@dexterOK', '@tecnomix', 'ajwsn832mxqbdjn0ptk3'),
(6, 'Se viene \"Lightyear\" a la pantalla grande', 'Un nuevo adelanto muestra el grave error que cometerá el astronauta, el que provocará el comienzo de una gran aventura por el espacio.', '#LightyearTheMovie', '#Pixar', '#Disney', '@Teleshow', '@DisneyLatam', '@PixartStudios', 'dgzkxyhx8aqejty9lajr'),
(7, 'Natalia Oreiro y Gustavo Bassani, protagonistas de “Iosi, el espía arrepentido”', 'Los actores hablaron sobre la nueva producción de Prime Video y el desafío que fue representar sus personajes en una historia basada en el hecho real.', '#NataliaOreiro', '#GustavoBassani', '#PrimeVideo', '@Cinemania', '@SoyLaOreiro', '@PrimeVideoLatam', 'svubpxznd1ge6943h1tc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

DROP TABLE IF EXISTS `novedades`;
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` text NOT NULL,
  `cuerpo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id`, `titulo`, `subtitulo`, `cuerpo`) VALUES
(2, 'El asalto de Elon Musk a Twitter tras 10 días de furia', 'El empresario afirma que su oferta de 43.400 millones de dólares para convertir a la red social en empresa privada busca proteger la libertad de expresión.', 'Twitter le produjo a Elon Musk uno de sus mayores dolores de cabeza. Fue en agosto de 2018, mucho antes de que el magnate tecnológico anunciara su oferta de compra por 43.400 millones de dólares —unos 40.000 millones de euros—. El empresario aseguró entonces en la red social que tenía la financiación suficiente para sacar a Tesla de la Bolsa y convertirla en una empresa privada comprando la acción a 420 dólares. El regulador bursátil estadounidense lo consideró un bluff y calificó de “falso y engañoso” el mensaje. Abrió una investigación que, meses después, obligó a Musk abandonar el cargo de presidente de la compañía que fundó.'),
(3, 'Llega el primer edificio cripto y \"sin expensas\" de Argentina', 'El emprendedor Damián Lopo creará el primer \"edificio minable\" de la Argentina que permitirá bajar a cero el costo mensual de mantenimiento del inmueble.', 'Uno de los argentinos que más sabe de emprendimientos es Damián Lopo: no sólo se dedica a proyectos inmobiliarios \"desde pozo\", sino que además –con su startup Crodwium– introdujo en el país el concepto de crowdfunding (financiamiento colectivo) en el rubro real estate.  Pero su próximo gran proyecto también incluirá otra tendencia que pica en punta en el país: las criptomonedas. En efecto, uno de los edificios que construye su empresa incluirá una granja de minería que permitirá bajar a cero el costo de las expensas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'martin', 'e10adc3949ba59abbe56e057f20f883e');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
