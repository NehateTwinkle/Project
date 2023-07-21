/*
SQLyog Ultimate v13.1.1 (32 bit)
MySQL - 10.4.28-MariaDB : Database - miniproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`miniproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `miniproject`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bid` int(30) NOT NULL AUTO_INCREMENT,
  `productid` int(30) DEFAULT NULL,
  `customerid` int(30) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `bdate` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `pstatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `book` */

insert  into `book`(`bid`,`productid`,`customerid`,`price`,`bdate`,`status`,`pstatus`) values 
(1,1,1,'60','15-07-2023','pending','pending'),
(2,2,2,'80','17-07-2023','pending','pending'),
(3,1,4,'60','19-07-2023','pending','pending'),
(4,3,1,'40','21-07-2023','pending','pending'),
(5,1,2,'60','21-07-2023','pending','pending'),
(6,1,2,'60','21-07-2023','pending','pending'),
(7,1,2,'60','21-07-2023','pending','pending'),
(8,1,2,'60','21-07-2023','pending','pending'),
(9,1,2,'60','21-07-2023','pending','pending'),
(10,1,2,'60','21-07-2023','pending','pending'),
(11,1,2,'60','21-07-2023','pending','pending');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customerid` int(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `customer` */

insert  into `customer`(`customerid`,`fname`,`lname`,`email`,`mobile`,`password`,`status`) values 
(1,'twinkle','nehate','twinklenehate@gmail.com','4698532578','twinkle','deactive'),
(2,'hinal','bhavsar','bhavsarhinal2242@gmail.com','85218541285','hinal','deactive'),
(3,'jay','pate','jay@gmail.com','1234569870','jay','active'),
(4,'khushbu','nehate','khushbunehate@gmail.com','9925757548','123','active'),
(5,'darshile','nehate','darshilnehate@gmail.com','1236589564','darshil','active');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `fid` int(20) NOT NULL AUTO_INCREMENT,
  `cid` int(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `star` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `feedback` */

insert  into `feedback`(`fid`,`cid`,`email`,`remark`,`star`) values 
(3,4,'khushbunehate@gmail.com','nice','4');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productid` int(30) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `content` varchar(90) DEFAULT NULL,
  `mdate` varchar(30) DEFAULT NULL,
  `edate` varchar(30) DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `product` */

insert  into `product`(`productid`,`pname`,`cname`,`content`,`mdate`,`edate`,`price`,`image`) values 
(1,'paracetamol','zydus','caalpol','14/06/2023','14/06/2025','60','1.jpeg'),
(2,'caalpol','zydus','cold','2023-07-11','2024-01-31','80','2IMG.avif'),
(3,'Dolo','kedila','paracetamol','2023-05-17','2025-06-19','40','1.jpeg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
