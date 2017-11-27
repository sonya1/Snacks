/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 6.0.2-alpha-community-nt-debug : Database - snacks
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`snacks` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `snacks`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `gid` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`id`,`date`,`uid`,`gid`,`count`,`price`) values (1,'2015-03-08',3,7,2,42),(2,'2015-03-08',3,8,1,45),(3,'2015-03-08',3,8,1,45),(4,'2016-03-08',3,9,0,0);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `total` int(10) DEFAULT '1000',
  `sales` int(10) DEFAULT '0',
  `tid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`picture`,`price`,`details`,`total`,`sales`,`tid`) values (7,'蜜兰诺松塔192g×15盒','/images/2389717219978614176g1.png',21,'香蕉奶风味有一定基础，深受年轻人和儿童的喜爱， 是一种健康天然的精致饮品。 香蕉奶的竞争品牌不多，独特口感、多种 规格、营养丰富称为我们有第一助推品项的有事，扩大消费者对香蕉奶的 喜爱是我们的推广方向。',1000,0,6),(8,'台阳生机达人樱花虾味花生1kg×3包','/images/8617273853916073968g2.png',45,'美味的大花生哦',1000,0,2),(9,'台阳生机达人盐烧海苔花生1kg×3包','/images/-4919700763851489840g5.jpg',20,'商品编号：06020314条形码：47161718212331市场单价： ? 4.00零食网零售价： ? 3.20市场箱价： ? 258.00',1000,17,1),(10,'傻二哥小酒花生超爽麻辣味1kg×7.50包','/images/538798453319219680g4.jpg',23,'傻二哥小酒花生超爽麻辣味1kg×7.50包爽歪歪的感觉',1000,0,1),(11,'小老板紫菜辣味盒装36g×12盒','/images/-5796834901795894688g6.png',100,'刷拉拉哦来来',1000,0,1);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`date`) values (5,'坚果炒货','坚果炒货今日减价！','2015-03-07'),(6,'打折喽','所有零食5折起哈！','2015-03-07');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  `gid` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`date`,`uid`,`gid`,`count`,`price`) values (7,'2015-03-08',3,9,3,60),(8,'2015-03-08',3,9,5,100),(11,'2015-03-08',3,9,3,60),(12,'2015-03-09',3,9,2,40),(13,'2015-03-09',3,9,2,40),(16,'2015-03-09',3,9,2,40),(17,'2015-08-12',3,8,0,0);

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `type` */

insert  into `type`(`id`,`name`) values (1,'坚果炒货'),(2,'肉类制品'),(3,'海味零食'),(4,'膨化零食'),(5,'饮品冲剂'),(6,'饼干糕点');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`type`) values (1,'admin','admin',1),(3,'1','1',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
