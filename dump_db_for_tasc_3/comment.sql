-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 21 2021 г., 21:30
-- Версия сервера: 8.0.19
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `user-comment`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `comment` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `name`, `email`, `comment`) VALUES
(9, 'Grisha', 'grig@gmail.com', ''),
(13, 'Test', 'Testing', 'Testing@tesing.com'),
(14, 'Anton', 'wwd@fdd.com', ' biluvbu'),
(15, 'Grisha', 'gri@fggf.com', ' Hello Anton'),
(18, 'Лена', 'anro28yt@gmail.com', ' Приве мир'),
(38, 'gggg', 'ggggg@grg.55', ' gggg'),
(41, '2222', '2222@fddf.reer', ' sdfa'),
(47, 'Fliper', 'fp@dno.com', ' Победитель в номенации ...'),
(56, 'Piple', 'piip@ghgh.com', ' User'),
(156, 'anro28yt', 'anro28yt@gmail.com', ' kl//'),
(162, 'Darina', 'dar@va.com', ' divjsifjoeifjoei'),
(272, 'Антон', 'anro28yt@gmail.com', 'hello world'),
(273, 'Антон', 'anro28yt@gmail.com', 'hello world'),
(274, 'Антон', 'anro28yt@gmail.com', 'aaaa'),
(277, 'Антон', 'anro28yt@gmail.com', 'gj'),
(278, 'Антон', 'anro28yt@gmail.com', 'bb,klguil'),
(281, 'csdc', 'anro28yt@gmail.com', ' csdc'),
(282, 'aaaaaaaaaaaaaaaaaaaaaaaa', 'anro28yt@gmail.com', ' asdasd'),
(283, 'Антон', 'anro28yt@gmail.com', 'asdasd'),
(284, 'Антон', 'anro28yt@gmail.com', 'asdasdas'),
(285, 'Антон', 'anro28yt@gmail.com', 'as'),
(287, 'Ант', 'anro28yt@gmail.com', 'ss'),
(288, 'Антон', 'anro28yt@gmail.com', 'ds'),
(289, 'Антон', 'anro28yt@gmail.com', 'ds'),
(290, 'anro28yt', 'anro28yt@gmail.com', 'asdsad');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
