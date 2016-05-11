-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Servidor: 172.17.0.1:3306
-- Tiempo de generación: 11-05-2016 a las 14:54:25
-- Versión del servidor: 5.7.12
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tgisispuj`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add director', 1, 'add_director'),
(2, 'Can change director', 1, 'change_director'),
(3, 'Can delete director', 1, 'delete_director'),
(4, 'Can add grupo investigacion', 2, 'add_grupoinvestigacion'),
(5, 'Can change grupo investigacion', 2, 'change_grupoinvestigacion'),
(6, 'Can delete grupo investigacion', 2, 'delete_grupoinvestigacion'),
(7, 'Can add mencion honor', 3, 'add_mencionhonor'),
(8, 'Can change mencion honor', 3, 'change_mencionhonor'),
(9, 'Can delete mencion honor', 3, 'delete_mencionhonor'),
(10, 'Can add modalidad', 4, 'add_modalidad'),
(11, 'Can change modalidad', 4, 'change_modalidad'),
(12, 'Can delete modalidad', 4, 'delete_modalidad'),
(13, 'Can add titulo aplicado', 5, 'add_tituloaplicado'),
(14, 'Can change titulo aplicado', 5, 'change_tituloaplicado'),
(15, 'Can delete titulo aplicado', 5, 'delete_tituloaplicado'),
(16, 'Can add periodo academico', 6, 'add_periodoacademico'),
(17, 'Can change periodo academico', 6, 'change_periodoacademico'),
(18, 'Can delete periodo academico', 6, 'delete_periodoacademico'),
(19, 'Can add proyecto', 7, 'add_proyecto'),
(20, 'Can change proyecto', 7, 'change_proyecto'),
(21, 'Can delete proyecto', 7, 'delete_proyecto'),
(22, 'Can add log entry', 8, 'add_logentry'),
(23, 'Can change log entry', 8, 'change_logentry'),
(24, 'Can delete log entry', 8, 'delete_logentry'),
(25, 'Can add permission', 9, 'add_permission'),
(26, 'Can change permission', 9, 'change_permission'),
(27, 'Can delete permission', 9, 'delete_permission'),
(28, 'Can add group', 10, 'add_group'),
(29, 'Can change group', 10, 'change_group'),
(30, 'Can delete group', 10, 'delete_group'),
(31, 'Can add user', 11, 'add_user'),
(32, 'Can change user', 11, 'change_user'),
(33, 'Can delete user', 11, 'delete_user'),
(34, 'Can add content type', 12, 'add_contenttype'),
(35, 'Can change content type', 12, 'change_contenttype'),
(36, 'Can delete content type', 12, 'delete_contenttype'),
(37, 'Can add session', 13, 'add_session'),
(38, 'Can change session', 13, 'change_session'),
(39, 'Can delete session', 13, 'delete_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$Pwv0NkECIOLA$jQSa04yY1ygHhfd8HsEi5wb6DFRSGcFKJ3RFiPZg+mw=', '2016-05-11 14:48:20.066371', 1, 'admin', '', '', 'luisa.barrera@javeriana.edu.co', 1, 1, '2016-05-11 14:46:03.156531');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'admin', 'logentry'),
(10, 'auth', 'group'),
(9, 'auth', 'permission'),
(11, 'auth', 'user'),
(12, 'contenttypes', 'contenttype'),
(1, 'proyectos', 'director'),
(2, 'proyectos', 'grupoinvestigacion'),
(3, 'proyectos', 'mencionhonor'),
(4, 'proyectos', 'modalidad'),
(6, 'proyectos', 'periodoacademico'),
(7, 'proyectos', 'proyecto'),
(5, 'proyectos', 'tituloaplicado'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-05-11 14:42:56.590698'),
(2, 'auth', '0001_initial', '2016-05-11 14:43:04.809293'),
(3, 'admin', '0001_initial', '2016-05-11 14:43:06.635280'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-05-11 14:43:06.761308'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-05-11 14:43:07.817852'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-05-11 14:43:07.952140'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-05-11 14:43:08.078007'),
(8, 'auth', '0004_alter_user_username_opts', '2016-05-11 14:43:08.135733'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-05-11 14:43:08.705240'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-05-11 14:43:08.747139'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-05-11 14:43:08.806551'),
(12, 'proyectos', '0001_initial', '2016-05-11 14:43:09.108292'),
(13, 'proyectos', '0002_profesores', '2016-05-11 14:43:09.402586'),
(14, 'proyectos', '0003_auto_20160205_2145', '2016-05-11 14:43:09.568779'),
(15, 'proyectos', '0004_proyecto_profesor', '2016-05-11 14:43:11.060458'),
(16, 'proyectos', '0005_grupoinvestigacion_mencionhonor_modalidad_nivelestudio', '2016-05-11 14:43:12.191569'),
(17, 'proyectos', '0006_auto_20160205_2215', '2016-05-11 14:43:18.918982'),
(18, 'proyectos', '0007_auto_20160206_0336', '2016-05-11 14:43:23.511378'),
(19, 'proyectos', '0008_periodoacademico', '2016-05-11 14:43:23.822625'),
(20, 'proyectos', '0009_auto_20160206_0408', '2016-05-11 14:43:27.977537'),
(21, 'proyectos', '0010_auto_20160212_2112', '2016-05-11 14:43:28.271935'),
(22, 'proyectos', '0011_auto_20160212_2128', '2016-05-11 14:43:28.375739'),
(23, 'proyectos', '0012_auto_20160212_2130', '2016-05-11 14:43:28.748197'),
(24, 'proyectos', '0013_auto_20160212_2133', '2016-05-11 14:43:29.058310'),
(25, 'proyectos', '0014_auto_20160212_2145', '2016-05-11 14:43:29.200886'),
(26, 'proyectos', '0015_auto_20160212_2147', '2016-05-11 14:43:29.274264'),
(27, 'proyectos', '0016_auto_20160212_2203', '2016-05-11 14:43:29.330026'),
(28, 'proyectos', '0017_auto_20160212_2205', '2016-05-11 14:43:29.388806'),
(29, 'proyectos', '0018_proyecto_periodoacademico', '2016-05-11 14:43:31.930472'),
(30, 'proyectos', '0019_auto_20160227_1748', '2016-05-11 14:43:36.262134'),
(31, 'proyectos', '0020_auto_20160309_1543', '2016-05-11 14:43:36.325899'),
(32, 'proyectos', '0021_auto_20160409_0221', '2016-05-11 14:43:36.383555'),
(33, 'proyectos', '0022_auto_20160409_0231', '2016-05-11 14:43:36.434807'),
(34, 'proyectos', '0023_auto_20160511_1442', '2016-05-11 14:43:37.618321'),
(35, 'sessions', '0001_initial', '2016-05-11 14:43:38.271921');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4j7zalfzukz2gwcg60uxq2cfdo4vsf4u', 'NjYzNTg1Yzc4OTU0Yjc3YjJlMzhjMzBlNTg0NzIyZmM3NDY4YzVlMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjBhNjA3Mjk3NWNmNmM5MWY3OTc1MTNmYTg0ODc5Nzc2ODM1NWE1NjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-25 14:48:20.133579');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_director`
--

CREATE TABLE `proyectos_director` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_grupoinvestigacion`
--

CREATE TABLE `proyectos_grupoinvestigacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_mencionhonor`
--

CREATE TABLE `proyectos_mencionhonor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_modalidad`
--

CREATE TABLE `proyectos_modalidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_periodoacademico`
--

CREATE TABLE `proyectos_periodoacademico` (
  `id` int(11) NOT NULL,
  `anio` varchar(255) NOT NULL,
  `semestre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_proyecto`
--

CREATE TABLE `proyectos_proyecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `grupoInvestigacion_id` int(11),
  `mencionHonor_id` int(11),
  `modalidad_id` int(11),
  `tituloAplicado_id` int(11) DEFAULT NULL,
  `codigo` varchar(255),
  `paginaWeb` varchar(1000) DEFAULT NULL,
  `periodoAcademico_id` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_tituloaplicado`
--

CREATE TABLE `proyectos_tituloaplicado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indices de la tabla `proyectos_director`
--
ALTER TABLE `proyectos_director`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proyectos_director_nombre_400e833b_uniq` (`nombre`);

--
-- Indices de la tabla `proyectos_grupoinvestigacion`
--
ALTER TABLE `proyectos_grupoinvestigacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos_mencionhonor`
--
ALTER TABLE `proyectos_mencionhonor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos_modalidad`
--
ALTER TABLE `proyectos_modalidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos_periodoacademico`
--
ALTER TABLE `proyectos_periodoacademico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proyectos_periodoacademico_anio_602c3189_uniq` (`anio`,`semestre`);

--
-- Indices de la tabla `proyectos_proyecto`
--
ALTER TABLE `proyectos_proyecto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proyectos_proyecto_codigo_c101b189_uniq` (`codigo`),
  ADD KEY `proyectos_proyecto_21c9ccfc` (`director_id`),
  ADD KEY `proyectos_proyecto_fbaf59a3` (`grupoInvestigacion_id`),
  ADD KEY `proyectos_proyecto_c6acfe82` (`mencionHonor_id`),
  ADD KEY `proyectos_proyecto_eb8f9147` (`modalidad_id`),
  ADD KEY `proyectos_proyecto_a8f86b3d` (`tituloAplicado_id`),
  ADD KEY `proyectos_proyecto_fd3c755a` (`periodoAcademico_id`);

--
-- Indices de la tabla `proyectos_tituloaplicado`
--
ALTER TABLE `proyectos_tituloaplicado`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `proyectos_director`
--
ALTER TABLE `proyectos_director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyectos_grupoinvestigacion`
--
ALTER TABLE `proyectos_grupoinvestigacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyectos_mencionhonor`
--
ALTER TABLE `proyectos_mencionhonor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyectos_modalidad`
--
ALTER TABLE `proyectos_modalidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyectos_periodoacademico`
--
ALTER TABLE `proyectos_periodoacademico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyectos_proyecto`
--
ALTER TABLE `proyectos_proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyectos_tituloaplicado`
--
ALTER TABLE `proyectos_tituloaplicado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `proyectos_proyecto`
--
ALTER TABLE `proyectos_proyecto`
  ADD CONSTRAINT `D5b7e3fd593c17ef1801e4df6a34c100` FOREIGN KEY (`grupoInvestigacion_id`) REFERENCES `proyectos_grupoinvestigacion` (`id`),
  ADD CONSTRAINT `pr_periodoAcademico_id_cc639a9e_fk_proyectos_periodoacademico_id` FOREIGN KEY (`periodoAcademico_id`) REFERENCES `proyectos_periodoacademico` (`id`),
  ADD CONSTRAINT `proyec_tituloAplicado_id_bdeffe75_fk_proyectos_tituloaplicado_id` FOREIGN KEY (`tituloAplicado_id`) REFERENCES `proyectos_tituloaplicado` (`id`),
  ADD CONSTRAINT `proyectos__mencionHonor_id_2d82eec3_fk_proyectos_mencionhonor_id` FOREIGN KEY (`mencionHonor_id`) REFERENCES `proyectos_mencionhonor` (`id`),
  ADD CONSTRAINT `proyectos_proyec_modalidad_id_098ca627_fk_proyectos_modalidad_id` FOREIGN KEY (`modalidad_id`) REFERENCES `proyectos_modalidad` (`id`),
  ADD CONSTRAINT `proyectos_proyecto_director_id_4ed0799b_fk_proyectos_director_id` FOREIGN KEY (`director_id`) REFERENCES `proyectos_director` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
