-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `iii`
--

DELIMITER $$
--
-- 程序
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ptest1` ()  begin
    select * from customers;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ptest2` (IN `kw` INT(100), IN `kw2` VARCHAR(100))  begin
    insert into orders  (oid,cphone) values ( kw,kw2);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ptest3` (IN `kw` VARCHAR(100))  begin
    select * from customers where cphone=kw;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ptest4` (IN `kw` VARCHAR(100))  begin
    select c.id , c.cname,c.cphone , c.email, c.address , o.oid from customers c join orders o where c.cphone=o.cphone having c.cphone = kw;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `customers`
--

CREATE TABLE `customers` (
  `id` int(10) NOT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `cphone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `customers`
--

INSERT INTO `customers` (`id`, `cname`, `cphone`, `email`, `address`) VALUES
(1, '?', '04-12345678', 'eric211924@gmail.com', '?????'),
(2, 'eric', '04-12345679', 'eric211924@gmail.com', 'Nantun Dist');

-- --------------------------------------------------------

--
-- 資料表結構 `order details`
--

CREATE TABLE `order details` (
  `id` int(10) NOT NULL,
  `oid` int(10) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `realPrice` int(10) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `oid` int(10) DEFAULT NULL,
  `cphone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`id`, `oid`, `cphone`) VALUES
(2, 2, '04-12345679'),
(3, 3, '04-12345679'),
(4, 5, '04-12345678');

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `unitPrice` float DEFAULT NULL,
  `sphone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `sphone` varchar(20) DEFAULT NULL,
  `saddress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cphone` (`cphone`);

--
-- 資料表索引 `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oid` (`oid`),
  ADD KEY `pid` (`pid`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oid` (`oid`),
  ADD KEY `cphone` (`cphone`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD KEY `sphone` (`sphone`);

--
-- 資料表索引 `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sphone` (`sphone`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order details`
--
ALTER TABLE `order details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `order details_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  ADD CONSTRAINT `order details_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`);

--
-- 資料表的限制式 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cphone`) REFERENCES `customers` (`cphone`);

--
-- 資料表的限制式 `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sphone`) REFERENCES `suppliers` (`sphone`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
