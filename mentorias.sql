-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2021 a las 18:29:51
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
  `nu_mentor` bigint(20) NOT NULL,
  `horario` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_asesoria` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimientos_mts`
--

CREATE TABLE `seguimientos_mts` (
  `seguimiento_id` bigint(20) NOT NULL,
  `promediofinal` varchar(50) NOT NULL,
  `retroalimentacion` varchar(255) NOT NULL,
  `nu_asesoria` bigint(20) NOT NULL,
  `status_seguimiento` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `promedio_unidad` varchar(50) NOT NULL,
  `nu_mentorado` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `grupo` varchar(50) NOT NULL,
  `promedio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_mts`
--

INSERT INTO `usuarios_mts` (`id_user`, `nombre`, `username`, `password`, `tipo_user`, `correo`, `telefono`, `matricula`, `carrera`, `grupo`, `promedio`) VALUES
(1, 'Ivette', 'Ivette', 'Ivette', 'jefe', '', '', '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesorias_mts`
--
ALTER TABLE `asesorias_mts`
  ADD PRIMARY KEY (`asesorias_id`),
  ADD KEY `nu_solicitud` (`nu_solicitud`),
  ADD KEY `nu_mentor` (`nu_mentor`);

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
  ADD PRIMARY KEY (`seguimiento_id`);

--
-- Indices de la tabla `solicitudes_mts`
--
ALTER TABLE `solicitudes_mts`
  ADD PRIMARY KEY (`id_solicitudes`),
  ADD KEY `nu_mentorado` (`nu_mentorado`);

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
  MODIFY `asesorias_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias_user_mts`
--
ALTER TABLE `materias_user_mts`
  MODIFY `id_materia` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seguimientos_mts`
--
ALTER TABLE `seguimientos_mts`
  MODIFY `seguimiento_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes_mts`
--
ALTER TABLE `solicitudes_mts`
  MODIFY `id_solicitudes` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_mts`
--
ALTER TABLE `usuarios_mts`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asesorias_mts`
--
ALTER TABLE `asesorias_mts`
  ADD CONSTRAINT `asesorias_mts_ibfk_1` FOREIGN KEY (`nu_solicitud`) REFERENCES `solicitudes_mts` (`id_solicitudes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asesorias_mts_ibfk_2` FOREIGN KEY (`nu_mentor`) REFERENCES `usuarios_mts` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materias_user_mts`
--
ALTER TABLE `materias_user_mts`
  ADD CONSTRAINT `materias_user_mts_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `usuarios_mts` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudes_mts`
--
ALTER TABLE `solicitudes_mts`
  ADD CONSTRAINT `solicitudes_mts_ibfk_1` FOREIGN KEY (`nu_mentorado`) REFERENCES `usuarios_mts` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
