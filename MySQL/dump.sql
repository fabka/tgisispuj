/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add director',1,'add_director'),(2,'Can change director',1,'change_director'),(3,'Can delete director',1,'delete_director'),(4,'Can add grupo investigacion',2,'add_grupoinvestigacion'),(5,'Can change grupo investigacion',2,'change_grupoinvestigacion'),(6,'Can delete grupo investigacion',2,'delete_grupoinvestigacion'),(7,'Can add mencion honor',3,'add_mencionhonor'),(8,'Can change mencion honor',3,'change_mencionhonor'),(9,'Can delete mencion honor',3,'delete_mencionhonor'),(10,'Can add modalidad',4,'add_modalidad'),(11,'Can change modalidad',4,'change_modalidad'),(12,'Can delete modalidad',4,'delete_modalidad'),(13,'Can add titulo aplicado',5,'add_tituloaplicado'),(14,'Can change titulo aplicado',5,'change_tituloaplicado'),(15,'Can delete titulo aplicado',5,'delete_tituloaplicado'),(16,'Can add periodo academico',6,'add_periodoacademico'),(17,'Can change periodo academico',6,'change_periodoacademico'),(18,'Can delete periodo academico',6,'delete_periodoacademico'),(19,'Can add proyecto',7,'add_proyecto'),(20,'Can change proyecto',7,'change_proyecto'),(21,'Can delete proyecto',7,'delete_proyecto'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add permission',9,'add_permission'),(26,'Can change permission',9,'change_permission'),(27,'Can delete permission',9,'delete_permission'),(28,'Can add group',10,'add_group'),(29,'Can change group',10,'change_group'),(30,'Can delete group',10,'delete_group'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user'),(34,'Can add content type',12,'add_contenttype'),(35,'Can change content type',12,'change_contenttype'),(36,'Can delete content type',12,'delete_contenttype'),(37,'Can add session',13,'add_session'),(38,'Can change session',13,'change_session'),(39,'Can delete session',13,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$hmnChjEquoiK$CdRAU4zHNhvP+ONKizzlejd0Z+WJAqjg6wwGK7aVi0U=','2016-08-16 23:01:12',1,'admin','','','luisa.barrera@javeriana.edu.co',1,1,'2016-08-16 23:00:52');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-08-16 23:03:50','1','Luis Guillermo Torres Ribero',1,'Added.',1,1),(2,'2016-08-16 23:03:56','1','Pregrado',1,'Added.',5,1),(3,'2016-08-16 23:04:08','1','2016 - 1',1,'Added.',6,1),(4,'2016-08-16 23:04:22','1','Investigación',1,'Added.',4,1),(5,'2016-08-16 23:04:28','1','Por definir',1,'Added.',3,1),(6,'2016-08-16 23:04:35','1','SIDRe',1,'Added.',2,1),(7,'2016-08-16 23:05:10','1','1 - AKLAS: dispositivo de orientación para invidentes basado en el principio de ecolocalización',1,'Added.',7,1),(8,'2016-08-16 23:05:59','2','Alexandra Pomares Quimbaya',1,'Added.',1,1),(9,'2016-08-16 23:06:37','2','Aplicación',1,'Added.',4,1),(10,'2016-08-16 23:06:42','2','TAKINA',1,'Added.',2,1),(11,'2016-08-16 23:06:45','3','ISTAR',1,'Added.',2,1),(12,'2016-08-16 23:06:48','4','BASPI',1,'Added.',2,1),(13,'2016-08-16 23:06:56','5','Ninguno',1,'Added.',2,1),(14,'2016-08-16 23:07:04','2','No',1,'Added.',3,1),(15,'2016-08-16 23:07:19','3','Emprendimiento',1,'Added.',4,1),(16,'2016-08-16 23:07:31','4','Guía metodológica',1,'Added.',4,1),(17,'2016-08-16 23:07:49','2','2 - Sistema de Información, Inventarios, Farmacia, Hospital, Logistica, Medicamentos, Software, Cadena de Abastecimiento farmaceutica',1,'Added.',7,1),(18,'2016-08-16 23:09:15','3','Efraín Ortiz Pabón',1,'Added.',1,1),(19,'2016-08-16 23:09:35','3','3 - SiMAPRE - Sistema de Mantenimiento Preventivo Vehicular',1,'Added.',7,1),(20,'2016-08-16 23:11:20','2','Maestría',1,'Added.',5,1),(21,'2016-08-16 23:11:38','3','Sí',1,'Added.',3,1),(22,'2016-08-16 23:13:56','4','4 - FanJam, red social para buscar e integrar talentos en la industria musical',1,'Added.',7,1),(23,'2016-08-16 23:14:30','4','4 - FanJam, red social para buscar e integrar talentos en la industria musical',2,'Changed codigo and autor.',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'admin','logentry'),(10,'auth','group'),(9,'auth','permission'),(11,'auth','user'),(12,'contenttypes','contenttype'),(1,'proyectos','director'),(2,'proyectos','grupoinvestigacion'),(3,'proyectos','mencionhonor'),(4,'proyectos','modalidad'),(6,'proyectos','periodoacademico'),(7,'proyectos','proyecto'),(5,'proyectos','tituloaplicado'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-08-16 23:00:14'),(2,'auth','0001_initial','2016-08-16 23:00:15'),(3,'admin','0001_initial','2016-08-16 23:00:15'),(4,'admin','0002_logentry_remove_auto_add','2016-08-16 23:00:15'),(5,'contenttypes','0002_remove_content_type_name','2016-08-16 23:00:15'),(6,'auth','0002_alter_permission_name_max_length','2016-08-16 23:00:15'),(7,'auth','0003_alter_user_email_max_length','2016-08-16 23:00:15'),(8,'auth','0004_alter_user_username_opts','2016-08-16 23:00:15'),(9,'auth','0005_alter_user_last_login_null','2016-08-16 23:00:15'),(10,'auth','0006_require_contenttypes_0002','2016-08-16 23:00:15'),(11,'auth','0007_alter_validators_add_error_messages','2016-08-16 23:00:15'),(12,'proyectos','0001_initial','2016-08-16 23:00:15'),(13,'proyectos','0002_profesores','2016-08-16 23:00:15'),(14,'proyectos','0003_auto_20160205_2145','2016-08-16 23:00:15'),(15,'proyectos','0004_proyecto_profesor','2016-08-16 23:00:15'),(16,'proyectos','0005_grupoinvestigacion_mencionhonor_modalidad_nivelestudio','2016-08-16 23:00:16'),(17,'proyectos','0006_auto_20160205_2215','2016-08-16 23:00:16'),(18,'proyectos','0007_auto_20160206_0336','2016-08-16 23:00:16'),(19,'proyectos','0008_periodoacademico','2016-08-16 23:00:16'),(20,'proyectos','0009_auto_20160206_0408','2016-08-16 23:00:17'),(21,'proyectos','0010_auto_20160212_2112','2016-08-16 23:00:17'),(22,'proyectos','0011_auto_20160212_2128','2016-08-16 23:00:17'),(23,'proyectos','0012_auto_20160212_2130','2016-08-16 23:00:17'),(24,'proyectos','0013_auto_20160212_2133','2016-08-16 23:00:17'),(25,'proyectos','0014_auto_20160212_2145','2016-08-16 23:00:17'),(26,'proyectos','0015_auto_20160212_2147','2016-08-16 23:00:17'),(27,'proyectos','0016_auto_20160212_2203','2016-08-16 23:00:17'),(28,'proyectos','0017_auto_20160212_2205','2016-08-16 23:00:17'),(29,'proyectos','0018_proyecto_periodoacademico','2016-08-16 23:00:17'),(30,'proyectos','0019_auto_20160227_1748','2016-08-16 23:00:17'),(31,'proyectos','0020_auto_20160309_1543','2016-08-16 23:00:17'),(32,'proyectos','0021_auto_20160409_0221','2016-08-16 23:00:17'),(33,'proyectos','0022_auto_20160409_0231','2016-08-16 23:00:17'),(34,'proyectos','0023_auto_20160816_2300','2016-08-16 23:00:17'),(35,'sessions','0001_initial','2016-08-16 23:00:17');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e9flp2bplwlb0dlpr9hed27oc5ypky6v','MzBjMWE5N2NjZDE4Nzk1OGFhNWY4ZTdhN2E0MWMzMmE2MWFmMzhmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjI2MWQ4NWI5MDY1NDljOWM1OTY3MWEwNTFkYjVjMDMyNjU0MWM5ZmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-08-30 23:01:12');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_director`
--

DROP TABLE IF EXISTS `proyectos_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyectos_director_nombre_400e833b_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_director`
--

LOCK TABLES `proyectos_director` WRITE;
/*!40000 ALTER TABLE `proyectos_director` DISABLE KEYS */;
INSERT INTO `proyectos_director` VALUES (2,'Alexandra Pomares Quimbaya'),(3,'Efraín Ortiz Pabón'),(1,'Luis Guillermo Torres Ribero');
/*!40000 ALTER TABLE `proyectos_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_grupoinvestigacion`
--

DROP TABLE IF EXISTS `proyectos_grupoinvestigacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_grupoinvestigacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_grupoinvestigacion`
--

LOCK TABLES `proyectos_grupoinvestigacion` WRITE;
/*!40000 ALTER TABLE `proyectos_grupoinvestigacion` DISABLE KEYS */;
INSERT INTO `proyectos_grupoinvestigacion` VALUES (1,'SIDRe'),(2,'TAKINA'),(3,'ISTAR'),(4,'BASPI'),(5,'Ninguno');
/*!40000 ALTER TABLE `proyectos_grupoinvestigacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_mencionhonor`
--

DROP TABLE IF EXISTS `proyectos_mencionhonor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_mencionhonor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_mencionhonor`
--

LOCK TABLES `proyectos_mencionhonor` WRITE;
/*!40000 ALTER TABLE `proyectos_mencionhonor` DISABLE KEYS */;
INSERT INTO `proyectos_mencionhonor` VALUES (1,'Por definir'),(2,'No'),(3,'Sí');
/*!40000 ALTER TABLE `proyectos_mencionhonor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_modalidad`
--

DROP TABLE IF EXISTS `proyectos_modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_modalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_modalidad`
--

LOCK TABLES `proyectos_modalidad` WRITE;
/*!40000 ALTER TABLE `proyectos_modalidad` DISABLE KEYS */;
INSERT INTO `proyectos_modalidad` VALUES (1,'Investigación'),(2,'Aplicación'),(3,'Emprendimiento'),(4,'Guía metodológica');
/*!40000 ALTER TABLE `proyectos_modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_periodoacademico`
--

DROP TABLE IF EXISTS `proyectos_periodoacademico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_periodoacademico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anio` varchar(255) NOT NULL,
  `semestre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyectos_periodoacademico_anio_602c3189_uniq` (`anio`,`semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_periodoacademico`
--

LOCK TABLES `proyectos_periodoacademico` WRITE;
/*!40000 ALTER TABLE `proyectos_periodoacademico` DISABLE KEYS */;
INSERT INTO `proyectos_periodoacademico` VALUES (1,'2016','1');
/*!40000 ALTER TABLE `proyectos_periodoacademico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_proyecto`
--

DROP TABLE IF EXISTS `proyectos_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `grupoInvestigacion_id` int(11),
  `mencionHonor_id` int(11),
  `modalidad_id` int(11),
  `tituloAplicado_id` int(11) DEFAULT NULL,
  `codigo` varchar(255),
  `paginaWeb` varchar(1000) DEFAULT NULL,
  `periodoAcademico_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyectos_proyecto_codigo_c101b189_uniq` (`codigo`),
  KEY `proyectos_proyecto_21c9ccfc` (`director_id`),
  KEY `proyectos_proyecto_fbaf59a3` (`grupoInvestigacion_id`),
  KEY `proyectos_proyecto_c6acfe82` (`mencionHonor_id`),
  KEY `proyectos_proyecto_eb8f9147` (`modalidad_id`),
  KEY `proyectos_proyecto_a8f86b3d` (`tituloAplicado_id`),
  KEY `proyectos_proyecto_fd3c755a` (`periodoAcademico_id`),
  CONSTRAINT `D5b7e3fd593c17ef1801e4df6a34c100` FOREIGN KEY (`grupoInvestigacion_id`) REFERENCES `proyectos_grupoinvestigacion` (`id`),
  CONSTRAINT `proyectos_proyecto_director_id_4ed0799b_fk_proyectos_director_id` FOREIGN KEY (`director_id`) REFERENCES `proyectos_director` (`id`),
  CONSTRAINT `proyectos_proyec_modalidad_id_098ca627_fk_proyectos_modalidad_id` FOREIGN KEY (`modalidad_id`) REFERENCES `proyectos_modalidad` (`id`),
  CONSTRAINT `proyectos__mencionHonor_id_2d82eec3_fk_proyectos_mencionhonor_id` FOREIGN KEY (`mencionHonor_id`) REFERENCES `proyectos_mencionhonor` (`id`),
  CONSTRAINT `proyec_tituloAplicado_id_bdeffe75_fk_proyectos_tituloaplicado_id` FOREIGN KEY (`tituloAplicado_id`) REFERENCES `proyectos_tituloaplicado` (`id`),
  CONSTRAINT `pr_periodoAcademico_id_cc639a9e_fk_proyectos_periodoacademico_id` FOREIGN KEY (`periodoAcademico_id`) REFERENCES `proyectos_periodoacademico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_proyecto`
--

LOCK TABLES `proyectos_proyecto` WRITE;
/*!40000 ALTER TABLE `proyectos_proyecto` DISABLE KEYS */;
INSERT INTO `proyectos_proyecto` VALUES (1,'AKLAS: dispositivo de orientación para invidentes basado en el principio de ecolocalización','Omar Andres Gonzalez Mayorga y Andrés Ricardo Scarpetta Rugeles',1,1,1,1,1,'CIS1610IN03','http://pegasus.javeriana.edu.co/~CIS1610IN03/',1),(2,'Sistema de Información, Inventarios, Farmacia, Hospital, Logistica, Medicamentos, Software, Cadena de Abastecimiento farmaceutica','Jorge Luis Ruge Leiva y Camilo Andres Sierra Niño',2,5,2,2,1,'CIS1530AP07','http://pegasus.javeriana.edu.co/~CIS1530AP07/',1),(3,'SiMAPRE - Sistema de Mantenimiento Preventivo Vehicular','Nicolás Duarte Trujillo',3,5,2,3,1,'CIS1310SD01','http://pegasus.javeriana.edu.co/~CIS1310SD01/',1),(4,'FanJam, red social para buscar e integrar talentos en la industria musical','Juan Cadena',2,5,3,2,2,'CIS1230IS011','http://pegasus.javeriana.edu.co/~CIS1230IS011/',1);
/*!40000 ALTER TABLE `proyectos_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_tituloaplicado`
--

DROP TABLE IF EXISTS `proyectos_tituloaplicado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_tituloaplicado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_tituloaplicado`
--

LOCK TABLES `proyectos_tituloaplicado` WRITE;
/*!40000 ALTER TABLE `proyectos_tituloaplicado` DISABLE KEYS */;
INSERT INTO `proyectos_tituloaplicado` VALUES (1,'Pregrado'),(2,'Maestría');
/*!40000 ALTER TABLE `proyectos_tituloaplicado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
