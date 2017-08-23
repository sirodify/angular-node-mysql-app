# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: mymm
# Generation Time: 2017-07-19 04:41:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`id`, `name`, `description`, `createdAt`, `updatedAt`)
VALUES
	(1,'Daniel Wellington','Contemporary Watches','2017-07-17 03:56:34','2017-07-17 03:56:34'),
	(2,'Nudie Jeans','Jeanswear from Sweden','2017-07-17 03:56:34','2017-07-17 03:56:34'),
	(3,'Furla','Furla - Italian leather bags and shoes brand','2017-07-17 03:56:34','2017-07-17 03:56:34'),
	(4,'Karen Walker','Fashion and eyewear brand owned by the NZ born designer','2017-07-17 03:56:34','2017-07-17 03:56:34');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `colour` varchar(255) NOT NULL,
  `dateCreated` date NOT NULL,
  `availabilityStatus` enum('In Stock','Out of Stock','Archived') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `brandId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `productName`, `description`, `price`, `colour`, `dateCreated`, `availabilityStatus`, `createdAt`, `updatedAt`, `brandId`)
VALUES
	(1,'ONE STAR','Karen Walker Sunglasses SS17',1843.00,'white','2017-07-11','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(2,'Helter Skelter','Karen Walker Sunglasses SS17',1706.00,'tortoiseshell','2017-02-12','Out of Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(3,'SUPER WORSHIP','Karen Walker Sunglasses AW17',1911.00,'black','2017-07-10','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(4,'SUPER LUNAR','Karen Walker Sunglasses AW17',1984.00,'orange','2017-07-10','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(5,'Helter Skelter','Karen Walker Sunglasses SS17',1706.00,'pink','2017-02-12','Out of Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(6,'LOVE HANGOVER','Karen Walker Sunglasses AW17',1706.00,'golden','2017-07-14','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(7,'ONE ORBIT','Karen Walker Sunglasses AW17',2048.00,'grey','2017-07-15','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(8,'STAR SAILOR','Karen Walker Sunglasses AW17',2218.00,'golden','2017-07-15','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(9,'ONE ASTRONAUT','Karen Walker Sunglasses AW17',2150.00,'beige','2017-07-17','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(10,'MAQUES','Karen Walker Sunglasses AW17',1502.00,'tortoiseshell','2017-07-17','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',4),
	(11,'METROPOLIS','FURLA AW17',1912.00,'beige','2017-06-29','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',3),
	(12,'LUCKY','FURLA AW17',2933.00,'black','2017-07-02','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',3),
	(13,'CANDY LILLA SWEETIE','FURLA SS17',1953.00,'blue','2017-03-23','Out of Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',3),
	(14,'CANDY SWEETIE','FURLA SS17',1590.00,'pink','2017-03-23','Out of Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',3),
	(15,'STACY','FURLA AW17',2960.00,'beige','2017-07-02','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',3),
	(16,'CAPRICCIO','FURLA SS17',3143.00,'yellow','2017-03-19','Out of Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',3),
	(17,'AMAZZONE','FURLA SS17',2513.00,'black','2017-01-05','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',3),
	(18,'Classic Black Durham 40mm - Rose Gold','DW 2017',1490.00,'black','2017-05-05','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',1),
	(19,'Classy York 26mm - Rose Gold','DW 2017',1090.00,'white','2017-05-05','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',1),
	(20,'Classic Black Bristol 36mm - Silver','DW 2017',1380.00,'silver','2017-05-05','Out of Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',1),
	(21,'Classic Black Reading 40mm - Silver','DW 2017',1490.00,'silver','2017-03-19','Archived','2017-07-17 03:56:34','2017-07-17 03:56:34',1),
	(22,'Classic Petite Sterling 32mm - White','DW 2017',1290.00,'white','2017-07-03','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',1),
	(23,'Classic Winchester 36mm - Rose Gold','DW 2017',1250.00,'gold','2017-06-14','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',1),
	(24,'FINN Slim Fit','Nudie Jeans - Slim Fit',976.00,'blue','2017-07-12','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',2),
	(25,'RONNY CRISPY OCEAN Jacket','Nudie Jeans - Denim Jacket',1699.00,'blue','2017-07-13','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',2),
	(26,'Thin Finn','Nudie Jeans - Slim Fit',1129.00,'blue','2017-05-26','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',2),
	(27,'GRIM TIM','Nudie Jeans - Slim Fit',1563.00,'blue','2017-02-18','Out of Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',2),
	(28,'Tape Red','Nudie Jeans - Bootcut Fit',1222.00,'blue','2017-03-02','In Stock','2017-07-17 03:56:34','2017-07-17 03:56:34',2);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;

INSERT INTO `reviews` (`id`, `comment`, `rating`, `createdAt`, `updatedAt`, `productId`, `userId`)
VALUES
	(1,'These sunglasses are great for all occassions.',8,'2017-07-17 03:56:34','2017-07-17 03:56:34',2,1),
	(2,'Nudie never fails my expectation, great fit.',7,'2017-07-17 03:56:34','2017-07-17 03:56:34',24,3),
	(3,'Sunglasses don\'t look good.',4,'2017-07-17 10:06:10','2017-07-17 03:56:34',1,3),
	(4,'These are perfect for summer.',9,'2017-07-17 19:11:07','2017-07-17 19:11:07',1,1),
	(5,'Excellent quality sunglasses',10,'2017-07-18 08:18:35','2017-07-18 08:18:35',1,3),
	(6,'Excellent quality sunglasses',10,'2017-07-18 08:59:51','2017-07-18 08:59:51',2,1),
	(7,'Love these sunglasses',10,'2017-07-18 09:07:51','2017-07-18 09:07:51',2,3),
	(18,'Great product, highly recommend.',10,'2017-07-18 21:16:19','2017-07-18 21:16:19',9,1),
	(19,'Great product',8,'2017-07-18 21:17:43','2017-07-18 21:17:43',9,1),
	(20,'Highly recommended.',10,'2017-07-18 21:19:09','2017-07-18 21:19:09',9,1),
	(21,'Stylish sunglasses!',7,'2017-07-18 21:42:53','2017-07-18 21:42:53',10,1);

/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` enum('Customer','Merchant') NOT NULL,
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `userType`, `userName`, `email`, `dateOfBirth`, `createdAt`, `updatedAt`)
VALUES
	(1,'Customer','Jane Doe','j.doe@gmail.com','1988-01-01','2017-07-17 03:56:34','2017-07-17 03:56:34'),
	(2,'Merchant','Joe Bloggs','joebloggs@gmail.com','1975-09-09','2017-07-17 03:56:34','2017-07-17 03:56:34'),
	(3,'Customer','Victor Lara','vicl@gmail.com','1985-07-22','2017-07-17 03:56:34','2017-07-17 03:56:34');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
