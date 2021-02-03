-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-02-2021 a las 06:48:12
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mentorias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesorias_mts`
--

CREATE TABLE `asesorias_mts` (
  `asesorias_id` bigint(20) NOT NULL,
  `nu_solicitud` bigint(20) NOT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `status_asesoria` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asesorias_mts`
--

INSERT INTO `asesorias_mts` (`asesorias_id`, `nu_solicitud`, `horario`, `fecha`, `status_asesoria`) VALUES
(23, 12, '9:00', '2021-02-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias_user_mts`
--

CREATE TABLE `materias_user_mts` (
  `id_materia` bigint(20) NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `id_mentor` bigint(20) NOT NULL,
  `promedio_mentor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materias_user_mts`
--

INSERT INTO `materias_user_mts` (`id_materia`, `asignatura`, `id_mentor`, `promedio_mentor`) VALUES
(1, 'Bases culinarias', 11, '94.00'),
(2, 'Inteligencia artificial', 9, '85');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimientos_mts`
--

CREATE TABLE `seguimientos_mts` (
  `seguimiento_id` bigint(20) NOT NULL,
  `promediofinal` varchar(50) DEFAULT NULL,
  `retroalimentacion` varchar(255) DEFAULT NULL,
  `nu_asesoria` bigint(20) DEFAULT NULL,
  `status_seguimiento` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seguimientos_mts`
--

INSERT INTO `seguimientos_mts` (`seguimiento_id`, `promediofinal`, `retroalimentacion`, `nu_asesoria`, `status_seguimiento`) VALUES
(2, '99', 'Si se puedo', 23, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_mts`
--

CREATE TABLE `solicitudes_mts` (
  `id_solicitudes` bigint(20) NOT NULL,
  `situacion` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `asignatura` varchar(150) NOT NULL,
  `tema` varchar(150) NOT NULL,
  `promedio_inicial` varchar(50) NOT NULL,
  `nu_mentorado` bigint(20) NOT NULL,
  `status_envio` varchar(10) DEFAULT NULL,
  `nu_mentor` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitudes_mts`
--

INSERT INTO `solicitudes_mts` (`id_solicitudes`, `situacion`, `tipo`, `asignatura`, `tema`, `promedio_inicial`, `nu_mentorado`, `status_envio`, `nu_mentor`) VALUES
(12, 'problema', 'academica', 'Bases culinarias', 'hacer merengue', '70.00', 7, '2', 11),
(13, 'problema', 'academica', 'Inteligencia artificial', 'visión artificial', '70.00', 7, '0', NULL),
(14, 'Matrices en JAVA', 'academica', 'Inteligencia artificial', 'LPB', '85', 7, '0', NULL),
(15, 'Gestor de base de datos', 'academica', 'Inteligencia artificial', 'PDO', '70', 7, '0', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_mts`
--

CREATE TABLE `usuarios_mts` (
  `id_user` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipo_user` varchar(200) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `matricula` varchar(40) NOT NULL,
  `carrera` varchar(50) NOT NULL,
  `semestre` varchar(50) NOT NULL,
  `grupo` varchar(50) NOT NULL,
  `promedio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_mts`
--

INSERT INTO `usuarios_mts` (`id_user`, `nombre`, `username`, `password`, `tipo_user`, `correo`, `telefono`, `matricula`, `carrera`, `semestre`, `grupo`, `promedio`) VALUES
(1, 'Ivette', 'Ivette', 'Ivette', 'Jefe', '', '', '', 'Ingenieria en Sistemas Computacionales', '', '', ''),
(2, 'Karla Virgilio ', 'karla', '12345', 'user', '', '9821340324', '160204022', 'Ingenieria en Sistemas Computacionales', '', 'ISMA-9', '90.1'),
(3, 'Wendy Virgilio', 'wende', 'wende', '140204036', '98210365986', '90.23569', 'Ingenieria en Energias Renovables', '', '', '', 'IERA-4'),
(4, 'Virginia Virgilio Landeros', 'Viña', 'gael', '120203625', 'Licenciatura en Administracion', '', '9840001212', '89.2', 'LAMA-8', '', ''),
(5, 'Jose ', 'jose', '1212', 'Mentor', '', '1281234566', '12345234', 'Ingenieria en Sistemas Computacionales', '7', 'IIMA-8', '89.0'),
(6, 'FSD', 'SFS', 'DSFS', 'Mentor', '', 'SDFS', '123', 'Licenciatura en Turismo', '4', 'ADSS', '4'),
(7, 'Mario perez', 'mario', '3333', 'Mentorado', 'mario@hotmail.com', '982136521', '160204889', 'Ingenieria en Sistemas Computacionales', '6', 'GMA-6', '90'),
(8, 'Miguel García', 'miguel', '1111', 'Mentor', 'miguel@hotmail.com', '9828282828', '189020356', 'Ingenieria en Sistemas Computacionales', '5', 'LAMA-5', '94.07'),
(9, 'Juan Reyes', 'juan', 'juan', 'Mentor', 'ivettita_96@live.com.mx', '9821247391', '150204020', 'Ingenieria en Sistemas Computacionales', '5', 'ISMA-9', '85'),
(10, 'Juan Carlos Rivera Tapia', 'JCarlos', 'isc20', 'Jefe', 'divisionisc@itsescarcega.edu.mx', '', '', 'Ingenieria en Sistemas Computacionales', '', '', ''),
(11, 'Pedro Tinajero', 'Pedrito', '2222', 'Mentor', 'pedrito@hotmail.com', '9828282828', '142986522', 'Ingenieria en Sistemas Computacionales', '5', 'ISMA-5', '80');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesorias_mts`
--
ALTER TABLE `asesorias_mts`
  ADD PRIMARY KEY (`asesorias_id`),
  ADD KEY `nu_solicitud` (`nu_solicitud`);

--
-- Indices de la tabla `materias_user_mts`
--
ALTER TABLE `materias_user_mts`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_mentor` (`id_mentor`);

--
-- Indices de la tabla `seguimientos_mts`
--
ALTER TABLE `seguimientos_mts`
  ADD PRIMARY KEY (`seguimiento_id`),
  ADD KEY `nu_asesoria` (`nu_asesoria`);

--
-- Indices de la tabla `solicitudes_mts`
--
ALTER TABLE `solicitudes_mts`
  ADD PRIMARY KEY (`id_solicitudes`),
  ADD KEY `nu_mentorado` (`nu_mentorado`),
  ADD KEY `solicitudes_mts_ibfk_2` (`nu_mentor`);

--
-- Indices de la tabla `usuarios_mts`
--
ALTER TABLE `usuarios_mts`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asesorias_mts`
--
ALTER TABLE `asesorias_mts`
  MODIFY `asesorias_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `materias_user_mts`
--
ALTER TABLE `materias_user_mts`
  MODIFY `id_materia` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seguimientos_mts`
--
ALTER TABLE `seguimientos_mts`
  MODIFY `seguimiento_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitudes_mts`
--
ALTER TABLE `solicitudes_mts`
  MODIFY `id_solicitudes` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `usuarios_mts`
--
ALTER TABLE `usuarios_mts`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asesorias_mts`
--
ALTER TABLE `asesorias_mts`
  ADD CONSTRAINT `asesorias_mts_ibfk_1` FOREIGN KEY (`nu_solicitud`) REFERENCES `solicitudes_mts` (`id_solicitudes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materias_user_mts`
--
ALTER TABLE `materias_user_mts`
  ADD CONSTRAINT `materias_user_mts_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `usuarios_mts` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seguimientos_mts`
--
ALTER TABLE `seguimientos_mts`
  ADD CONSTRAINT `seguimientos_mts_ibfk_1` FOREIGN KEY (`nu_asesoria`) REFERENCES `asesorias_mts` (`asesorias_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudes_mts`
--
ALTER TABLE `solicitudes_mts`
  ADD CONSTRAINT `solicitudes_mts_ibfk_1` FOREIGN KEY (`nu_mentorado`) REFERENCES `usuarios_mts` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudes_mts_ibfk_2` FOREIGN KEY (`nu_mentor`) REFERENCES `usuarios_mts` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
