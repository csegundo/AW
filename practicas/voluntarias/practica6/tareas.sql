-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2021 a las 18:11:48
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tareas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag`
--

CREATE TABLE `tag` (
  `taskId` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `done` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`email`, `password`, `img`) VALUES
('usuario+1@ucm.es', 'mipass+1', ''),
('usuario+2@ucm.es', 'mipass+2', 'alimentacion.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `tag`
--
ALTER TABLE `tag`
  ADD KEY `taskId` (`taskId`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`taskId`) REFERENCES `task` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
