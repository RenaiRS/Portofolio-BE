-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Des 2024 pada 16.06
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_web`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `laptop`
--

CREATE TABLE `laptop` (
  `id` int(11) NOT NULL,
  `model_name` varchar(255) NOT NULL,
  `battery_capacity` int(11) NOT NULL,
  `pixel_density` int(11) NOT NULL,
  `ram_size` int(11) NOT NULL,
  `resolution` varchar(50) NOT NULL,
  `cpu_speed` varchar(255) NOT NULL,
  `screen_size` decimal(3,1) NOT NULL,
  `storage_size` int(11) NOT NULL,
  `bluetooth_version` varchar(50) NOT NULL,
  `brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laptop`
--

INSERT INTO `laptop` (`id`, `model_name`, `battery_capacity`, `pixel_density`, `ram_size`, `resolution`, `cpu_speed`, `screen_size`, `storage_size`, `bluetooth_version`, `brand`) VALUES
(1, 'Dell Alienware m15 R7 (2022) 15.6\"', 16946, 168, 64, '2560 x 1440 px', '6 x 2.3 GHz & 8 x 1.7 GHz', 15.6, 2048, 'Bluetooth Version 5.2', 'Dell'),
(2, 'Dell G15 5530 (2023) 15.6\"', 10161, 168, 32, '1920 x 1080 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 15.6, 1024, 'Bluetooth Version 5.2', 'Dell'),
(3, 'Dell G16 7630 (2023) 16\"', 10268, 168, 32, '2560 x 1600 px', '6 x 2.6 GHz & 8 x 1.9 GHz', 16.0, 1024, 'Bluetooth Version 5.2', 'Dell'),
(4, 'Dell Alienware Area-51m R2 17.3\"', 13737, 168, 64, '3840 x 2160 px', '10 x 3.7 GHz', 17.3, 256, 'Bluetooth Version 5.1', 'Dell'),
(5, 'Dell G15 5530 (2023) 15.6\"', 10161, 168, 16, '1920 x 1080 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 15.6, 1024, 'Bluetooth Version 5.2', 'Dell'),
(6, 'Dell Alienware m18 R2 18\"', 8738, 168, 64, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 18.0, 4096, 'Bluetooth Version 5.4', 'Dell'),
(7, 'Dell Alienware M18 18\"', 15072, 168, 64, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 18.0, 4096, 'Bluetooth Version 5.2', 'Dell'),
(8, 'Dell Alienware m17 R5 17.3\"', 6838, 168, 64, '1920 x 1080 px', '8 x 3.3 GHz', 17.3, 1000, 'Bluetooth Version 5.2', 'Dell'),
(9, 'Dell Alienware X16 16\"', 16946, 32, 64, '2560 x 1600 px', '6 x 2.6 GHz & 8 x 1.9 GHz', 16.0, 1024, 'Bluetooth Version 5.2', 'Dell'),
(10, 'Dell Alienware m17 R5 17.3\"', 6838, 32, 64, '1920 x 1080 px', '8 x 3.2 GHz', 17.3, 512, 'Bluetooth Version 5.2', 'Dell'),
(11, 'Lenovo ThinkPad X1 Extreme 16\" WQUXGA', 8108, 251, 64, '3840 x 2400 px', '6 x 2.5 GHz & 8 x 1.8 GHz', 16.0, 8192, 'Bluetooth Version 5.2', 'Lenovo'),
(12, 'Lenovo Legion 9i Gen 9 16\"', 9000, 235, 64, '3200 x 2000 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 2048, 'Bluetooth Version 5.1', 'Lenovo'),
(13, 'Lenovo Legion 9 Gen 14 (2024) 16\"', 9000, 235, 64, '3200 x 2000 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 2048, 'Bluetooth Version 5.1', 'Lenovo'),
(14, 'Lenovo Legion 7i Gen 14 (2024) 16\"', 9000, 188, 32, '3200 x 2000 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 1024, 'Bluetooth Version 5.2', 'Lenovo'),
(15, 'Lenovo Legion 5 Pro Gen 14 (2024) 16\"', 7207, 188, 32, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 1024, 'Bluetooth Version 5.2', 'Lenovo'),
(16, 'Lenovo ThinkPad X1 Yoga Gen 6 14\"', 5135, 323, 16, '3840 x 2400 px', '4 x 3 GHz', 14.0, 1000, 'Bluetooth Version 5.1', 'Lenovo'),
(17, 'Lenovo ThinkPad P16v Gen 1 16\"', 8108, 141, 64, '1920 x 1200 px', '8 x 3.8 GHz', 16.0, 1024, 'Bluetooth Version 5.1', 'Lenovo'),
(18, 'Lenovo ThinkPad X1 Carbon Gen 10 14\"', 5135, 188, 16, '2240 x 1800 px', '4 x 1.7 GHz & 8 x 1.2 GHz', 14.0, 1024, 'Bluetooth Version 5.2', 'Lenovo'),
(19, 'Lenovo ThinkBook Plus Gen 3 17\"', 6216, 196, 32, '3072 x 1440 px', '6 x 2.3 GHz & 8 x 1.7 GHz', 17.0, 512, 'Bluetooth Version 5.1', 'Lenovo'),
(20, 'Lenovo Legion Pro 5 (2023) 16\"', 7207, 188, 32, '2560 x 1600 px', '8 x 3.6 GHz', 16.0, 512, 'Bluetooth Version 5.1', 'Lenovo'),
(21, 'Asus Zenbook Pro 16X OLED UX7602BZ 16\"', 8649, 235, 32, '3200 x 2000 px', '6 x 2.6 GHz & 8 x 1.9 GHz', 16.0, 2048, 'Bluetooth Version 5.3', 'Asus'),
(22, 'Asus ROG Strix Scar 18 (2024) 18\"', 8108, 167, 64, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 18.0, 2048, 'Bluetooth Version 5.3', 'Asus'),
(23, 'Asus ROG Strix Scar 16 (2024) 16\"', 8108, 188, 64, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 2048, 'Bluetooth Version 5.3', 'Asus'),
(24, 'Asus ProArt StudioBook Pro 16', 8108, 235, 64, '3200 x 2000 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 2048, 'Bluetooth Version 5.3', 'Asus'),
(25, 'Asus ROG Strix G18 (2023) 18\"', 8108, 167, 96, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 18.0, 16384, 'Bluetooth Version 5.3', 'Asus'),
(26, 'Asus ROG Zephyrus Duo 16 (2023) 16\"', 8108, 188, 64, '2560 x 1600 px', '16 x 2.5 GHz', 16.0, 2048, 'Bluetooth Version 5.3', 'Asus'),
(27, 'Asus ROG Zephyrus M16 (2023) 16\"', 8108, 188, 64, '2560 x 1600 px', '6 x 2.6 GHz & 8 x 1.9 GHz', 16.0, 2048, 'Bluetooth Version 5.3', 'Asus'),
(28, 'Asus ROG Strix G17 (2023) 17.3\"', 5675, 169, 32, '2560 x 1440 px', '16 x 2.5 GHz', 17.3, 2048, 'Bluetooth Version 5.3', 'Asus'),
(29, 'Asus ROG Strix G16 (2023) 16\"', 8108, 188, 32, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 2048, 'Bluetooth Version 5.3', 'Asus'),
(30, 'Asus ROG Strix Scar 15 (2022) G533 15.6\"', 8108, 188, 64, '2560 x 1440 px', '6 x 2.5 GHz & 8 x 1.8 GHz', 15.6, 2048, 'Bluetooth Version 5.2', 'Asus'),
(31, 'Lenovo ThinkPad X1 Extreme 16\" WQUXGA', 8108, 251, 64, '3840 x 2400 px', '6 x 2.5 GHz & 8 x 1.8 GHz', 16.0, 8192, 'Bluetooth Version 5.2', 'Lenovo'),
(32, 'Lenovo Legion 9i Gen 9 16\"', 9000, 235, 64, '3200 x 2000 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 2048, 'Bluetooth Version 5.1', 'Lenovo'),
(33, 'Lenovo Legion 9 Gen 14 (2024) 16\"', 9000, 235, 64, '3200 x 2000 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 2048, 'Bluetooth Version 5.1', 'Lenovo'),
(34, 'Lenovo Legion 7i Gen 14 (2024) 16\"', 9000, 188, 32, '3200 x 2000 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 1024, 'Bluetooth Version 5.2', 'Lenovo'),
(35, 'Lenovo Legion 5 Pro Gen 14 (2024) 16\"', 7207, 188, 32, '2560 x 1600 px', '8 x 2.2 GHz & 16 x 1.6 GHz', 16.0, 1024, 'Bluetooth Version 5.2', 'Lenovo'),
(36, 'Lenovo ThinkPad X1 Yoga Gen 6 14\"', 5135, 323, 16, '3840 x 2400 px', '4 x 3 GHz', 14.0, 1000, 'Bluetooth Version 5.1', 'Lenovo'),
(37, 'Lenovo ThinkPad P16v Gen 1 16\"', 8108, 141, 64, '1920 x 1200 px', '8 x 3.8 GHz', 16.0, 1024, 'Bluetooth Version 5.1', 'Lenovo'),
(38, 'Lenovo ThinkPad X1 Carbon Gen 10 14\"', 5135, 188, 16, '2240 x 1800 px', '4 x 1.7 GHz & 8 x 1.2 GHz', 14.0, 1024, 'Bluetooth Version 5.2', 'Lenovo'),
(39, 'Lenovo ThinkBook Plus Gen 3 17\"', 6216, 196, 32, '3072 x 1440 px', '6 x 2.3 GHz & 8 x 1.7 GHz', 17.0, 512, 'Bluetooth Version 5.1', 'Lenovo'),
(40, 'Lenovo Legion Pro 5 (2023) 16\"', 7207, 188, 32, '2560 x 1600 px', '8 x 3.6 GHz', 16.0, 512, 'Bluetooth Version 5.1', 'Lenovo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `model_name` varchar(255) NOT NULL,
  `battery_capacity` int(11) NOT NULL,
  `pixel_density` int(11) NOT NULL,
  `ram_size` int(11) NOT NULL,
  `resolution` varchar(50) NOT NULL,
  `rear_camera` varchar(100) NOT NULL,
  `cpu_speed` varchar(50) NOT NULL,
  `screen_size` decimal(3,1) NOT NULL,
  `storage_size` varchar(50) NOT NULL,
  `front_camera` varchar(50) NOT NULL,
  `brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `phone`
--

INSERT INTO `phone` (`id`, `model_name`, `battery_capacity`, `pixel_density`, `ram_size`, `resolution`, `rear_camera`, `cpu_speed`, `screen_size`, `storage_size`, `front_camera`, `brand`) VALUES
(1, 'iPhone 15 Pro', 3274, 460, 8, '2556x1179', '48 MP + 12 MP + 12 MP', '3.78 GHz', 6.1, '1000GB', '12 MP', 'Apple'),
(2, 'iPhone 15', 3349, 460, 6, '2556x1179', '48 MP + 12 MP', '3.78 GHz', 6.1, '512GB', '12 MP', 'Apple'),
(3, 'iPhone 14 Pro', 3200, 460, 6, '2556x1179', '48 MP + 12 MP + 12 MP', '3.46 GHz', 6.1, '1000GB', '12 MP', 'Apple'),
(4, 'iPhone 14', 3279, 460, 6, '2532x1170', '12 MP + 12 MP', '3.46 GHz', 6.1, '512GB', '12 MP', 'Apple'),
(5, 'iPhone 13 Pro Max', 4352, 458, 6, '2778x1284', '12 MP + 12 MP + 12 MP', '3.2 GHz', 6.7, '1000GB', '12 MP', 'Apple'),
(6, 'iPhone 13', 3240, 460, 4, '2532x1170', '12 MP + 12 MP', '3.2 GHz', 6.1, '512GB', '12 MP', 'Apple'),
(7, 'iPhone SE (2022)', 2018, 326, 4, '1334x750', '12 MP', '2.65 GHz', 4.7, '256GB', '7 MP', 'Apple'),
(8, 'iPhone 12', 2815, 460, 4, '2532x1170', '12 MP + 12 MP', '3.1 GHz', 6.1, '256GB', '12 MP', 'Apple'),
(9, 'iPhone 12 Mini', 2227, 476, 4, '2340x1080', '12 MP + 12 MP', '3.1 GHz', 5.4, '256GB', '12 MP', 'Apple'),
(10, 'iPhone 11', 3110, 326, 4, '1792x828', '12 MP + 12 MP', '2.65 GHz', 6.1, '256GB', '12 MP', 'Apple'),
(11, 'Samsung Galaxy S23', 3900, 422, 8, '2340x1080', '50 MP + 10 MP + 12 MP', '3.36 GHz', 6.1, '512GB', '12 MP', 'Samsung'),
(12, 'Samsung Galaxy Z Flip5', 3700, 426, 8, '2640x1080', '12 MP + 12 MP', '3.36 GHz', 6.7, '512GB', '10 MP', 'Samsung'),
(13, 'Samsung Galaxy A54', 5000, 403, 6, '2400x1080', '50 MP + 12 MP + 5 MP', '2.4 GHz', 6.4, '256GB', '32 MP', 'Samsung'),
(14, 'Samsung Galaxy S22 Ultra', 5000, 500, 12, '3088x1440', '108 MP + 10 MP + 10 MP + 12 MP', '3.0 GHz', 6.8, '1000GB', '40 MP', 'Samsung'),
(15, 'Samsung Galaxy Z Fold4', 4400, 374, 12, '2176x1812', '50 MP + 12 MP + 10 MP', '3.2 GHz', 7.6, '1000GB', '10 MP', 'Samsung'),
(16, 'Samsung Galaxy M14', 6000, 400, 6, '2400x1080', '50 MP + 2 MP + 2 MP', '2.4 GHz', 6.6, '128GB', '13 MP', 'Samsung'),
(17, 'Samsung Galaxy A14', 5000, 401, 4, '2408x1080', '50 MP + 5 MP + 2 MP', '2.3 GHz', 6.6, '128GB', '13 MP', 'Samsung'),
(18, 'Samsung Galaxy F54', 6000, 402, 8, '2400x1080', '108 MP + 8 MP + 2 MP', '2.4 GHz', 6.7, '128GB', '32 MP', 'Samsung'),
(19, 'Samsung Galaxy M34', 6000, 401, 6, '2400x1080', '50 MP + 8 MP + 2 MP', '2.4 GHz', 6.5, '128GB', '13 MP', 'Samsung'),
(20, 'Samsung Galaxy S21 FE', 4500, 394, 8, '2400x1080', '12 MP + 12 MP + 8 MP', '2.9 GHz', 6.4, '256GB', '32 MP', 'Samsung'),
(21, 'Xiaomi 13 Ultra', 5000, 522, 12, '3200x1440', '50.3 MP + 50 MP + 50 MP + 50 MP', '3.2 GHz', 6.7, '256', '32 MP', 'Xiaomi'),
(22, 'Xiaomi 13 Pro', 4820, 522, 12, '3200x1440', '50 MP + 50 MP + 50 MP', '3.2 GHz', 6.7, '256', '32 MP', 'Xiaomi'),
(23, 'Xiaomi 13', 4500, 414, 12, '2400x1080', '50 MP + 10 MP + 12 MP', '3.2 GHz', 6.4, '128', '32 MP', 'Xiaomi'),
(24, 'Xiaomi Redmi Note 12 Pro', 5000, 395, 8, '2400x1080', '50 MP + 8 MP + 2 MP', '2.6 GHz', 6.7, '256', '16 MP', 'Xiaomi'),
(25, 'Xiaomi Redmi Note 12', 5000, 395, 6, '2400x1080', '48 MP + 8 MP + 2 MP', '2.0 GHz', 6.7, '128', '13 MP', 'Xiaomi'),
(26, 'Xiaomi Poco F5', 5000, 395, 12, '2400x1080', '64 MP + 8 MP + 2 MP', '3.0 GHz', 6.7, '256', '16 MP', 'Xiaomi'),
(27, 'Xiaomi Poco X5 Pro', 5000, 395, 8, '2400x1080', '108 MP + 8 MP + 2 MP', '2.6 GHz', 6.7, '128', '16 MP', 'Xiaomi'),
(28, 'Xiaomi 12T Pro', 5000, 446, 12, '2712x1220', '200 MP + 8 MP + 2 MP', '3.2 GHz', 6.7, '256', '20 MP', 'Xiaomi'),
(29, 'Xiaomi 12', 4500, 419, 12, '3200x1440', '50 MP + 13 MP + 5 MP', '3.0 GHz', 6.3, '256', '32 MP', 'Xiaomi'),
(30, 'Xiaomi Mi 11 Ultra', 5000, 515, 12, '3200x1440', '50 MP + 48 MP + 48 MP', '2.84 GHz', 6.8, '512', '20 MP', 'Xiaomi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `phone_id` int(11) DEFAULT NULL,
  `laptop_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`) VALUES
(1, 'ramaaa', '$2a$10$KRNDmHl4Sf/kkM/QtN69VeuwrhRnTCwCKX8RtHhSrS4kBs5/AkILm'),
(2, 'mamama', '$2a$10$sh1WJxKU9jh19eIQ/KjyNeKjo6w0qHDbaibXc9SYSeicgzRThPkNy');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_id` (`phone_id`),
  ADD KEY `laptop_id` (`laptop_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `laptop`
--
ALTER TABLE `laptop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`laptop_id`) REFERENCES `laptop` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
