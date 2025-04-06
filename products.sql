-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 03, 2025 lúc 06:26 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `gdu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ma` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL COMMENT 'Article Title',
  `mo_ta` text DEFAULT NULL COMMENT 'Article Summary',
  `noi_dung` longtext DEFAULT NULL COMMENT 'Article Content',
  `ngay_dang` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Published Date',
  `tac_gia` varchar(100) DEFAULT 'Admin' COMMENT 'Author',
  `luot_xem` int(11) DEFAULT 0 COMMENT 'View Count',
  `trang_thai` tinyint(1) DEFAULT 1 COMMENT 'Article Status',
  `hinh_anh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ma`, `ten`, `mo_ta`, `noi_dung`, `ngay_dang`, `tac_gia`, `luot_xem`, `trang_thai`, `hinh_anh`) VALUES
(1, 'Phát triển công nghệ AI tại Việt Nam', 'Những tiến bộ mới nhất về AI và ứng dụng trong các doanh nghiệp Việt Nam', 'Chi tiết về sự phát triển của công nghệ AI tại Việt Nam và các ứng dụng trong nhiều lĩnh vực...', '2025-04-03 06:34:37', 'Nguyễn Văn A', 0, 1, NULL),
(2, 'Du lịch Đà Lạt mùa hoa dã quỳ', 'Khám phá vẻ đẹp của cao nguyên Đà Lạt trong mùa hoa dã quỳ nở rộ', 'Hướng dẫn chi tiết các địa điểm ngắm hoa dã quỳ đẹp nhất tại Đà Lạt...', '2025-04-03 06:34:37', 'Trần Thị B', 0, 1, NULL),
(3, 'Xu hướng công nghệ 2024', 'Những xu hướng công nghệ nổi bật và ảnh hưởng đến cuộc sống', 'Phân tích chi tiết về các xu hướng công nghệ mới như AI, IoT, Blockchain...', '2025-04-03 06:34:37', 'Lê Văn C', 0, 1, NULL),
(4, 'Ẩm thực đường phố Sài Gòn', 'Khám phá những món ăn đường phố độc đáo tại Sài Gòn', 'Giới thiệu các món ăn đường phố nổi tiếng và địa chỉ các quán ăn ngon...', '2025-04-03 06:34:37', 'Phạm Thị D', 0, 1, NULL),
(5, 'Bảo vệ môi trường xanh', 'Các giải pháp bảo vệ môi trường và phát triển bền vững', 'Thông tin về các dự án môi trường và cách mọi người có thể góp phần bảo vệ môi trường...', '2025-04-03 06:34:37', 'Hoàng Văn E', 0, 1, NULL),
(11, 'aaaaa', 'aaaaaaaaaaaa', 'aaaaaaaaaaaaaaax', '2025-04-03 10:14:05', 'aaa', 0, 1, '/uploads/1743675245783_Screenshot 2025-03-25 121047.png'),
(12, 'qqqqq', 'qqqqqqqq', 'qqqqq', '2025-04-03 10:37:33', 'qqq', 0, 1, '/uploads/1743676653453_Screenshot 2025-04-03 142413.png');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ma`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
