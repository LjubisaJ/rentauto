

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '$2y$10$XAhAkiWCstisU0b8Kku/4ua5ANdpFgKhVKPnHqco5lsjeltcUDIdi', '2019-09-01 14:22:50');
/* sifra admin */



CREATE TABLE IF NOT EXISTS `tblbooking` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



INSERT INTO `tblbooking` (`id`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`) VALUES
(1, 'vladica@gmail.com', 2, '22/06/2019', '25/06/2019', 'text', 1, '2019-06-19 20:15:43'),
(2, 'stefan@gmail.com', 3, '30/06/2019', '02/07/2019', 'text', 2, '2019-06-26 20:15:43'),
(3, 'john@gmail.com', 4, '02/07/2019', '07/07/2019', 'text', 0, '2019-06-26 21:10:06');



CREATE TABLE IF NOT EXISTS `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;



INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Honda', '2019-08-18 16:24:34', '2019-08-19 06:42:23'),
(2, 'BMW', '2019-08-18 16:24:50', '2019-08-19 06:42:23'),
(3, 'Audi', '2019-08-18 16:25:03', '2019-08-19 08:42:23'),
(4, 'Nissan', '2019-08-18 16:25:13', '2019-08-19 06:42:23'),
(5, 'Toyota', '2019-08-18 16:25:24', '2019-08-19 08:42:23'),
(6, 'Mercedes', '2019-08-19 06:22:13', '2019-08-19 06:42:23');



CREATE TABLE IF NOT EXISTS `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Sremska 19, 18000 Nis', 'rentauto@gmail.com', '0653326559');


CREATE TABLE IF NOT EXISTS `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Vladica Stankovic', 'vladica@gmail.com', '0653232654', '', '2019-08-18 10:03:07', 1),
(2, 'Ljubisa Jovcic', 'ljubisa@gmail.com', '0603232600', '', '2019-08-25 12:10:07', 1);



CREATE TABLE IF NOT EXISTS `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(1, 'Srdjan Stevanovic', 'srdjan@gmail.com', 'c4f0efaf80d39fe476f4f5c141e47489', '0653221478', '03/07/1985', 'Djordja Krstica 20', 'Beograd', 'Srbija', '2019-06-17 19:59:27', '2019-06-26 21:02:58'),
(2, 'Aleksandar Stosic', 'aleks@gmail.com', '78a9fb9298e6b7a50b8f99dd0d46feda', '0613666478', '12/12/1991', 'Generala Boze Jankovica 45', 'Nis', 'Srbija', '2019-06-17 20:00:49', '2019-06-26 21:03:09'),
(3, 'Milos Jovanovic', 'milos5@gmail.com', 'b82753180960205a4a62feff9c0f93f5', '0653222278', '03/02/1990', 'Nade Tomic 22', 'Nis', 'Srbija', '2019-06-17 20:01:43', '2019-06-17 21:07:41'),
(4, 'Sladjan Jovcic', 'sladjan@gmail.com', '518a4bcb93f859e8b7ea0691573e7acf', '0653221000', '02/05/1989', 'Primorska 102', 'Nis', 'Srbija', '2019-06-17 20:03:36', '2019-06-26 19:18:14');
/* srdjan - srdjan123
	aleks - aleksandar123
	milos - milos123
	sladjan - sladjan123
 */


CREATE TABLE IF NOT EXISTS `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(1, 'A4', 3, 'Audi', 18400, 'Benzin', 2016, 5, 'audi1.jpg', 'audi2.jpg', 'audi3.jpg', 'audi4.jpg', 'audi5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2019-06-19 11:46:23', '2019-06-20 18:38:13'),
(2, '320d', 2, 'BMW', 4800, 'Dizel', 2015, 5, 'bmw1.jpg', 'bmw2.jpg', 'bmw3.jpg', 'bmw4.jpg', 'bmw5.jpg', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, NULL, '2019-06-19 16:16:17', '2019-06-21 16:57:11'),
(3, 'M5', 2, 'BMW', 6900, 'Dizel', 2012, 5, 'm5m1.jpg', 'm5m2.jpg', 'm5m3.jpg', 'm5m4.jpg', 'm5m5.jpg', 1, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, NULL, NULL, '2019-06-19 16:18:20', '2019-06-20 18:40:11'),
(4, 'S350', 6, 'Mercedes', 15000, 'Dizel', 2017, 5, 'mecka1.jpg', 'mecka2.jpg', 'mecka3.jpg', 'mecka4.jpg', 'mecka5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, '2019-06-19 16:18:43', '2019-06-20 18:44:12'),
(5, 'Qashqai', 4, 'Nissan', 9235, 'Dizel', 2017, 5, 'nisan1.jpg', 'nisan2.jpg', 'nisan3.jpg', 'nisan4.jpg', 'nisan5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2019-06-20 17:57:09', '2019-06-21 16:56:43'),
(6, 'Avenisis', 5, 'Toyota', 5800, 'Benzin', 2012, 5, 'avensis1.jpg', 'avensis2.jpg', 'avensis3.jpg', 'avensis4.jpg', 'avensis5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2019-06-19 11:46:23', '2019-06-20 18:38:13'),
(7, 'Corola', 5, 'Toyota', 4800, 'Plin', 2014, 5, 'corola1.jpg', 'corola2.jpg', 'corola3.jpg', 'corola4.jpg', 'corola5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2019-06-19 11:46:23', '2019-06-20 18:38:13');




ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;


ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;


ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;


ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;


ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;


ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;


ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;

ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;

