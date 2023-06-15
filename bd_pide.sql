-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-05-2023 a las 21:41:52
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(51, '2023-05-25 16:40:53', 'El usuario <b>Alexis Evertt LÃ³pez Espinoza</b>, identificado con nÂ° de DNI <b>45287124</b>, ha registrado al usuario <b>Rigoberto MartÃ­n Quenta Loza</b> identificado con nÂ° de DNI <b>70166250</b>. Puede ver los datos del usuario <a href=\'../usuarios/index.php#14\' target=\'_blank\'>aquÃ­</a>.', '10.100.100.15', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(51, '', '', 3, 10),
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
(68, '', '', 9, 10),
(69, 'MDPOCOLLAY', 'LsCC422xu5', 1, 8),
(70, 'MDPOCOLLAY', 'LsCC422xu5', 6, 8),
(73, '', '', 5, 4),
(74, '', '', 5, 9),
(75, 'MDPOCOLLAY', 'LsCC422xu5', 5, 8),
(76, '', '', 5, 10),
(77, '', '', 1, 4),
(78, '', '', 1, 9),
(79, '', '', 1, 10),
(80, '', '', 3, 9),
(81, 'MDPOCOLLAY', 'LsCC422xu5', 3, 8),
(82, 'MDPOCOLLAY', 'LsCC422xu5', 11, 8),
(83, '', '', 11, 9),
(84, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 12, 3),
(85, '40681284', '6812arse', 12, 2),
(86, '', '', 12, 4),
(87, '', '', 12, 10),
(90, '20147796987-71983058', 'Ever1983058sanChez$', 1, 6),
(91, '20147796987-71983058', 'Ever1983058sanChez$', 5, 6),
(92, '20147796987-71983058', 'Ever1983058sanChez$', 3, 6),
(94, '20147796987-71983058', 'Ever1983058sanChez$', 9, 6),
(95, '20147796987-71983058', 'Ever1983058sanChez$', 12, 6),
(97, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 1, 7),
(98, '71983058', '71983sae', 13, 2),
(99, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 13, 3),
(100, '', '', 13, 4),
(101, '20147796987-71983058', 'Ever1983058sanChez$', 13, 6),
(102, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 13, 7),
(103, '', '', 13, 10),
(104, '', '', 13, 9),
(105, 'MDPOCOLLAY', 'LsCC422xu5', 13, 8),
(106, '20147796987-71983058', 'Ever1983058sanChez$', 2, 6),
(107, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 2, 7),
(108, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 9, 7),
(109, '', '', 2, 10),
(110, '20147796987-71983058', 'Ever1983058sanChez$', 4, 6),
(111, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 4, 7),
(112, '', '', 4, 10),
(113, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 12, 7),
(114, '40681284', '6812arse', 4, 2),
(115, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 3, 7),
(116, '20147796987-71983058', 'Ever1983058sanChez$', 6, 6),
(117, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 6, 7),
(118, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 5, 7),
(119, '71983058', '71983sae', 14, 2),
(120, '20147796987-MUNIDEPOCOLLAY', '!vmnz3JBncbgpYu', 14, 3),
(121, '', '', 14, 4),
(122, '20147796987-71983058', 'Ever1983058sanChez$', 14, 6),
(123, 'tacna_mdpocollay', 'Tacnampi@Pocollay2023', 14, 7),
(124, 'MDPOCOLLAY', 'LsCC422xu5', 14, 8),
(125, '', '', 14, 9);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(14, 'Quenta', 'Loza', 'Rigoberto MartÃ­n', '70166250', 'RIGQUELOZ', '$2y$10$9pA5lY4uU9NnNdZlMyqeHOrAbSkJ8.5goYqRHLgAwnqAmaU7Cz2CS', 'gerenciamunicipal@munidepocollay.gob.pe', 'Gerencia Municipal', 'Gerente', 1, 1);

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
