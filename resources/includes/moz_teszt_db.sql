-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Jún 25. 10:05
-- Kiszolgáló verziója: 10.4.11-MariaDB
-- PHP verzió: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `moz_teszt_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `counties`
--

CREATE TABLE `counties` (
  `id` int(5) NOT NULL,
  `cName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `counties`
--

INSERT INTO `counties` (`id`, `cName`) VALUES
(1, 'Bács-Kiskun'),
(2, 'Baranya'),
(3, 'Békés'),
(4, 'Borsod-Abaúj-Zemplén'),
(5, 'Csongrád-Csanád'),
(6, 'Fejér'),
(7, 'Győr-Moson-Sopron'),
(8, 'Hajdú-Bihar'),
(9, 'Heves'),
(10, 'Jász-Nagykun-Szolnok'),
(11, 'Komárom-Esztergom'),
(12, 'Nógrád'),
(13, 'Pest'),
(14, 'Somogy'),
(15, 'Szabolcs-Szatmár-Bereg'),
(16, 'Tolna'),
(17, 'Vas'),
(18, 'Veszprém'),
(19, 'Zala');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2020_06_24_182235_add_created_at_column_to_settlements', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `settlements`
--

CREATE TABLE `settlements` (
  `id` int(5) NOT NULL,
  `sName` varchar(50) NOT NULL,
  `pCode` varchar(8) NOT NULL,
  `updated_at` date DEFAULT NULL,
  `county` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `settlements`
--

INSERT INTO `settlements` (`id`, `sName`, `pCode`, `updated_at`, `county`, `created_at`) VALUES
(1, 'Kecskemét', '6000', '2020-06-24', 1, '2020-06-24 21:15:11'),
(2, 'Pécs', '7691', '2020-06-24', 2, '2020-06-24 18:23:42'),
(3, 'Békéscsaba', '5600', '2020-06-24', 3, '2020-06-24 18:23:42'),
(4, 'Miskolcc', '3500', '2020-06-24', 4, '2020-06-24 21:32:44'),
(5, 'Szeged', '6700', '2020-06-24', 5, '2020-06-24 18:23:42'),
(6, 'Székesfehérvár', '8000', '2020-06-24', 6, '2020-06-24 18:23:42'),
(7, 'Győr', '9100', '2020-06-24', 7, '2020-06-24 21:33:17'),
(8, 'Debrecen', '4225', '2020-06-24', 8, '2020-06-24 18:23:42'),
(9, 'Eger', '3300', '2020-06-24', 9, '2020-06-24 18:23:42'),
(10, 'Szolnok', '5000', '2020-06-24', 10, '2020-06-24 18:23:42'),
(11, 'Tatabánya', '2800', '2020-06-24', 11, '2020-06-24 18:23:42'),
(12, 'Salgótarján', '3100', '2020-06-24', 12, '2020-06-24 18:23:42'),
(13, 'Budapest', '1011', '2020-06-24', 13, '2020-06-24 18:23:42'),
(14, 'Kaposvár', '7400', '2020-06-24', 14, '2020-06-24 18:23:42'),
(15, 'Nyíregyháza', '4400', '2020-06-24', 15, '2020-06-24 18:23:42'),
(16, 'Szekszárd', '7100', '2020-06-24', 16, '2020-06-24 18:23:42'),
(17, 'Szombathely', '9700', '2020-06-24', 17, '2020-06-24 18:23:42'),
(18, 'Veszprém', '8200', '2020-06-24', 18, '2020-06-24 18:23:42'),
(19, 'Zalaegerszeg', '8900', '2020-06-24', 19, '2020-06-24 18:23:42'),
(20, 'Karakószecső', '9999', '2020-06-24', 4, '2020-06-24 16:23:57'),
(21, 'Szabadszállás', '6080', '2020-06-24', 1, '2020-06-24 21:15:19'),
(25, 'Lakáj', '9871', '2020-06-24', 16, '2020-06-24 19:28:11'),
(29, 'Telep2', '8634', '2020-06-24', 4, '2020-06-24 21:52:34'),
(30, 'Kapuvár', '71233', '2020-06-24', 14, '2020-06-24 19:55:01');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `settlements`
--
ALTER TABLE `settlements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `county` (`county`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `counties`
--
ALTER TABLE `counties`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `settlements`
--
ALTER TABLE `settlements`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `settlements`
--
ALTER TABLE `settlements`
  ADD CONSTRAINT `settlements_ibfk_1` FOREIGN KEY (`county`) REFERENCES `counties` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
