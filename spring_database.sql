-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 02, 2025 lúc 07:26 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `spring_database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(255) DEFAULT NULL,
  `authority` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('admin', 'ROLE_ADMIN'),
('admin', 'ROLE_MANAGER'),
('hung', 'ROLE_ADMIN'),
('hung', 'ROLE_MANAGER'),
('sanh', 'ROLE_USER'),
('truong', 'ROLE_MANAGER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name_of_company` varchar(255) NOT NULL,
  `full_postal_address` text NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name_of_company`, `full_postal_address`, `city`, `region`, `zip_code`, `country`, `address`) VALUES
(9, 'gia dinh', 'ss', 'hcm', 'binh duong', '011111', 'UK', NULL),
(10, 'gia dinh', 'ss', 'hcm', 'binh duong', '12233', 'Vietnam', NULL),
(11, 'gia dinh', 'ss', 'dS', 'ffffff', '011111', 'Vietnam', NULL),
(12, 'trong', 'bd', 'hcm', 'binh duong', '011111', 'Vietnam', NULL),
(13, 'gia dinh', 'ss', 'hcm', 'binh duong', '12345', 'USA', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `name_of_company` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `address`, `city`, `country`, `name_of_company`, `region`, `zip_code`) VALUES
(2, 'binh dinh', 'hcm', 'HaNoi', 'gia dinh', 'binh duong', 11111),
(3, 'binh dinh', 'hcm', 'HCM', 'gia dinh 123', 'miền nam', 12222),
(4, 'binh dinh', 'HN', 'HaNoi', 'gia dinh 123', 'miền bắc', 11111);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Leslie', 'Andrews', 'leslie@luv2code.com'),
(2, 'Emma', 'Baumgarten', 'emma@luv2code.com'),
(3, 'Avani', 'Gupta', 'avani@luv2code.com'),
(4, 'Yuri', 'Petrov', 'yuri@luv2code.com'),
(5, 'Juan', 'Vega', 'juan@luv2code.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` double DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0 CHECK (`stock_quantity` >= 0),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `sku`, `name`, `description`, `price`, `stock_quantity`, `image`) VALUES
(41, 'SKU001', 'sách tài chính', 'sách tài chính, nâng cao thu nhập', 13, 10, '/default/images/8c734a8f-9df8-4505-86dc-1fa04e05abea.jpg'),
(42, 'SKU002', 'Sách đầu tư', 'Sách hay, nâng cấp bản thân', 17, 3, '/default/images/5f01280e-2e79-4833-8714-d2ae38d045fa.jpg'),
(51, 'SKU003', 'Sách làm giàu', 'Mua sách là giàu', 12, 9, '/default/images/289f1e7a-4145-45ab-b20e-928021e0d91c.jpg'),
(52, 'SKU004', 'Sách tài chính 2', 'Tài chính luôn nằm trong tay', 30, 17, '/default/images/c6fc78a7-7242-490e-bc83-0b48ef22bc7b.jpg'),
(53, 'SKU005', 'Sách Kinh tế', 'Kinh tế vững mạnh', 20, 6, '/default/images/f6db94f4-a12c-42c8-9b40-398d00d41277.jpg'),
(54, 'SKU006', 'Sách làm giàu', 'Sách làm giàu siêu nhanh', 24, 5, '/default/images/22844b97-a78c-4f87-8b0f-4a00f9237553.jpg'),
(55, 'SKU007', 'Sách đầu tư 2', 'Đầu tư đúng chỗ, lợi nhuận x2', 22, 9, '/default/images/c946c5a9-306d-4e32-b677-8e6b5c59cdb9.jpg'),
(56, 'SKU008', 'Sách kĩ năng đầu tư', 'Kĩ năng quan trọng ', 12, 14, '/default/images/f408fcbc-181b-4e80-af5b-e2d47e06e60f.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`) VALUES
(12, 'Truong', 'Tran', 'truongtran@gmail.com'),
(14, 'Vu', 'Hoang\r\n', 'vuhoang@gmail.com'),
(20, 'Quynh', 'Lan', 'quynhlan@gmail.com'),
(21, 'Bao', 'Khoa', 'baokhoa@gmail.com'),
(22, 'abc', 'aaa', 'abc@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('admin', '{bcrypt}$2a$10$2qd17sVPvPDVaZ/ggCeeI.sfx7iE9TkyJ/rOhtJ365WMeM8L47LIa', b'1'),
('hung', '{bcrypt}$2a$12$oM2ObAzqG4CLFsNWDCeygubOxN3vnZ.7cBu2esQwekcM8Oy9KvXqO', b'1'),
('sanh', '{bcrypt}$2a$10$Cr4NKKEoAJ04E7r2.77R2O5pRj9/J1LM68yt3x/9vTZegXb/38hQi', b'1'),
('truong', '{bcrypt}$2a$10$vYIKRo9xMSxFmAk4N8sE2Ov96ReSTb/7CtF9KdsEdZ6f7lsv9RtB2', b'1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `authorities_idx_1` (`username`,`authority`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
