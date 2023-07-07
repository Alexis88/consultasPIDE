-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-07-2023 a las 22:16:11
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_pide`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_configuracion`
--

DROP TABLE IF EXISTS `tbl_configuracion`;
CREATE TABLE IF NOT EXISTS `tbl_configuracion` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_deletepass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_configuracion`
--

INSERT INTO `tbl_configuracion` (`con_id`, `con_deletepass`) VALUES
(1, '$2y$10$nIr4Qai0oeCREOKY3HEjcOM4zjbuPMSzBP3ZRllI9d8aBFJ3Pl6ZO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_control`
--

DROP TABLE IF EXISTS `tbl_control`;
CREATE TABLE IF NOT EXISTS `tbl_control` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_datetime` datetime NOT NULL,
  `con_accion` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `con_ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_usu_con` int(11) NOT NULL,
  PRIMARY KEY (`con_id`),
  KEY `fk_tbl_control_tbl_usuarios1_idx` (`fk_usu_con`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_control`
--

INSERT INTO `tbl_control` (`con_id`, `con_datetime`, `con_accion`, `con_ip`, `fk_usu_con`) VALUES
(1, '2023-05-25 15:58:25', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(2, '2023-05-25 15:58:44', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(3, '2023-05-25 15:59:40', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(4, '2023-05-25 16:00:31', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(5, '2023-05-25 16:01:31', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(6, '2023-05-25 16:02:13', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(7, '2023-05-25 16:03:22', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(8, '2023-05-25 16:04:02', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(9, '2023-05-25 16:04:30', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(10, '2023-05-25 16:07:33', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(11, '2023-05-25 16:09:37', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(12, '2023-05-25 16:10:24', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(13, '2023-05-25 16:11:34', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(14, '2023-05-25 16:12:15', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(15, '2023-05-25 16:13:34', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(16, '2023-05-25 16:13:37', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(17, '2023-05-25 16:14:08', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(18, '2023-05-25 16:14:33', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Alexis Evertt LÃ³pez Espinoza</b> identificado con nÂ° de DNI <b>45287124</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#1\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(19, '2023-05-25 16:14:42', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Ever SÃ¡nchez Alejos</b> identificado con nÂ° de DNI <b>71983058</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#5\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(20, '2023-05-25 16:14:51', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Fiorella Rosmery Salamanca Contreras</b> identificado con nÂ° de DNI <b>76619492</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#8\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(21, '2023-05-25 16:15:07', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Hugo RubÃ©n GarcÃ­a Mamani</b> identificado con nÂ° de DNI <b>00480976</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#13\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(22, '2023-05-25 16:15:20', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>JosÃ© Antonio Ramos Aguilar</b> identificado con nÂ° de DNI <b>00494374</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#6\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(23, '2023-05-25 16:15:29', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Ãngel Merma Cahuana</b> identificado con nÂ° de DNI <b>00515390</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#12\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(24, '2023-05-25 16:15:42', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b> identificado con nÂ° de DNI <b>00515635</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#9\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(25, '2023-05-25 16:15:59', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b> identificado con nÂ° de DNI <b>29383430</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#2\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(26, '2023-05-25 16:16:19', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b> identificado con nÂ° de DNI <b>29383430</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#2\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(27, '2023-05-25 16:16:32', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b> identificado con nÂ° de DNI <b>00515635</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#9\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(28, '2023-05-25 16:16:43', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b> identificado con nÂ° de DNI <b>29383430</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#2\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(29, '2023-05-25 16:17:01', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Guido Regner Siles Denegri</b> identificado con nÂ° de DNI <b>00492491</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#4\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(30, '2023-05-25 16:17:10', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha deshabilitado al usuario <b>Elvis Flores Mendoza</b> identificado con nÂ° de DNI <b>47982074</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#11\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(31, '2023-05-25 16:17:20', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Ãngel Merma Cahuana</b> en el servicio <b>MINEDU</b>.', '10.100.100.15', 1),
(32, '2023-05-25 16:17:24', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Ãngel Merma Cahuana</b> en el servicio <b>SUNEDU</b>.', '10.100.100.15', 1),
(33, '2023-05-25 16:17:30', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Ãngel Merma Cahuana</b> identificado con nÂ° de DNI <b>00515390</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#12\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(34, '2023-05-25 16:18:56', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Guido Regner Siles Denegri</b> identificado con nÂ° de DNI <b>00492491</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#4\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(35, '2023-05-25 16:19:11', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Amidey Arteta Serrano</b> identificado con nÂ° de DNI <b>40681284</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#3\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(36, '2023-05-25 16:19:31', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>JosÃ© Antonio Ramos Aguilar</b> identificado con nÂ° de DNI <b>00494374</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#6\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(37, '2023-05-25 16:19:45', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha deshabilitado al usuario <b>Fiorella Rosmery Salamanca Contreras</b> identificado con nÂ° de DNI <b>76619492</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#8\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(38, '2023-05-25 16:19:55', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Ever SÃ¡nchez Alejos</b> identificado con nÂ° de DNI <b>71983058</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#5\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(39, '2023-05-25 16:20:22', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del servicio <b>MINEDU</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#9\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(40, '2023-05-25 16:20:42', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del servicio <b>SUNARP</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#3\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(41, '2023-05-25 16:20:54', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del servicio <b>SUNEDU</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#8\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(42, '2023-05-25 16:21:36', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(43, '2023-05-25 16:23:27', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT', '10.100.100.15', 1),
(44, '2023-05-25 16:24:09', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT', '10.100.100.15', 1),
(45, '2023-05-25 16:24:55', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> A6D610, <b>Oficina registral:</b> ', '10.100.100.15', 1),
(46, '2023-05-25 16:25:58', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> STANLEY', '10.100.100.15', 1),
(47, '2023-05-25 16:26:29', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> BCO506, <b>Oficina registral:</b> ', '10.100.100.15', 1),
(48, '2023-05-25 16:34:19', 'El usuario <b>Alexis Evertt López Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(49, '2023-05-25 16:34:23', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(50, '2023-05-25 16:38:54', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(51, '2023-05-25 16:40:53', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha registrado al usuario <b>Rigoberto MartÃ­n Quenta Loza</b> identificado con nÂ° de DNI <b>70166250</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#14\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(52, '2023-05-25 16:42:41', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(53, '2023-05-25 16:43:09', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(54, '2023-05-29 08:05:00', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '', 2),
(55, '2023-05-29 08:23:15', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '', 9),
(56, '2023-05-29 09:08:19', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '', 9),
(57, '2023-05-29 09:23:56', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '', 2),
(58, '2023-05-29 14:46:06', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '', 2),
(59, '2023-05-29 14:46:22', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '', 9),
(60, '2023-05-29 15:18:48', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con nÂ° de DNI <b>00492491</b>, ha ingresado al sistema', '', 4),
(61, '2023-05-29 15:25:52', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '', 2),
(62, '2023-05-29 15:30:43', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(63, '2023-05-29 15:31:15', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(64, '2023-05-29 15:31:33', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(65, '2023-05-29 15:32:20', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> ALAN', '10.100.100.15', 1),
(66, '2023-05-29 15:40:40', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> ALAN', '10.100.100.15', 1),
(67, '2023-05-29 15:42:28', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(68, '2023-05-29 15:43:37', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(69, '2023-05-29 15:43:58', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNEDU</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(70, '2023-05-29 15:46:23', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT', '10.100.100.15', 1),
(71, '2023-05-29 15:50:22', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> A6D610, <b>Oficina registral:</b> ', '10.100.100.15', 1),
(72, '2023-05-29 15:52:07', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(73, '2023-05-30 08:23:10', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(74, '2023-05-30 08:24:04', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> JIMENEZ, <b>Apellido materno:</b> JIMENEZ, <b>Nombres:</b> JOSEFINA', '10.100.100.15', 1),
(75, '2023-05-30 08:25:18', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> STANLEY', '10.100.100.15', 1),
(76, '2023-05-30 08:27:36', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(77, '2023-05-30 08:28:17', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> STANLEY', '10.100.100.15', 1),
(78, '2023-05-30 08:28:45', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> AK7761, <b>Oficina registral:</b> ', '10.100.100.15', 1),
(79, '2023-05-30 08:29:04', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNEDU</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(80, '2023-05-30 08:31:47', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(81, '2023-05-30 08:32:01', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(82, '2023-05-30 08:32:31', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha salido del sistema', '10.100.100.15', 2),
(83, '2023-05-30 08:33:00', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(84, '2023-05-30 08:33:11', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha salido del sistema', '10.100.100.15', 2),
(85, '2023-05-30 08:33:21', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(86, '2023-05-30 08:35:07', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha salido del sistema', '10.100.100.15', 2),
(87, '2023-05-30 08:35:16', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(88, '2023-05-30 08:35:51', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(89, '2023-05-30 08:36:03', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(90, '2023-05-30 08:36:24', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(91, '2023-05-30 08:36:48', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11087812, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> Tacna', '10.100.100.15', 1),
(92, '2023-05-30 08:37:03', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(93, '2023-05-30 08:42:01', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(94, '2023-05-30 08:42:52', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> LOAYZA, <b>Apellido materno:</b> CCAMA, <b>Nombres:</b> LEONOR', '10.100.100.15', 2),
(95, '2023-05-30 08:48:03', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> MINAYA, <b>Apellido materno:</b> MENACHO, <b>Nombres:</b> RAUL ABRAHAM', '10.100.100.15', 2),
(96, '2023-05-30 08:49:23', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(97, '2023-05-30 08:50:56', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> PARE, <b>Apellido materno:</b> VARGAS, <b>Nombres:</b> VICENTE', '10.100.100.15', 9),
(98, '2023-05-30 08:51:19', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> MINAYA, <b>Apellido materno:</b> MENACHO, <b>Nombres:</b> RAUL ABRAHAM', '10.100.100.15', 2),
(99, '2023-05-30 09:10:18', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(100, '2023-05-30 09:11:10', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11120580, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> Tacna', '10.100.100.15', 2),
(101, '2023-05-30 09:26:07', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ALANOCA, <b>Apellido materno:</b> DE QUISPE, <b>Nombres:</b> NATIVIDAD', '10.100.100.15', 9),
(102, '2023-05-30 15:10:46', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 21504997', '10.100.100.15', 2),
(103, '2023-05-30 15:11:06', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 21504997', '10.100.100.15', 2),
(104, '2023-05-30 15:25:02', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(105, '2023-05-30 15:45:46', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ALAVE, <b>Apellido materno:</b> HUANCA, <b>Nombres:</b> VICTORIA', '10.100.100.15', 9),
(106, '2023-05-30 16:36:22', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha salido del sistema', '10.100.100.15', 9),
(107, '2023-05-30 17:06:53', 'El usuario <b>Amidey Arteta Serrano</b>, identificado con nÂ° de DNI <b>40681284</b>, ha ingresado al sistema', '10.100.100.15', 3),
(108, '2023-05-31 08:24:10', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(109, '2023-05-31 08:38:36', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(110, '2023-05-31 08:39:30', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ALE, <b>Apellido materno:</b> GONZALES, <b>Nombres:</b> EUDEMIO FELIX', '10.100.100.15', 9),
(111, '2023-05-31 09:10:12', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(112, '2023-05-31 09:11:20', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> TUESTA, <b>Apellido materno:</b> RAMIREZ, <b>Nombres:</b> JUANA ASUNCION', '10.100.100.15', 2),
(113, '2023-05-31 09:13:57', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> CHAHUARES, <b>Apellido materno:</b> CANQUE, <b>Nombres:</b> JUAN FRANCISCO', '10.100.100.15', 9),
(114, '2023-05-31 09:18:52', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> MAMANI, <b>Apellido materno:</b> ESCOBAR, <b>Nombres:</b> JUAN', '10.100.100.15', 2),
(115, '2023-05-31 09:19:06', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(116, '2023-05-31 09:33:54', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ELERA, <b>Apellido materno:</b> GUIVIN, <b>Nombres:</b> ALEX', '10.100.100.15', 2),
(117, '2023-05-31 09:41:05', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> DIAZ, <b>Apellido materno:</b> ALARCON, <b>Nombres:</b> MERCEDES MARINA', '10.100.100.15', 2),
(118, '2023-05-31 10:59:02', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> JIRON, <b>Apellido materno:</b> RODRIGUEZ, <b>Nombres:</b> RAUL', '10.100.100.15', 2),
(119, '2023-05-31 13:25:26', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(120, '2023-05-31 13:26:27', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ALANOCA, <b>Apellido materno:</b> CHURA, <b>Nombres:</b> JUAN CARLOS', '10.100.100.15', 9),
(121, '2023-05-31 14:02:02', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11003057, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> Tacna', '10.100.100.15', 9),
(122, '2023-05-31 14:03:23', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(123, '2023-05-31 14:08:49', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11002904, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> Tacna', '10.100.100.15', 9),
(124, '2023-05-31 15:15:21', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha salido del sistema', '10.100.100.15', 2),
(125, '2023-05-31 15:35:22', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(126, '2023-05-31 15:36:44', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(127, '2023-05-31 16:00:48', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(128, '2023-05-31 16:12:10', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(129, '2023-05-31 16:50:44', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(130, '2023-05-31 16:55:40', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(131, '2023-05-31 16:57:47', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(132, '2023-05-31 16:58:04', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ARTETA, <b>Apellido materno:</b> SERRANO, <b>Nombres:</b> AMIDEY', '10.100.100.15', 9),
(133, '2023-05-31 16:59:49', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ARTETA, <b>Apellido materno:</b> SERRANO, <b>Nombres:</b> AMIDEY', '10.100.100.15', 9),
(134, '2023-05-31 17:03:49', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 9),
(135, '2023-05-31 17:04:08', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha salido del sistema', '10.100.100.15', 9),
(136, '2023-06-01 07:58:03', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> QUISPE, <b>Apellido materno:</b> ZAPANA, <b>Nombres:</b> JULIAN EDGAR', '10.100.100.15', 2),
(137, '2023-06-01 07:59:29', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> GOMEZ, <b>Apellido materno:</b> PARI, <b>Nombres:</b> VICTORIA', '10.100.100.15', 2),
(138, '2023-06-01 08:37:30', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> QUISPE, <b>Apellido materno:</b> ZAPANA, <b>Nombres:</b> JULIAN EDGAR', '10.100.100.15', 2),
(139, '2023-06-01 08:39:13', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> ROJAS, <b>Apellido materno:</b> ROJAS, <b>Nombres:</b> JULIO LEANDRO', '10.100.100.15', 2),
(140, '2023-06-01 08:51:52', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> PARI, <b>Apellido materno:</b> MAMANI, <b>Nombres:</b> ARMANDO', '10.100.100.15', 2),
(141, '2023-06-01 08:55:40', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> BALBOA, <b>Apellido materno:</b> QUISPE, <b>Nombres:</b> MARGARITA', '10.100.100.15', 2),
(142, '2023-06-01 08:57:19', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> PARI, <b>Apellido materno:</b> MAMANI, <b>Nombres:</b> ARMANDO', '10.100.100.15', 2),
(143, '2023-06-01 09:04:05', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombre del contribuyente, <b>Apellido paterno:</b> PARI, <b>Apellido materno:</b> MAMANI, <b>Nombres:</b> ARMANDO', '10.100.100.15', 2),
(144, '2023-06-01 09:14:10', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(145, '2023-06-01 09:23:26', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> UNIVERSIDAD PRIVADA DE TACNA', '10.100.100.15', 1),
(146, '2023-06-01 09:36:13', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> UNIVERSIDAD PRIVADA DE TACNA', '10.100.100.15', 1),
(147, '2023-06-01 09:40:27', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> UNIVERSIDAD PRIVADA DE TACNA', '10.100.100.15', 1),
(148, '2023-06-01 09:43:28', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(149, '2023-06-01 09:44:10', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11087812, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> Tacna', '10.100.100.15', 1),
(150, '2023-06-01 09:50:40', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> COMIDAS RAPIDAS S.A.', '10.100.100.15', 1),
(151, '2023-06-01 09:51:48', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT', '10.100.100.15', 1),
(152, '2023-06-01 09:52:06', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> A6D610, <b>Oficina registral:</b> ', '10.100.100.15', 1),
(153, '2023-06-01 09:56:43', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(154, '2023-06-01 10:01:21', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 02622370', '10.100.100.15', 1),
(155, '2023-06-01 10:01:59', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNEDU</b> con los siguientes datos: <b>DNI:</b> 02622370', '10.100.100.15', 1),
(156, '2023-06-01 10:03:15', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(157, '2023-06-01 15:47:10', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNAT</b> con los siguientes datos: <b>RUC/RazÃ³n Social:</b> INMOBILIARIA CASTELL SAC.', '10.100.100.15', 2),
(158, '2023-06-02 10:00:25', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(159, '2023-06-02 10:01:01', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del servicio <b>MPAREQUIPA</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#6\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(160, '2023-06-02 10:01:52', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha deshabilitado el servicio <b>SATLIMA</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#10\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(161, '2023-06-02 10:02:24', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del servicio <b>MPAREQUIPA</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#6\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(162, '2023-06-02 10:02:41', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del servicio <b>SATLIMA</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#10\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(163, '2023-06-02 10:05:18', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b> en el servicio <b>SATLIMA</b>.', '10.100.100.15', 1),
(164, '2023-06-02 10:05:36', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b> en el servicio <b>MPILO</b>.', '10.100.100.15', 1),
(165, '2023-06-02 10:05:48', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b> en el servicio <b>MPAREQUIPA</b>.', '10.100.100.15', 1),
(166, '2023-06-02 10:09:26', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b> en el servicio <b>MPILO</b>.', '10.100.100.15', 1),
(167, '2023-06-02 10:09:35', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b> en el servicio <b>MPAREQUIPA</b>.', '10.100.100.15', 1),
(168, '2023-06-02 10:09:42', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b> en el servicio <b>SATLIMA</b>.', '10.100.100.15', 1),
(169, '2023-06-02 10:13:24', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Guido Regner Siles Denegri</b> en el servicio <b>SATLIMA</b>.', '10.100.100.15', 1),
(170, '2023-06-02 10:15:47', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Guido Regner Siles Denegri</b> en el servicio <b>MPILO</b>.', '10.100.100.15', 1),
(171, '2023-06-02 10:15:53', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Guido Regner Siles Denegri</b> en el servicio <b>MPAREQUIPA</b>.', '10.100.100.15', 1),
(172, '2023-06-02 10:16:16', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Ãngel Merma Cahuana</b> en el servicio <b>MPILO</b>.', '10.100.100.15', 1),
(173, '2023-06-02 10:16:30', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Ãngel Merma Cahuana</b> en el servicio <b>MPAREQUIPA</b>.', '10.100.100.15', 1),
(174, '2023-06-02 10:16:40', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Ãngel Merma Cahuana</b> en el servicio <b>SATLIMA</b>.', '10.100.100.15', 1),
(175, '2023-06-02 10:18:24', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Amidey Arteta Serrano</b> en el servicio <b>MPILO</b>.', '10.100.100.15', 1),
(176, '2023-06-02 10:18:31', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Amidey Arteta Serrano</b> en el servicio <b>MPAREQUIPA</b>.', '10.100.100.15', 1),
(177, '2023-06-02 10:18:45', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Amidey Arteta Serrano</b> en el servicio <b>SATLIMA</b>.', '10.100.100.15', 1),
(178, '2023-06-02 10:18:58', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Amidey Arteta Serrano</b> en el servicio <b>MINEDU</b>.', '10.100.100.15', 1),
(179, '2023-06-02 10:19:11', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha eliminado los datos de identificaciÃ³n del usuario <b>Amidey Arteta Serrano</b> en el servicio <b>SUNEDU</b>.', '10.100.100.15', 1),
(180, '2023-06-02 10:20:06', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(181, '2023-06-02 10:20:18', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(182, '2023-06-02 10:22:01', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(183, '2023-06-02 10:23:33', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(184, '2023-06-02 10:23:45', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(185, '2023-06-02 10:24:20', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(186, '2023-06-02 10:35:18', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(187, '2023-06-02 10:35:31', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(188, '2023-06-02 10:36:14', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(189, '2023-06-02 10:39:56', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(190, '2023-06-02 19:45:13', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12);
INSERT INTO `tbl_control` (`con_id`, `con_datetime`, `con_accion`, `con_ip`, `fk_usu_con`) VALUES
(191, '2023-06-02 19:54:44', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> CASTELL', '10.100.100.15', 12),
(192, '2023-06-02 20:07:35', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> INMOBILIARIA CASTELL', '10.100.100.15', 12),
(193, '2023-06-02 20:12:05', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ANDUAGA, <b>Apellido materno:</b> SALINAS, <b>Nombres:</b> FRANCISCO EDUARDO', '10.100.100.15', 12),
(194, '2023-06-05 14:02:53', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(195, '2023-06-06 09:58:29', 'El usuario <b>Amidey Arteta Serrano</b>, identificado con nÂ° de DNI <b>40681284</b>, ha ingresado al sistema', '10.100.100.15', 3),
(196, '2023-06-06 10:00:02', 'El usuario <b>Amidey Arteta Serrano</b>, identificado con el nÂ° de DNI <b>40681284</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ANQUISE, <b>Apellido materno:</b> ARISMENDI, <b>Nombres:</b> LENIN', '10.100.100.15', 3),
(197, '2023-06-07 10:05:54', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(198, '2023-06-07 11:07:42', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(199, '2023-06-07 11:08:08', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(200, '2023-06-07 11:08:24', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(201, '2023-06-07 11:08:30', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(202, '2023-06-07 12:12:19', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT ELISEO', '10.100.100.15', 1),
(203, '2023-06-07 12:13:27', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(204, '2023-06-07 12:19:45', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(205, '2023-06-07 12:22:05', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(206, '2023-06-07 12:22:58', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(207, '2023-06-07 12:23:28', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(208, '2023-06-07 12:29:45', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> MUNICIPALIDAD DISTRITAL DE POCOLLAY', '10.100.100.15', 1),
(209, '2023-06-07 13:13:04', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> MUNICIPALIDAD DISTRITAL DE POCOLLAY', '10.100.100.15', 1),
(210, '2023-06-07 13:38:24', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(211, '2023-06-07 13:38:29', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(212, '2023-06-07 13:38:35', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(213, '2023-06-07 19:14:51', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(214, '2023-06-07 19:16:16', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> VERA, <b>Apellido materno:</b> PORTALES, <b>Nombres:</b> LUIS ALFREDO', '10.100.100.15', 12),
(215, '2023-06-07 19:19:44', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> VERA, <b>Apellido materno:</b> PORTALES, <b>Nombres:</b> LOURDES BERTHA', '10.100.100.15', 12),
(216, '2023-06-08 15:45:02', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(217, '2023-06-08 15:48:01', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 04720396', '10.100.100.15', 12),
(218, '2023-06-08 15:52:40', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MANRIQUE, <b>Apellido materno:</b> PAMO, <b>Nombres:</b> ROSA', '10.100.100.15', 12),
(219, '2023-06-09 11:46:34', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(220, '2023-06-09 15:29:16', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(221, '2023-06-09 15:29:48', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del servicio <b>SUNARP</b>. Puede ver los datos del servicio <a href=\'../servicios/index.php#3\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(222, '2023-06-09 15:33:29', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(223, '2023-06-09 15:42:19', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(224, '2023-06-13 10:02:39', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '', 2),
(225, '2023-06-13 10:03:02', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '', 2),
(226, '2023-06-13 10:37:48', 'El usuario <b>Amidey Arteta Serrano</b>, identificado con nÂ° de DNI <b>40681284</b>, ha ingresado al sistema', '', 3),
(227, '2023-06-13 17:22:04', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(228, '2023-06-13 17:22:59', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> SUAREZ, <b>Apellido materno:</b> LIENDO, <b>Nombres:</b> TEDDY', '10.100.100.15', 12),
(229, '2023-06-14 07:51:12', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(230, '2023-06-14 08:34:05', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> REYNA, <b>Apellido materno:</b> DE CHIPANA, <b>Nombres:</b> ELENA MARGARITA', '10.100.100.15', 2),
(231, '2023-06-14 08:49:02', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> VIACAVA, <b>Apellido materno:</b> BARTESAGHI, <b>Nombres:</b> IVONE', '10.100.100.15', 2),
(232, '2023-06-14 08:59:44', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> SANCHEZ, <b>Apellido materno:</b> ROSADO, <b>Nombres:</b> JUSTO OMAR', '10.100.100.15', 2),
(233, '2023-06-14 11:27:09', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(234, '2023-06-14 11:27:51', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> JIRON, <b>Apellido materno:</b> MALDONADO, <b>Nombres:</b> RAUL', '10.100.100.15', 9),
(235, '2023-06-14 11:29:01', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MALDONADO, <b>Apellido materno:</b> DE JIRON, <b>Nombres:</b> FLORIZA', '10.100.100.15', 9),
(236, '2023-06-14 11:30:30', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MALDONADO, <b>Apellido materno:</b> DE JIRON, <b>Nombres:</b> FLORIZA', '10.100.100.15', 9),
(237, '2023-06-14 11:32:27', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MALDONADO, <b>Apellido materno:</b> DE JIRON, <b>Nombres:</b> FLORIZA', '10.100.100.15', 9),
(238, '2023-06-14 11:35:44', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> JIRON, <b>Apellido materno:</b> RODRIGUEZ, <b>Nombres:</b> RAUL', '10.100.100.15', 2),
(239, '2023-06-14 11:36:09', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MALDONADO, <b>Apellido materno:</b> DE JIRON, <b>Nombres:</b> FLORIZA', '10.100.100.15', 9),
(240, '2023-06-14 15:08:53', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> VIACAVA, <b>Apellido materno:</b> BARTESAGHI, <b>Nombres:</b> IVONE', '10.100.100.15', 2),
(241, '2023-06-14 15:21:50', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(242, '2023-06-14 15:34:19', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(243, '2023-06-14 15:34:26', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(244, '2023-06-14 15:34:40', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(245, '2023-06-14 15:38:14', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> P20030612, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> Tacna', '10.100.100.15', 2),
(246, '2023-06-14 15:53:40', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(247, '2023-06-14 15:54:03', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHIPANA, <b>Apellido materno:</b> PALZA, <b>Nombres:</b> OSCAR JUAN', '10.100.100.15', 12),
(248, '2023-06-14 15:55:44', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> REYNA, <b>Apellido materno:</b> DE CHIPANA, <b>Nombres:</b> ELENA', '10.100.100.15', 12),
(249, '2023-06-14 16:01:55', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHIPANA, <b>Apellido materno:</b> PALZA, <b>Nombres:</b> MARINA', '10.100.100.15', 12),
(250, '2023-06-14 16:04:59', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHIPANA, <b>Apellido materno:</b> PALZA, <b>Nombres:</b> OSCAR', '10.100.100.15', 12),
(251, '2023-06-14 16:06:31', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHIPANA, <b>Apellido materno:</b> REYNA, <b>Nombres:</b> OSCAR FERNANDO', '10.100.100.15', 12),
(252, '2023-06-14 16:21:28', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHIPANA, <b>Apellido materno:</b> PALZA, <b>Nombres:</b> MARINA', '10.100.100.15', 12),
(253, '2023-06-14 16:27:28', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> REYNA, <b>Apellido materno:</b> DE CHIPANA, <b>Nombres:</b> ELENA', '10.100.100.15', 12),
(254, '2023-06-15 08:00:35', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(255, '2023-06-15 10:00:57', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(256, '2023-06-15 10:02:01', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(257, '2023-06-15 10:03:10', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CENTENO, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> PAULA', '10.100.100.15', 12),
(258, '2023-06-15 16:10:32', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(259, '2023-06-15 16:11:12', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(260, '2023-06-15 16:12:46', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT', '10.100.100.15', 1),
(261, '2023-06-15 16:19:55', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT', '10.100.100.15', 1),
(262, '2023-06-15 16:32:12', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(263, '2023-06-15 16:33:19', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(264, '2023-06-15 16:44:55', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> STANLEY', '10.100.100.15', 1),
(265, '2023-06-15 16:48:13', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> AK7761, <b>Oficina registral:</b> ', '10.100.100.15', 1),
(266, '2023-06-15 16:48:42', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(267, '2023-06-15 17:04:09', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(268, '2023-06-15 17:04:45', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(269, '2023-06-15 17:07:13', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha registrado al usuario <b>Elvis Wilber Ari Mendoza</b> identificado con nÂ° de DNI <b>41408919</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#15\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(270, '2023-06-15 17:08:16', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHIRI, <b>Apellido materno:</b> ESCARCINI, <b>Nombres:</b> CARLOTA', '10.100.100.15', 1),
(271, '2023-06-15 17:10:49', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(272, '2023-06-15 17:10:59', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(273, '2023-06-15 17:15:05', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por razÃ³n social, <b>RazÃ³n social:</b> UNIVERSIDAD PRIVADA DE TACNA', '10.100.100.15', 2),
(274, '2023-06-15 17:16:37', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha salido del sistema', '10.100.100.15', 2),
(275, '2023-06-16 15:44:10', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(276, '2023-06-16 15:58:59', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(277, '2023-06-16 16:00:07', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11087812, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> TACNA', '10.100.100.15', 1),
(278, '2023-06-16 16:01:27', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> STANLEY', '10.100.100.15', 1),
(279, '2023-06-16 16:03:15', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(280, '2023-06-16 16:04:54', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(281, '2023-06-19 09:17:35', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(282, '2023-06-19 09:18:11', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHAVEZ, <b>Apellido materno:</b> SUPO, <b>Nombres:</b> YOLANDA', '10.100.100.15', 2),
(283, '2023-06-19 09:21:22', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ARIAS, <b>Apellido materno:</b> COPAJA, <b>Nombres:</b> MARIO', '10.100.100.15', 2),
(284, '2023-06-19 15:57:24', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(285, '2023-06-19 16:10:44', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ANTICONA, <b>Apellido materno:</b> NOLI, <b>Nombres:</b> OLGA LUZ', '10.100.100.15', 12),
(286, '2023-06-19 19:28:42', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(287, '2023-06-19 19:30:30', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ORDOÃ‘EZ, <b>Apellido materno:</b> SUCAPUCA, <b>Nombres:</b> LUIS ALBERTO', '10.100.100.15', 12),
(288, '2023-06-20 13:13:39', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(289, '2023-06-20 13:32:06', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(290, '2023-06-20 14:41:45', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con nÂ° de DNI <b>71983058</b>, ha ingresado al sistema', '10.100.100.15', 5),
(291, '2023-06-20 14:42:20', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con el nÂ° de DNI <b>71983058</b>, ha realizado una bÃºsqueda en el servicio <b>SUNAT</b> con los siguientes datos: <b>RUC/RazÃ³n Social:</b> 10719830582.', '10.100.100.15', 5),
(292, '2023-06-20 14:54:20', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con el nÂ° de DNI <b>71983058</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 71983058', '10.100.100.15', 5),
(293, '2023-06-20 14:56:01', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(294, '2023-06-20 15:35:19', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(295, '2023-06-20 15:55:26', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(296, '2023-06-20 16:19:15', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(297, '2023-06-20 16:21:36', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(298, '2023-06-20 16:24:40', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(299, '2023-06-20 16:27:13', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(300, '2023-06-20 16:31:20', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNEDU</b> con los siguientes datos: <b>DNI:</b> 45287124', '10.100.100.15', 1),
(301, '2023-06-20 16:40:06', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(302, '2023-06-20 16:40:26', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(303, '2023-06-20 16:43:31', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(304, '2023-06-20 16:47:39', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(305, '2023-06-20 17:00:08', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha registrado al usuario <b>VILMA YUVALDINA YNCA CRUZ</b> identificado con nÂ° de DNI <b>42482896</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#16\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(306, '2023-06-20 17:01:10', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(307, '2023-06-20 17:02:04', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(308, '2023-06-20 17:02:24', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 42482896', '10.100.100.15', 16),
(309, '2023-06-20 17:03:22', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNAT</b> con los siguientes datos: <b>RUC/RazÃ³n Social:</b> VILMA YUVALDINA YNCA CRUZ.', '10.100.100.15', 16),
(310, '2023-06-20 17:11:07', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 42482896', '10.100.100.15', 16),
(311, '2023-06-20 17:18:26', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(312, '2023-06-20 17:18:31', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(313, '2023-06-20 17:18:37', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(314, '2023-06-20 17:23:09', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(315, '2023-06-20 17:23:33', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(316, '2023-06-21 08:01:13', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(317, '2023-06-21 08:31:41', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(318, '2023-06-21 09:42:33', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(319, '2023-06-21 09:43:34', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHAVEZ, <b>Apellido materno:</b> SUPO, <b>Nombres:</b> YOLANDA', '10.100.100.15', 16),
(320, '2023-06-21 09:46:09', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHAVEZ, <b>Apellido materno:</b> SUPO, <b>Nombres:</b> YOLANDA', '10.100.100.15', 16),
(321, '2023-06-21 09:46:44', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(322, '2023-06-21 11:44:21', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 05119901, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> TACNA', '10.100.100.15', 9),
(323, '2023-06-21 11:59:03', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(324, '2023-06-21 11:59:46', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> FERNANDEZ, <b>Apellido materno:</b> ARANA, <b>Nombres:</b> LILIANA', '10.100.100.15', 2),
(325, '2023-06-21 12:00:54', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(326, '2023-06-21 12:06:35', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(327, '2023-06-21 12:06:41', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(328, '2023-06-21 12:06:48', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(329, '2023-06-21 12:06:55', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(330, '2023-06-21 12:07:03', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(331, '2023-06-21 12:07:11', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(332, '2023-06-21 12:10:23', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(333, '2023-06-21 12:10:37', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(334, '2023-06-21 12:10:50', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(335, '2023-06-21 12:11:00', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(336, '2023-06-21 12:11:15', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(337, '2023-06-21 12:11:27', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(338, '2023-06-21 12:11:40', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(339, '2023-06-21 12:12:00', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(340, '2023-06-21 12:12:24', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(341, '2023-06-21 12:12:37', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(342, '2023-06-21 12:12:45', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(343, '2023-06-21 12:12:53', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(344, '2023-06-21 12:13:00', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(345, '2023-06-21 12:13:07', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(346, '2023-06-21 12:13:13', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(347, '2023-06-21 12:13:21', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(348, '2023-06-21 12:13:28', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(349, '2023-06-21 12:13:38', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(350, '2023-06-21 12:13:45', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(351, '2023-06-21 12:13:51', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(352, '2023-06-21 12:13:58', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(353, '2023-06-21 12:14:07', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(354, '2023-06-21 12:14:16', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(355, '2023-06-21 12:14:22', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(356, '2023-06-21 12:14:30', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(357, '2023-06-21 12:14:38', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(358, '2023-06-21 12:14:46', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(359, '2023-06-21 12:14:54', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(360, '2023-06-21 12:15:01', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(361, '2023-06-21 12:15:08', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(362, '2023-06-21 12:15:16', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(363, '2023-06-21 12:15:24', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 2),
(364, '2023-06-21 16:10:37', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(365, '2023-06-21 16:11:24', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHAVEZ, <b>Apellido materno:</b> SUPO, <b>Nombres:</b> YOLANDA', '10.100.100.15', 12),
(366, '2023-06-21 16:12:17', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> AK683, <b>Oficina registral:</b> ', '10.100.100.15', 12);
INSERT INTO `tbl_control` (`con_id`, `con_datetime`, `con_accion`, `con_ip`, `fk_usu_con`) VALUES
(367, '2023-06-21 16:21:13', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 00420329', '10.100.100.15', 12),
(368, '2023-06-21 16:22:28', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHAVEZ, <b>Apellido materno:</b> SUPO, <b>Nombres:</b> YOLANDA', '10.100.100.15', 12),
(369, '2023-06-21 16:27:23', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(370, '2023-06-22 08:46:11', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(371, '2023-06-22 08:46:43', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHAVEZ, <b>Apellido materno:</b> SUPO, <b>Nombres:</b> YOLANDA', '10.100.100.15', 2),
(372, '2023-06-22 08:56:00', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(373, '2023-06-22 11:54:29', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 2),
(374, '2023-06-22 11:54:41', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11075210, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> TACNA', '10.100.100.15', 2),
(375, '2023-06-22 15:13:03', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> SALINAS, <b>Apellido materno:</b> MORALES, <b>Nombres:</b> LYS SOLAGNE', '10.100.100.15', 2),
(376, '2023-06-22 15:18:54', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 05100369, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> TACNA', '10.100.100.15', 2),
(377, '2023-06-22 16:03:03', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(378, '2023-06-22 16:05:55', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(379, '2023-06-22 16:06:42', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> STANLEY', '10.100.100.15', 1),
(380, '2023-06-22 16:08:01', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> BCO506, <b>Oficina registral:</b> ', '10.100.100.15', 1),
(381, '2023-06-22 16:13:58', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 05100369, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> TACNA', '10.100.100.15', 1),
(382, '2023-06-22 16:17:42', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 05100369, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> TACNA', '10.100.100.15', 1),
(383, '2023-06-22 16:20:17', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALEMAN, <b>Apellido materno:</b> VALDIVIA, <b>Nombres:</b> DARIO ANDRES', '10.100.100.15', 1),
(384, '2023-06-22 16:22:59', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNAT</b> con los siguientes datos: <b>RUC/RazÃ³n Social:</b> LOPEZ ESPINOZA ALEXIS EVERTT.', '10.100.100.15', 1),
(385, '2023-06-22 16:24:05', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(386, '2023-06-22 16:24:13', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(387, '2023-06-22 16:24:40', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ESPINOZA, <b>Apellido materno:</b> OVIEDO, <b>Nombres:</b> ROCIO', '10.100.100.15', 1),
(388, '2023-06-22 16:24:51', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(389, '2023-06-23 08:21:43', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(390, '2023-06-23 08:22:30', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> PARI, <b>Apellido materno:</b> MAMANI, <b>Nombres:</b> ARMANDO', '10.100.100.15', 2),
(391, '2023-06-23 08:53:49', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> GUZMAN, <b>Apellido materno:</b> FUENTES, <b>Nombres:</b> TEODORO GILBERTO', '10.100.100.15', 2),
(392, '2023-06-23 10:10:00', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MONZON, <b>Apellido materno:</b> DE GUZMAN, <b>Nombres:</b> MANUELA YOBA', '10.100.100.15', 2),
(393, '2023-06-23 10:10:53', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> BRIONES, <b>Apellido materno:</b> JIMENEZ, <b>Nombres:</b> MARCO ANTONIO', '10.100.100.15', 2),
(394, '2023-06-23 10:17:58', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> P06309878, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> AREQUIPA', '10.100.100.15', 2),
(395, '2023-06-23 14:20:18', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con nÂ° de DNI <b>71983058</b>, ha ingresado al sistema', '10.100.100.15', 5),
(396, '2023-06-23 14:20:59', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con el nÂ° de DNI <b>71983058</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 43491684', '10.100.100.15', 5),
(397, '2023-06-26 08:08:47', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(398, '2023-06-26 09:26:21', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(399, '2023-06-26 09:27:24', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ROJAS, <b>Apellido materno:</b> ROJAS, <b>Nombres:</b> JULIO LEANDRO', '10.100.100.15', 16),
(400, '2023-06-26 09:36:17', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> VELASQUEZ, <b>Apellido materno:</b> ESCOBAR DE MAMANI, <b>Nombres:</b> VICTORIA PASTORA', '10.100.100.15', 16),
(401, '2023-06-26 09:38:11', 'El usuario <b>VILMA YUVALDINA YNCA CRUZ</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(402, '2023-06-26 15:27:57', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(403, '2023-06-26 15:30:38', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(404, '2023-06-26 15:33:50', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha registrado al usuario <b>Usuario Prueba de</b> identificado con nÂ° de DNI <b>00000000</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#17\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(405, '2023-06-26 15:36:01', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(406, '2023-06-26 15:36:50', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Vilma Yuvaldina Ynca Cruz</b> identificado con nÂ° de DNI <b>42482896</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#16\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(407, '2023-06-26 15:37:05', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha actualizado los datos del usuario <b>Usuario de Prueba</b> identificado con nÂ° de DNI <b>00000000</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#17\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1),
(408, '2023-06-26 15:47:07', 'El usuario <b>Usuario de Prueba</b>, identificado con nÂ° de DNI <b>00000000</b>, ha ingresado al sistema', '10.100.100.15', 17),
(409, '2023-06-26 15:47:12', 'El usuario <b>Usuario de Prueba</b>, identificado con nÂ° de DNI <b>00000000</b>, ha salido del sistema', '10.100.100.15', 17),
(410, '2023-06-26 15:47:22', 'El usuario <b>Usuario de Prueba</b>, identificado con nÂ° de DNI <b>00000000</b>, ha ingresado al sistema', '10.100.100.15', 17),
(411, '2023-06-26 15:48:46', 'El usuario <b>Usuario de Prueba</b>, identificado con el nÂ° de DNI <b>00000000</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> LOPEZ, <b>Apellido materno:</b> TANG, <b>Nombres:</b> EVERT', '10.100.100.15', 17),
(412, '2023-06-26 15:56:49', 'El usuario <b>Usuario de Prueba</b>, identificado con el nÂ° de DNI <b>00000000</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> A6D610, <b>Oficina registral:</b> ', '10.100.100.15', 17),
(413, '2023-06-26 15:57:27', 'El usuario <b>Usuario de Prueba</b>, identificado con nÂ° de DNI <b>00000000</b>, ha actualizado los datos del usuario <b>Usuario de Prueba</b> identificado con nÂ° de DNI <b>00000000</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#17\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 17),
(414, '2023-06-26 15:57:41', 'El usuario <b>Usuario de Prueba</b>, identificado con nÂ° de DNI <b>00000000</b>, ha actualizado los datos del usuario <b>Hugo RubÃ©n GarcÃ­a Mamani</b> identificado con nÂ° de DNI <b>00480976</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#13\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 17),
(415, '2023-06-26 15:57:46', 'El usuario <b>Usuario de Prueba</b>, identificado con nÂ° de DNI <b>00000000</b>, ha actualizado los datos del usuario <b>Usuario de Prueba</b> identificado con nÂ° de DNI <b>00000000</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#17\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 17),
(416, '2023-06-26 16:04:07', 'El usuario <b>Usuario de Prueba</b>, identificado con nÂ° de DNI <b>00000000</b>, ha salido del sistema', '10.100.100.15', 17),
(417, '2023-06-26 16:15:46', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(418, '2023-06-26 16:17:22', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1),
(419, '2023-06-26 16:38:23', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(420, '2023-06-26 16:42:50', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHOQUE, <b>Apellido materno:</b> ROMERO, <b>Nombres:</b> FREDY', '10.100.100.15', 9),
(421, '2023-06-27 07:41:35', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(422, '2023-06-27 07:46:54', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHOQUE, <b>Apellido materno:</b> ROMERO, <b>Nombres:</b> FREDY', '10.100.100.15', 9),
(423, '2023-06-27 07:49:06', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CHOQUE, <b>Apellido materno:</b> ROMERO, <b>Nombres:</b> FREDY', '10.100.100.15', 9),
(424, '2023-06-27 10:22:45', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(425, '2023-06-27 10:25:49', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> SANCHEZ, <b>Apellido materno:</b> ROSADO, <b>Nombres:</b> JUSTO OMAR', '10.100.100.15', 2),
(426, '2023-06-27 10:47:55', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> PINEDO, <b>Apellido materno:</b> ALEGRIA, <b>Nombres:</b> MARITZA TERESA', '10.100.100.15', 2),
(427, '2023-06-27 15:13:15', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(428, '2023-06-27 15:15:14', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> TALACE, <b>Apellido materno:</b> POMA, <b>Nombres:</b> FLORENCIA', '10.100.100.15', 12),
(429, '2023-06-28 11:52:51', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> APAZA, <b>Apellido materno:</b> HUALLPA, <b>Nombres:</b> MARGARITA', '10.100.100.15', 2),
(430, '2023-06-28 14:32:36', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(431, '2023-07-01 12:34:58', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(432, '2023-07-01 12:35:47', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MERMA, <b>Apellido materno:</b> ORDOÃ‘O, <b>Nombres:</b> JUSTO', '10.100.100.15', 12),
(433, '2023-07-03 12:01:42', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(434, '2023-07-03 12:09:47', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> APAZA, <b>Apellido materno:</b> HUALLPA, <b>Nombres:</b> MARGARITA', '10.100.100.15', 16),
(435, '2023-07-03 13:27:27', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 16),
(436, '2023-07-03 13:41:25', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(437, '2023-07-03 13:54:49', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(438, '2023-07-03 13:55:25', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> RODRIGUEZ, <b>Apellido materno:</b> VELASQUEZ, <b>Nombres:</b> PEDRO LEONIDAS', '10.100.100.15', 2),
(439, '2023-07-03 13:55:56', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> RODRIGUEZ, <b>Apellido materno:</b> VELASQUEZ, <b>Nombres:</b> PEDRO LEONIDAS', '10.100.100.15', 2),
(440, '2023-07-03 14:53:12', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con nÂ° de DNI <b>00492491</b>, ha ingresado al sistema', '10.100.100.15', 4),
(441, '2023-07-03 15:02:43', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con el nÂ° de DNI <b>00492491</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> TORRES, <b>Apellido materno:</b> CHAPARRO, <b>Nombres:</b> MARCOS', '10.100.100.15', 4),
(442, '2023-07-03 15:12:08', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con el nÂ° de DNI <b>00492491</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>NÂ° de placa:</b> Z2H430, <b>Oficina registral:</b> ', '10.100.100.15', 4),
(443, '2023-07-03 15:16:44', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con nÂ° de DNI <b>00492491</b>, ha salido del sistema', '10.100.100.15', 4),
(444, '2023-07-03 16:11:49', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(445, '2023-07-03 16:19:46', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 16),
(446, '2023-07-03 16:57:15', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(447, '2023-07-03 17:03:40', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con nÂ° de DNI <b>00492491</b>, ha ingresado al sistema', '10.100.100.15', 4),
(448, '2023-07-03 17:08:55', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con el nÂ° de DNI <b>00492491</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CACERES, <b>Apellido materno:</b> ALARCON, <b>Nombres:</b> ELIANA EUGENIA', '10.100.100.15', 4),
(449, '2023-07-03 17:25:18', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con el nÂ° de DNI <b>00492491</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> GALVAN, <b>Apellido materno:</b> FUENTES, <b>Nombres:</b> LUIS ALBERTO', '10.100.100.15', 4),
(450, '2023-07-03 17:28:16', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con nÂ° de DNI <b>00492491</b>, ha salido del sistema', '10.100.100.15', 4),
(451, '2023-07-04 07:43:49', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con nÂ° de DNI <b>71983058</b>, ha ingresado al sistema', '10.100.100.15', 5),
(452, '2023-07-04 07:44:08', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con el nÂ° de DNI <b>71983058</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 46505449', '10.100.100.15', 5),
(453, '2023-07-04 07:44:39', 'El usuario <b>Ever SÃ¡nchez Alejos</b>, identificado con el nÂ° de DNI <b>71983058</b>, ha realizado una bÃºsqueda en el servicio <b>ESSALUD</b> con los siguientes datos: <b>DNI:</b> 71983058', '10.100.100.15', 5),
(454, '2023-07-04 15:40:58', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(455, '2023-07-04 15:49:30', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MEJIA, <b>Apellido materno:</b> SAAVEDRA, <b>Nombres:</b> RODOLFO HUMBERTO', '10.100.100.15', 12),
(456, '2023-07-04 15:55:24', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(457, '2023-07-04 16:02:29', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MEJIA, <b>Apellido materno:</b> SAAVEDRA, <b>Nombres:</b> RODOLFO', '10.100.100.15', 12),
(458, '2023-07-04 16:10:26', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(459, '2023-07-04 16:42:53', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 16),
(460, '2023-07-04 16:42:54', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(461, '2023-07-04 16:42:54', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(462, '2023-07-04 16:43:07', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 2),
(463, '2023-07-04 18:05:54', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(464, '2023-07-05 08:43:32', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(465, '2023-07-05 10:41:28', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con nÂ° de DNI <b>29383430</b>, ha ingresado al sistema', '10.100.100.15', 2),
(466, '2023-07-05 10:52:15', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 2),
(467, '2023-07-05 10:56:58', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> ALARCON, <b>Apellido materno:</b> VEGA DE CASTRO, <b>Nombres:</b> NERY', '10.100.100.15', 2),
(468, '2023-07-05 11:10:59', 'El usuario <b>Josefina Andrea JimÃ©nez JimÃ©nez</b>, identificado con el nÂ° de DNI <b>29383430</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 2),
(469, '2023-07-05 12:06:17', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con nÂ° de DNI <b>00515635</b>, ha ingresado al sistema', '10.100.100.15', 9),
(470, '2023-07-05 12:15:19', 'El usuario <b>HÃ©ctor SaÃºl Pare Esquivel</b>, identificado con el nÂ° de DNI <b>00515635</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MENDOZA, <b>Apellido materno:</b> OSORIO, <b>Nombres:</b> THIERRY ULISES', '10.100.100.15', 9),
(471, '2023-07-05 15:59:18', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(472, '2023-07-05 16:01:59', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> MONZON, <b>Apellido materno:</b> DE GUZMAN, <b>Nombres:</b> MANUELA YOBA', '10.100.100.15', 16),
(473, '2023-07-05 16:33:04', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(474, '2023-07-05 16:34:03', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> RODRIGUEZ, <b>Apellido materno:</b> CHULA, <b>Nombres:</b> OMAR', '10.100.100.15', 12),
(475, '2023-07-05 16:34:28', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(476, '2023-07-05 16:49:59', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha ingresado al sistema', '10.100.100.15', 16),
(477, '2023-07-05 16:51:19', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> APAZA, <b>Apellido materno:</b> HUALLPA, <b>Nombres:</b> MARGARITA', '10.100.100.15', 16),
(478, '2023-07-05 17:05:40', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nÂ° de partida y oficina registral, <b>NÂ° de partida:</b> 11025583, <b>Tipo de partida:</b> Predial, <b>Oficina registral:</b> TACNA', '10.100.100.15', 16),
(479, '2023-07-05 17:24:31', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con el nÂ° de DNI <b>42482896</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 16),
(480, '2023-07-05 17:25:13', 'El usuario <b>Vilma Yuvaldina Ynca Cruz</b>, identificado con nÂ° de DNI <b>42482896</b>, ha salido del sistema', '10.100.100.15', 16),
(481, '2023-07-06 10:36:35', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con nÂ° de DNI <b>00492491</b>, ha ingresado al sistema', '10.100.100.15', 4),
(482, '2023-07-06 10:37:51', 'El usuario <b>Guido Regner Siles Denegri</b>, identificado con el nÂ° de DNI <b>00492491</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> APAZA, <b>Apellido materno:</b> APAZA, <b>Nombres:</b> ROBIN FABREGAS', '10.100.100.15', 4),
(483, '2023-07-06 12:23:19', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con nÂ° de DNI <b>00515390</b>, ha ingresado al sistema', '10.100.100.15', 12),
(484, '2023-07-06 12:26:45', 'El usuario <b>Ãngel Merma Cahuana</b>, identificado con el nÂ° de DNI <b>00515390</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> PEREZ, <b>Apellido materno:</b> SALDAÃ‘A, <b>Nombres:</b> SARAI', '10.100.100.15', 12),
(485, '2023-07-06 16:07:45', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(486, '2023-07-06 16:21:10', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 1),
(487, '2023-07-06 16:35:21', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 1),
(488, '2023-07-06 16:42:26', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha ingresado al sistema', '10.100.100.15', 1),
(489, '2023-07-06 16:45:04', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 1),
(490, '2023-07-06 16:49:28', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 1),
(491, '2023-07-06 16:51:07', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 1),
(492, '2023-07-06 16:54:30', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 1),
(493, '2023-07-06 17:04:13', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con el nÂ° de DNI <b>45287124</b>, ha realizado una bÃºsqueda en el servicio <b>SUNARP</b> con los siguientes datos: <b>Tipo de bÃºsqueda:</b> Por nombres y apellidos, <b>Apellido paterno:</b> CONDORI, <b>Apellido materno:</b> CONDORI, <b>Nombres:</b> MARIA', '10.100.100.15', 1),
(494, '2023-07-06 17:11:26', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha salido del sistema', '10.100.100.15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_generallogin`
--

DROP TABLE IF EXISTS `tbl_generallogin`;
CREATE TABLE IF NOT EXISTS `tbl_generallogin` (
  `gen_id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gen_pass` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_ser_gen` int(11) NOT NULL,
  PRIMARY KEY (`gen_id`),
  UNIQUE KEY `fk_ser_gen_UNIQUE` (`fk_ser_gen`),
  KEY `fk_tbl_generalLogin_tbl_servicios1_idx` (`fk_ser_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_generallogin`
--

INSERT INTO `tbl_generallogin` (`gen_id`, `gen_user`, `gen_pass`, `fk_ser_gen`) VALUES
(2, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 3),
(5, 'MDPOCOLLAY', 'LsCC422xu5', 8),
(6, '20147796987-71983058', 'Ever1983058sanChez$', 6),
(7, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_niveles`
--

DROP TABLE IF EXISTS `tbl_niveles`;
CREATE TABLE IF NOT EXISTS `tbl_niveles` (
  `niv_id` int(11) NOT NULL AUTO_INCREMENT,
  `niv_nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `niv_estado` int(11) NOT NULL,
  PRIMARY KEY (`niv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_niveles`
--

INSERT INTO `tbl_niveles` (`niv_id`, `niv_nombre`, `niv_estado`) VALUES
(1, 'ADMIN', 1),
(2, 'USER', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rel_usu_ser`
--

DROP TABLE IF EXISTS `tbl_rel_usu_ser`;
CREATE TABLE IF NOT EXISTS `tbl_rel_usu_ser` (
  `relus_id` int(11) NOT NULL AUTO_INCREMENT,
  `relus_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relus_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_usu_relus` int(11) NOT NULL,
  `fk_ser_relus` int(11) NOT NULL,
  PRIMARY KEY (`relus_id`),
  KEY `fk_tbl_rel_usu_ser_tbl_usuarios_idx` (`fk_usu_relus`),
  KEY `fk_tbl_rel_usu_ser_tbl_servicios1_idx` (`fk_ser_relus`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_rel_usu_ser`
--

INSERT INTO `tbl_rel_usu_ser` (`relus_id`, `relus_username`, `relus_password`, `fk_usu_relus`, `fk_ser_relus`) VALUES
(24, '00494374', '4374jose', 1, 2),
(25, '29383430', 'jajj2938', 2, 2),
(31, '40681284', '6812arse', 3, 2),
(32, '', '', 4, 4),
(33, '71983058', '71983sae', 5, 2),
(34, '00494374', '4374jose', 6, 2),
(44, '', '', 6, 9),
(45, '', '', 6, 4),
(46, '', '', 6, 10),
(50, '', '', 3, 4),
(53, '', '', 2, 4),
(54, '00494374', '4374jose', 8, 2),
(55, '', '', 8, 10),
(56, '', '', 8, 9),
(57, '', '', 8, 4),
(58, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 1, 3),
(59, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 6, 3),
(60, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 5, 3),
(61, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 8, 3),
(62, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 3, 3),
(63, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 2, 3),
(64, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 4, 3),
(65, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 9, 3),
(66, '', '', 9, 4),
(67, '40681284', '6812arse', 9, 2),
(69, 'MDPOCOLLAY', 'LsCC422xu5', 1, 8),
(70, 'MDPOCOLLAY', 'LsCC422xu5', 6, 8),
(73, '', '', 5, 4),
(74, '', '', 5, 9),
(75, 'MDPOCOLLAY', 'LsCC422xu5', 5, 8),
(76, '', '', 5, 10),
(77, '', '', 1, 4),
(78, '', '', 1, 9),
(79, '', '', 1, 10),
(82, 'MDPOCOLLAY', 'LsCC422xu5', 11, 8),
(83, '', '', 11, 9),
(84, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 12, 3),
(85, '40681284', '6812arse', 12, 2),
(86, '', '', 12, 4),
(90, '20147796987-71983058', 'Ever1983058sanChez$', 1, 6),
(91, '20147796987-71983058', 'Ever1983058sanChez$', 5, 6),
(97, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 1, 7),
(98, '71983058', '71983sae', 13, 2),
(99, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 13, 3),
(100, '', '', 13, 4),
(101, '20147796987-71983058', 'Ever1983058sanChez$', 13, 6),
(102, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 13, 7),
(103, '', '', 13, 10),
(104, '', '', 13, 9),
(105, 'MDPOCOLLAY', 'LsCC422xu5', 13, 8),
(114, '40681284', '6812arse', 4, 2),
(116, '20147796987-71983058', 'Ever1983058sanChez$', 6, 6),
(117, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 6, 7),
(118, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 5, 7),
(119, '71983058', '71983sae', 14, 2),
(120, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 14, 3),
(121, '', '', 14, 4),
(122, '20147796987-71983058', 'Ever1983058sanChez$', 14, 6),
(123, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 14, 7),
(124, 'MDPOCOLLAY', 'LsCC422xu5', 14, 8),
(125, '', '', 14, 9),
(126, '40681284', '6812arse', 15, 2),
(127, '', '', 15, 4),
(128, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 15, 3),
(129, '40681284', '6812arse', 16, 2),
(130, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 16, 3),
(131, '', '', 16, 4),
(132, '20147796987-71983058', 'Ever1983058sanChez$', 16, 6),
(133, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 16, 7),
(134, '', '', 16, 10),
(135, '71983058', '71983sae', 17, 2),
(136, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 17, 3),
(137, '', '', 17, 4),
(138, '', '', 17, 10),
(139, '20147796987-71983058', 'Ever1983058sanChez$', 17, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_servicios`
--

DROP TABLE IF EXISTS `tbl_servicios`;
CREATE TABLE IF NOT EXISTS `tbl_servicios` (
  `ser_id` int(11) NOT NULL AUTO_INCREMENT,
  `ser_nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ser_etiqueta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ser_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ser_descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ser_login` int(11) NOT NULL,
  `ser_generalLogin` int(11) NOT NULL,
  `ser_update` int(11) NOT NULL,
  `ser_updatetime` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ser_estado` int(11) NOT NULL,
  PRIMARY KEY (`ser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_servicios`
--

INSERT INTO `tbl_servicios` (`ser_id`, `ser_nombre`, `ser_etiqueta`, `ser_logo`, `ser_descripcion`, `ser_login`, `ser_generalLogin`, `ser_update`, `ser_updatetime`, `ser_estado`) VALUES
(2, 'ESSALUD', 'EsSalud', '1eee7cd1b832e609d0f8cece1ab8af0464e12993.png', 'Consulta de asegurados', 1, 2, 2, '15', 1),
(3, 'SUNARP', 'SUNARP', 'ea1f5e3736faf9190566833af7c003eca3671c45.png', 'Consulta de titularidad de dominio, partidas registrales e informaciÃ³n vehicular', 1, 1, 2, NULL, 1),
(4, 'SUNAT', 'SUNAT', '10912e65e1a6f928819e3344e6bd11681ab11660.png', 'Consulta de datos generales y domicilio fiscal', 2, 2, 2, NULL, 1),
(5, 'RENIEC', 'RENIEC', 'fada7dbaa3a3d3c0b4dcef5102f6a89ea9f48013.png', 'Consulta de datos y estado vital', 1, 2, 2, NULL, 2),
(6, 'MPAREQUIPA', 'Municipalidad Provincial de Arequipa', '1a71c1ef988952856c256f5650a3744517d1e89d.png', 'Consulta de predios', 1, 1, 2, NULL, 1),
(7, 'MPILO', 'Municipalidad Provincial de Ilo', 'c422d2fa9b71c514ad41b68a7ef453f36c1fd0ea.png', 'Consulta de predios', 1, 1, 2, NULL, 1),
(8, 'SUNEDU', 'SUNEDU', '020c453086f34d31671baa1fc19d45285366dc84.png', 'Consulta de grados y tÃ­tulos en universidades', 1, 1, 2, NULL, 1),
(9, 'MINEDU', 'MINEDU', '01ee2b9e72cfdc565ffa8e9619126b6ba1655b24.png', 'Consulta de grados y tÃ­tulos de institutos', 2, 1, 2, NULL, 1),
(10, 'SATLIMA', 'SAT de Municipalidad Metropolitana de Lima', '896722f2d2b3c75103a78dc307b26db985689f5b.png', 'Consulta de predios', 2, 1, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_updates`
--

DROP TABLE IF EXISTS `tbl_updates`;
CREATE TABLE IF NOT EXISTS `tbl_updates` (
  `upd_id` int(11) NOT NULL AUTO_INCREMENT,
  `upd_time` date NOT NULL,
  `fk_ser_upd` int(11) NOT NULL,
  PRIMARY KEY (`upd_id`),
  KEY `fk_tbl_updates_tbl_servicios1_idx` (`fk_ser_upd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_apellidopat` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_apellidomat` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_nombres` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_dni` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_area` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_cargo` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usu_estado` int(11) NOT NULL,
  `fk_niv_usu` int(11) NOT NULL,
  PRIMARY KEY (`usu_id`),
  KEY `fk_tbl_usuarios_tbl_niveles1_idx` (`fk_niv_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`usu_id`, `usu_apellidopat`, `usu_apellidomat`, `usu_nombres`, `usu_dni`, `usu_username`, `usu_password`, `usu_email`, `usu_area`, `usu_cargo`, `usu_estado`, `fk_niv_usu`) VALUES
(1, 'LÃ³pez', 'Espinoza', 'Alexis Evertt', '45287124', 'admin', '$2y$10$cK1SXmrSlOa4TwRS98ANeelekWAx2Qby5WM8Wc7imU726vHI27hNK', 'alopezespinoza88@outlook.com', 'Rentas', 'Desarrollador', 1, 1),
(2, 'JimÃ©nez', 'JimÃ©nez', 'Josefina Andrea', '29383430', 'JOSJIMJIM', '$2y$10$q5tujIxr/IuK4zddZYkGE.uWDSrQqIEJ5czqJXztVxKNUnPbIFcCW', 'jjimenez@munidepocollay.gob.pe', 'Rentas', 'TÃ©cnico Administrativo I', 1, 2),
(3, 'Arteta', 'Serrano', 'Amidey', '40681284', 'AMIARTSER', '$2y$10$.udrlZYntGI7PRQA43KjReRWH/qBVF/FqoLiqG9B27C1sB/HjVo8a', 'rentas_pide@munidepocollay.gob.pe', 'Rentas', 'Gerente', 1, 2),
(4, 'Siles', 'Denegri', 'Guido Regner', '00492491', 'GUISILDEN', '$2y$10$4Jl5HlpqS8NHcTenuj1bhuTZV75dHhOX6hkmqoZjL8nEyzoVbg01m', 'ejecutoriacoactiva_pide@munidepocollay.gob.pe', 'Coactiva', 'Ejecutor Coactivo', 1, 2),
(5, 'SÃ¡nchez', 'Alejos', 'Ever', '71983058', 'EVESANALE', '$2y$10$0a3HX4jvlLkpbmzvGlwhGOnAs.cVkwj/Xfwf/T5GY17RBCGqsq/ua', 'presupuesto_pide@munidepocollay.gob.pe', 'Presupuesto', 'Gerente', 1, 1),
(6, 'Ramos', 'Aguilar', 'JosÃ© Antonio', '00494374', 'JOSRAMAGU', '$2y$10$HlZPbyxEoM061CeI3KAG6eFH5kIKJYFaO.Yp8VAqdnT47ORp9KaHC', 'informatica_pide@munidepocollay.gob.pe', 'InformÃ¡tica', 'Responsable', 1, 1),
(8, 'Salamanca', 'Contreras', 'Fiorella Rosmery', '76619492', 'FIOSALCON', '$2y$10$KfjUf1Kp85D1iV7VGRZ4hOFVko.TswMZ111EaVx5gA5Qc8eakHRay', 'informatica_pide@munidepocollay.gob.pe', 'InformÃ¡tica', 'Desarrollador', 2, 1),
(9, 'Pare', 'Esquivel', 'HÃ©ctor SaÃºl', '00515635', 'HECPARESQ', '$2y$10$o0yOwySvmjPAwF6cfghpQul4yFRohH91l4SNr7.0Fiueb84HERVSa', 'rentas_pide@munidepocollay.gob.pe', 'Rentas', 'Especialista Tributario', 1, 2),
(11, 'Flores', 'Mendoza', 'Elvis', '47982074', 'ELVFLOMEN', '$2y$10$6CO4DhaXf4wqS8UGApuJwuZ.HLOnJ48AJUgFxniMJ0lpqCJ.1LTTm', 'presupuesto_pide@munidepocollay.gob.pe', 'Presupuesto', 'Especialista', 2, 2),
(12, 'Merma', 'Cahuana', 'Ãngel', '00515390', 'ANGMERCAH', '$2y$10$HNvhgMoZpG.BfxLU0GgtsOLVHVqkT2IRQnQgpNitDCMruqCo93iSG', 'rentas_pide@munidepocollay.gob.pe', 'Rentas', 'Especialista', 1, 2),
(13, 'GarcÃ­a', 'Mamani', 'Hugo RubÃ©n', '00480976', 'HUGGARMAM', '$2y$10$cp0SibDx8LmncWvEtA42RuWG/DMMXBRBX5KHOrGJTCgAiMD6YmQai', 'mdp@munidepocollay.gob.pe', 'AlcaldÃ­a', 'Alcalde', 1, 1),
(14, 'Quenta', 'Loza', 'Rigoberto MartÃ­n', '70166250', 'RIGQUELOZ', '$2y$10$9pA5lY4uU9NnNdZlMyqeHOrAbSkJ8.5goYqRHLgAwnqAmaU7Cz2CS', 'gerenciamunicipal@munidepocollay.gob.pe', 'Gerencia Municipal', 'Gerente', 1, 1),
(15, 'Ari', 'Mendoza', 'Elvis Wilber', '41408919', 'ELVARIMEN', '$2y$10$1GvduPqstERxd/E4cInMKe92hGTGBo1rkVo41KvSpU1skkiq1VCKW', 'rentas_pide@munidepocollay.gob.pe', 'Rentas', 'Especialista Tributario', 1, 2),
(16, 'Ynca', 'Cruz', 'Vilma Yuvaldina', '42482896', 'VILYNCCRU', '$2y$10$4HG6q/BZ3yrXuHV54F8LX.sLSho38T4bUfkWbG5uQow8whD/uhTLO', 'rentas_pide@munidepocollay.gob.pe', 'Rentas', 'Asistente administrativo', 1, 2),
(17, 'de', 'Prueba', 'Usuario', '00000000', 'MDP-PIDE', '$2y$10$uuzixjlEnt5t6dC3ZolrneKSnhQ46/9wdJPctcZ7WJE/acDso1OQa', 'mdp@munidepocollay.gob.pe', 'Ninguna', 'Ninguno', 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_control`
--
ALTER TABLE `tbl_control`
  ADD CONSTRAINT `fk_tbl_control_tbl_usuarios1` FOREIGN KEY (`fk_usu_con`) REFERENCES `tbl_usuarios` (`usu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_generallogin`
--
ALTER TABLE `tbl_generallogin`
  ADD CONSTRAINT `fk_tbl_generalLogin_tbl_servicios1` FOREIGN KEY (`fk_ser_gen`) REFERENCES `tbl_servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_rel_usu_ser`
--
ALTER TABLE `tbl_rel_usu_ser`
  ADD CONSTRAINT `fk_tbl_rel_usu_ser_tbl_servicios1` FOREIGN KEY (`fk_ser_relus`) REFERENCES `tbl_servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tbl_rel_usu_ser_tbl_usuarios` FOREIGN KEY (`fk_usu_relus`) REFERENCES `tbl_usuarios` (`usu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_updates`
--
ALTER TABLE `tbl_updates`
  ADD CONSTRAINT `fk_tbl_updates_tbl_servicios1` FOREIGN KEY (`fk_ser_upd`) REFERENCES `tbl_servicios` (`ser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `fk_tbl_usuarios_tbl_niveles1` FOREIGN KEY (`fk_niv_usu`) REFERENCES `tbl_niveles` (`niv_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
