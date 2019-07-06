-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Jul 2019 um 11:26
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_matthias_bruckbeck_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `cars_id` int(11) NOT NULL,
  `cars_model` varchar(10) NOT NULL,
  `cars_seats` int(11) NOT NULL,
  `cars_horsepower` int(11) NOT NULL,
  `cars_price` float(7,2) DEFAULT NULL,
  `man_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`cars_id`, `cars_model`, `cars_seats`, `cars_horsepower`, `cars_price`, `man_nr`) VALUES
(1, 'Audi A4', 5, 90, 20000.00, 1),
(2, 'BMW X1', 5, 140, 25000.00, 2),
(3, 'VW Touran', 7, 120, 15000.00, 3),
(4, 'Toyota mr2', 2, 95, 18000.00, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_firstName` varchar(12) NOT NULL,
  `cust_lastName` varchar(15) NOT NULL,
  `cust_gender` enum('Male','Female') DEFAULT NULL,
  `cust_phone` int(11) NOT NULL,
  `cust_mail` varchar(20) NOT NULL,
  `cust_birth` date NOT NULL,
  `license` enum('Yes','No') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_firstName`, `cust_lastName`, `cust_gender`, `cust_phone`, `cust_mail`, `cust_birth`, `license`) VALUES
(1, 'Thomas', 'Berg', 'Male', 680123456, 'thomas@berg.com', '1995-12-12', 'Yes'),
(2, 'Bettina', 'Tal', 'Female', 680121236, 'bett@tal.com', '1995-02-02', 'Yes'),
(3, 'Gerald', 'Feld', 'Male', 660121456, 'gfer@fe.com', '2001-06-28', 'No'),
(4, 'Ben', 'Bensen', 'Male', 66012456, 'be@be.com', '1999-10-01', 'No');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `emp_firstName` varchar(12) NOT NULL,
  `emp_lastName` varchar(15) NOT NULL,
  `emp_gender` enum('Male','Female') DEFAULT NULL,
  `emp_phone` int(11) NOT NULL,
  `emp_mail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`emp_id`, `emp_firstName`, `emp_lastName`, `emp_gender`, `emp_phone`, `emp_mail`) VALUES
(1, 'Leo', 'AB', 'Male', 123456789, 'leo@leo.com'),
(2, 'Susi', 'XY', 'Female', 987987654, 'sus@susi.com'),
(3, 'Lisa', 'AXB', 'Female', 123123321, 'lis@lisa.com'),
(4, 'Fred', 'GHJ', 'Male', 1234578, 'Fred@fred.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `garage`
--

CREATE TABLE `garage` (
  `garage_nr` int(11) NOT NULL,
  `garage_status` enum('Repaired','in Progress') NOT NULL,
  `garage_cost` float(5,2) NOT NULL,
  `rental_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `garage`
--

INSERT INTO `garage` (`garage_nr`, `garage_status`, `garage_cost`, `rental_id`) VALUES
(1, 'in Progress', 350.00, 3),
(2, 'Repaired', 600.00, 7),
(3, 'in Progress', 999.99, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `ins_id` int(11) NOT NULL,
  `ins_type` enum('Liability coverage','Collision insurance','Comprehensive insurance') NOT NULL,
  `ins_price` float(4,2) NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `insurance`
--

INSERT INTO `insurance` (`ins_id`, `ins_type`, `ins_price`, `rental_id`, `cust_id`) VALUES
(1, 'Liability coverage', 30.99, 4, 3),
(2, 'Collision insurance', 12.99, 6, 1),
(3, 'Comprehensive insurance', 89.99, 9, 4),
(4, 'Liability coverage', 56.15, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `loc_nr` int(11) NOT NULL,
  `postcode` int(11) NOT NULL,
  `address` varchar(20) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `shop_nr` int(11) DEFAULT NULL,
  `man_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`loc_nr`, `postcode`, `address`, `city`, `country`, `cust_id`, `shop_nr`, `man_nr`) VALUES
(1, 2015, 'Main Street 12', 'Vienna', 'Austria', 1, NULL, NULL),
(2, 7302, 'Clown Street 35', 'Berlin', 'Germany', NULL, 2, NULL),
(3, 1234, 'Dog Street 01', 'Amsterdam', 'Netherland', NULL, NULL, 1),
(4, 4521, 'Hauptplatz 05', 'Graz', 'Austria', NULL, 1, NULL),
(5, 2036, 'Bahnstraße 36', 'Klagenfurt', 'Austria', 3, NULL, NULL),
(6, 3804, 'Main Street 02', 'Munich', 'Germany', NULL, NULL, 2),
(7, 8216, 'Second Street 35', 'Berlin', 'Germany', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturer`
--

CREATE TABLE `manufacturer` (
  `man_nr` int(11) NOT NULL,
  `man_name` varchar(10) NOT NULL,
  `delivery_time` datetime NOT NULL,
  `cars_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `manufacturer`
--

INSERT INTO `manufacturer` (`man_nr`, `man_name`, `delivery_time`, `cars_id`) VALUES
(1, 'Audi', '2019-07-19 11:00:00', 1),
(2, 'BMW', '2019-07-16 14:15:00', 2),
(3, 'VW', '2019-07-29 20:35:00', 3),
(4, 'Toyota', '2019-08-30 07:30:00', 4),
(5, 'Ferrari', '2019-09-30 15:37:00', NULL),
(6, 'Skoda', '2019-11-19 19:29:00', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rental_car`
--

CREATE TABLE `rental_car` (
  `rental_id` int(11) NOT NULL,
  `rental_status` enum('Available','Unavailable') NOT NULL,
  `rental_seats` int(11) NOT NULL,
  `rental_model` varchar(10) NOT NULL,
  `rental_horsepower` int(11) NOT NULL,
  `rental_price_perDay` float(5,2) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `rental_car`
--

INSERT INTO `rental_car` (`rental_id`, `rental_status`, `rental_seats`, `rental_model`, `rental_horsepower`, `rental_price_perDay`, `cust_id`, `emp_id`, `from_date`, `to_date`) VALUES
(1, 'Available', 5, 'Audi A4', 90, 89.99, NULL, 2, '2019-07-11', '2019-07-14'),
(2, 'Available', 5, 'Audi A4', 90, 89.99, 2, 2, '2019-07-01', '2019-07-08'),
(3, 'Unavailable', 5, 'BMW X1', 140, 85.99, NULL, 1, '2019-07-19', '2019-07-21'),
(4, 'Available', 5, 'BMW X1', 140, 85.99, 3, 1, '2019-07-01', '2019-07-13'),
(5, 'Available', 7, 'VW Touran', 120, 71.00, NULL, 4, '2019-07-01', '2019-07-31'),
(6, 'Available', 7, 'VW Touran', 120, 71.00, 1, 4, '2019-07-01', '2019-07-01'),
(7, 'Unavailable', 7, 'VW Touran', 120, 71.00, NULL, 4, '2019-07-23', '2019-07-29'),
(8, 'Unavailable', 2, 'Toyota mr2', 95, 80.99, NULL, 3, '2019-07-30', '2019-08-01'),
(9, 'Available', 2, 'Toyota mr2', 95, 80.99, 4, 3, '2019-08-28', '2019-08-31'),
(10, 'Available', 2, 'Toyota mr2', 95, 80.99, NULL, 3, '2019-12-31', '2019-12-31');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `salary`
--

CREATE TABLE `salary` (
  `emp_id` int(11) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `salary`
--

INSERT INTO `salary` (`emp_id`, `salary`) VALUES
(1, 2500),
(2, 2600),
(3, 1800),
(4, 2000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shop`
--

CREATE TABLE `shop` (
  `shop_nr` int(11) NOT NULL,
  `shop_phone` int(11) NOT NULL,
  `shop_email` varchar(20) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `cars_id` int(11) DEFAULT NULL,
  `shop_name` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `shop`
--

INSERT INTO `shop` (`shop_nr`, `shop_phone`, `shop_email`, `opening_time`, `closing_time`, `rental_id`, `cars_id`, `shop_name`) VALUES
(1, 12345678, 'firstshop@first.com', '08:00:00', '17:00:00', 1, 1, 'First Shop'),
(2, 123321456, 'secondshop@second.co', '00:00:00', '23:59:00', 3, 2, 'Second Shop'),
(3, 1478523, 'thirdshop@third.com', '06:00:00', '14:00:00', 5, 3, 'Third Shop');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`cars_id`),
  ADD KEY `man_nr` (`man_nr`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indizes für die Tabelle `garage`
--
ALTER TABLE `garage`
  ADD PRIMARY KEY (`garage_nr`),
  ADD KEY `rental_id` (`rental_id`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`ins_id`),
  ADD KEY `rental_id` (`rental_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`loc_nr`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `shop_nr` (`shop_nr`),
  ADD KEY `man_nr` (`man_nr`);

--
-- Indizes für die Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`man_nr`),
  ADD KEY `cars_id` (`cars_id`);

--
-- Indizes für die Tabelle `rental_car`
--
ALTER TABLE `rental_car`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indizes für die Tabelle `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indizes für die Tabelle `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shop_nr`),
  ADD KEY `rental_id` (`rental_id`),
  ADD KEY `cars_id` (`cars_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cars`
--
ALTER TABLE `cars`
  MODIFY `cars_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `garage`
--
ALTER TABLE `garage`
  MODIFY `garage_nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `insurance`
--
ALTER TABLE `insurance`
  MODIFY `ins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `loc_nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `man_nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `rental_car`
--
ALTER TABLE `rental_car`
  MODIFY `rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `shop`
--
ALTER TABLE `shop`
  MODIFY `shop_nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`man_nr`) REFERENCES `manufacturer` (`man_nr`);

--
-- Constraints der Tabelle `garage`
--
ALTER TABLE `garage`
  ADD CONSTRAINT `garage_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rental_car` (`rental_id`);

--
-- Constraints der Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rental_car` (`rental_id`),
  ADD CONSTRAINT `insurance_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`shop_nr`) REFERENCES `shop` (`shop_nr`),
  ADD CONSTRAINT `location_ibfk_3` FOREIGN KEY (`man_nr`) REFERENCES `manufacturer` (`man_nr`);

--
-- Constraints der Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD CONSTRAINT `manufacturer_ibfk_1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`cars_id`);

--
-- Constraints der Tabelle `rental_car`
--
ALTER TABLE `rental_car`
  ADD CONSTRAINT `rental_car_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `rental_car_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`);

--
-- Constraints der Tabelle `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`);

--
-- Constraints der Tabelle `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rental_car` (`rental_id`),
  ADD CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`cars_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
