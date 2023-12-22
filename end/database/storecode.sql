-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 03, 2023 lúc 01:28 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `abcd`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `username`, `password`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Huawei'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Xiaomi'),
(5, 'LG'),
(6, 'Asus'),
(7, 'None');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(153, 78, '::1', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Mobile Phone'),
(2, 'Laptop'),
(3, 'Phone Accessories'),
(4, 'Headphone'),
(5, 'Camera'),
(6, 'TV'),
(7, 'Others');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `ref_id` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=canelled, 1= pending, 2 =  shipping, 3 =  delivered'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `ref_id`, `status`) VALUES
(2, 12, 0, 0, 'NSRjCycZR', 3),
(3, 12, 0, 0, 'JKFdjZjmUE', 3),
(4, 12, 0, 0, 'D3f171fGoA', 3),
(7, 12, 0, 0, 'GE9QUAdNfF', 1),
(8, 12, 0, 0, 'klTRYMrnkj', 1),
(9, 12, 0, 0, 'fRffUuGIi4', 1),
(10, 12, 0, 0, 'zD1rkb4OGJ', 1),
(11, 12, 0, 0, 'wjl0fPwep', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `prod_count`, `total_amt`) VALUES
(1, 12, 'Duy Phung', 'duyabc@gmail.com', 'Buoi,TayHo,ThuyKhue', 3, 77000),
(2, 12, 'Duy Phung', 'duyabc@gmail.com', 'ThuyKhue', 1, 5000),
(3, 12, 'Long', 'duyabc@gmail.com', 'ThuyKhue', 1, 5000),
(4, 12, 'Duy Phung', 'duyabc@gmail.com', 'ThuyKhue', 1, 40000),
(5, 12, 'Duy Phung', 'duyabc@gmail.com', 'ThuyKhue', 1, 35000),
(6, 12, 'Duy Phung', 'duyabc@gmail.com', 'ThuyKhue', 1, 32000),
(7, 12, 'Duy Phung', 'duyabc@gmail.com', 'ThuyKhue', 1, 650),
(8, 12, 'John', 'duyabc@gmail.com', 'ThuyKhue', 1, 1000),
(9, 12, 'TR', 'duyabc@gmail.com', 'ThuyKhue', 1, 1000),
(10, 12, 'Duy Phung', 'duyabc@gmail.com', 'ThuyKhue', 1, 30000),
(11, 12, 'CCC', 'duyabc@gmail.com', 'ThuyKhue', 1, 500);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(76, 3, 1, 1, 5000),
(77, 4, 8, 1, 40000),
(78, 5, 6, 1, 35000),
(79, 6, 4, 1, 32000),
(80, 7, 13, 1, 650),
(81, 8, 78, 1, 1000),
(82, 9, 78, 1, 1000),
(83, 10, 3, 1, 30000),
(84, 11, 2, 1, 500);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung galaxy s7 edge', 5000, 'Samsung galaxy s7 edge', 'product07.png', 'samsung mobile electronics'),
(2, 1, 3, 'iPhone XS Max', 500, 'iphone Xs max', '1672380622_600_600_600_XSMAX_6_1.jpg', 'iphone '),
(3, 1, 3, 'iPad air 2', 30000, 'ipad apple brand', 'da4371ffa192a115f922b1c0dff88193.png', 'apple ipad tablet'),
(4, 1, 3, 'iPhone 11 pro max', 4200, 'Apple iPhone ', '1672380460_iphone-11-pro-max-white.jpg', 'iphone apple'),
(5, 1, 3, 'iPad M1 Pro 2021', 10000, 'ipad', '1672380546_apple-ipad-pro-2021-11-inch-5g-chinh-hang-vn-a_zsyz-b8.jpg', 'ipad '),
(6, 2, 2, 'samsung Laptop r series', 35000, 'samsung Black combination Laptop', 'laptop_PNG5939.png', 'samsung laptop '),
(7, 2, 7, 'Laptop Pavillion', 50000, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion'),
(8, 1, 7, 'Sony', 40000, 'Sony Mobile', '530201353846AM_635_sony_xperia_z.png', 'sony mobile'),
(9, 6, 5, 'TV LG', 20000, 'LED TV', '1671988828_product156.png', 'led tv lg'),
(10, 7, 4, 'Micro 55SH', 3500, 'lorem ipsum', '1671988919_Shure 55SH Series II.jpg', 'Micro'),
(11, 1, 4, 'Xiaomi Note 11S 128GB', 2500, 'lorem ipsum', '1671989008_xiaomi-redmi-note-11s-128gb-didongviet.jpg', 'xiaomi'),
(12, 1, 2, 'Samsung Galaxy Note 3', 10000, '0', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galaxy Note 3 neo'),
(13, 4, 6, 'Laptop', 650, 'nbk', 'product01.png', 'Dell Laptop'),
(16, 1, 2, 'Samsung galaxy s7', 5000, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics'),
(17, 7, 7, 'sony Headphones', 3500, 'sony Headphones', 'product02.png', 'sony Headphones electronics gadgets'),
(18, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets'),
(19, 2, 7, 'HP i5 laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(20, 2, 7, 'HP i7 laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(21, 7, 7, 'sony note 6gb ram', 4500, 'sony note 6gb ram', 'product04.png', 'sony note 6gb'),
(22, 1, 4, 'MSV laptop 16gb ram NVIDEA Graphics', 5499, 'MSV laptop 16gb ram', 'product06.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(23, 2, 7, 'dell laptop 8gb ram intel integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop'),
(24, 7, 2, 'camera with 3D pixels', 2569, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(72, 4, 7, 'Sony WH1000-XM5', 280, 'lorem ipsum', '1671987346_product05.png', 'Sony'),
(78, 2, 7, 'Legion 5 Pro 2022 i7-12500H RTX3070 16GB', 1000, 'lorem ipsum', '1671986723_product10.png', 'Legion 5 Pro'),
(79, 5, 7, 'Security Camera HV', 400, 'lorem', '1671987570_camera-hikvision-9289-16323962-3569-7382-1661259124.jpg', 'Camera'),
(81, 1, 1, 'Huawei Honor 8', 170, 'lorem ipsum', '1671987734_product11.png', 'Honor 8'),
(82, 1, 2, 'Samsung Galaxy ZFold 4', 380, 'Lorem ipsum', '1671987959_product07.png', 'Zfold4'),
(83, 2, 7, 'Laptop HP Core i3 9100H GTX1060 RAM 8GB', 250, 'lorem ipsum', '1671988032_product01.png', 'laptop'),
(84, 1, 3, 'Iphone 14 Pro', 390, 'lorem ipsum', '1671988110_product15.png', 'iphone'),
(85, 1, 3, 'Iphone 13 Pro Max', 200, 'lorem ipsum', '1671988154_product16.png', 'iphone'),
(86, 2, 6, 'Asus ROG Strix Ryzen7-4800H GTX1650 RAM 8GB', 220, 'lorem ipsum', '1671988286_asus-rog-strix-scar-15-g533z-i7-ln2210w-1.jpg', 'asus'),
(87, 2, 7, 'MSI Katana GF66 i7-12500H RTX3070 8GB 16.5 Inch Full HD', 679, 'lorem ipsum', '1671988363_product06.png', 'msi'),
(88, 7, 3, 'Apple Tablets BETA Version', 89, 'lorem ipsum', '1671988452_product04.png', 'Apple'),
(89, 2, 7, 'Laptop HP Core i3 9100H GTX1060 RAM 8GB', 250, 'lorem ipsum', '1671988510_product01.png', 'laptop'),
(90, 4, 7, 'Bluetooth HeadPhone REMAX RB660-HB', 180, 'lorem ipsum', '1671988573_product05.png', 'remax'),
(91, 3, 7, 'Cool Phone Case', 20, 'lorem ipsum', '1671988714_s-l1600.jpg', 'phone'),
(92, 6, 5, 'LG UP7550 50inch 4K Smart TV', 99999, 'lorem ipsum', '1672048544_product465.png', 'LG');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Duy', 'Phung', 'duyabc@gmail.com', '123456', '9448121558', 'ThuyKhue', 'TayHo'),
(15, 'Bobby', 'John', 'long921@gmail.com', '123456', '536487276', 'Hanoi', 'Kimma'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'BinhDuong', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'no info', 'tommyteo'),
(22, 'love', 'u', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'noname', 'pls', 'hemanth@gmail.com', '123456', '9876543234', 'alabatrap', 'mck'),
(24, 'newuser', 'user', 'newuser@gmail.com', '123456', '9535688928', 'USA', 'London'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', '123456', '9535688928', 'Paris', 'Russian'),
(26, 'Tran', 'Dan', 'addd@gmail.com', '123456', '1248234902', 'VietNam', 'HaLoi');

--
-- Bẫy `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
