/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.16 : Database - teknike
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`teknike` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `tb_bayar` */

CREATE TABLE `tb_bayar` (
  `id_bayar` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_bayar` varchar(255) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `biaya` double NOT NULL,
  `id_keterangan` int(11) NOT NULL,
  `bukti` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bayar`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_paket` (`id_paket`),
  KEY `id_keterangan` (`id_keterangan`),
  CONSTRAINT `tb_bayar_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_bayar_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_bayar_ibfk_3` FOREIGN KEY (`id_keterangan`) REFERENCES `tb_keterangan` (`id_keterangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_bayar` */

LOCK TABLES `tb_bayar` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_detailjadwal` */

CREATE TABLE `tb_detailjadwal` (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `pertemuan` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  KEY `id_jadwal` (`id_jadwal`),
  CONSTRAINT `tb_detailjadwal_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_detailjadwal` */

LOCK TABLES `tb_detailjadwal` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_galeri` */

CREATE TABLE `tb_galeri` (
  `id_galeri` int(11) NOT NULL AUTO_INCREMENT,
  `galeri` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_galeri`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_galeri` */

LOCK TABLES `tb_galeri` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_instruktur` */

CREATE TABLE `tb_instruktur` (
  `id_instruktur` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `pengalaman` int(255) NOT NULL,
  `skor_rating` int(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_instruktur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_instruktur` */

LOCK TABLES `tb_instruktur` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_jadwal` */

CREATE TABLE `tb_jadwal` (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `id_siswa` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `id_status` int(11) NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_paket` (`id_paket`),
  KEY `id_status` (`id_status`),
  CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_jadwal_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_jadwal_ibfk_3` FOREIGN KEY (`id_status`) REFERENCES `tb_status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_jadwal` */

LOCK TABLES `tb_jadwal` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_jeniskelamin` */

CREATE TABLE `tb_jeniskelamin` (
  `id_jeniskel` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_kelamin` varchar(255) NOT NULL,
  PRIMARY KEY (`id_jeniskel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_jeniskelamin` */

LOCK TABLES `tb_jeniskelamin` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_keterangan` */

CREATE TABLE `tb_keterangan` (
  `id_keterangan` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_keterangan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_keterangan` */

LOCK TABLES `tb_keterangan` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_kursus` */

CREATE TABLE `tb_kursus` (
  `id_kursus` int(11) NOT NULL AUTO_INCREMENT,
  `id_siswa` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_instruktur` int(11) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `id_status` int(11) NOT NULL,
  PRIMARY KEY (`id_kursus`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_paket` (`id_paket`),
  KEY `id_instruktur` (`id_instruktur`),
  KEY `id_status` (`id_status`),
  CONSTRAINT `tb_kursus_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_kursus_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_kursus_ibfk_3` FOREIGN KEY (`id_instruktur`) REFERENCES `tb_instruktur` (`id_instruktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_kursus_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `tb_status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_kursus` */

LOCK TABLES `tb_kursus` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_nilai` */

CREATE TABLE `tb_nilai` (
  `id_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `id_siswa` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_instruktur` int(11) NOT NULL,
  `nilai` varchar(255) NOT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_paket` (`id_paket`),
  KEY `id_instruktur` (`id_instruktur`),
  CONSTRAINT `tb_nilai_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_nilai_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_nilai_ibfk_3` FOREIGN KEY (`id_instruktur`) REFERENCES `tb_instruktur` (`id_instruktur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_nilai` */

LOCK TABLES `tb_nilai` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_paket` */

CREATE TABLE `tb_paket` (
  `id_paket` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `biaya` double(255,0) NOT NULL,
  PRIMARY KEY (`id_paket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_paket` */

LOCK TABLES `tb_paket` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_siswa` */

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telepon` int(255) NOT NULL,
  `id_jeniskel` int(11) NOT NULL,
  `ktp` varchar(0) NOT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `id_jeniskel` (`id_jeniskel`),
  CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_jeniskel`) REFERENCES `tb_jeniskelamin` (`id_jeniskel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_siswa` */

LOCK TABLES `tb_siswa` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_status` */

CREATE TABLE `tb_status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_status` */

LOCK TABLES `tb_status` WRITE;

UNLOCK TABLES;

/*Table structure for table `tb_user` */

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_user` */

LOCK TABLES `tb_user` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
