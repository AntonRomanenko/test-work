-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 10 2021 г., 22:06
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
-- База данных: `chat_task_2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `chat`
--

CREATE TABLE `chat` (
  `id` int NOT NULL,
  `name_chat` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `chat`
--

INSERT INTO `chat` (`id`, `name_chat`) VALUES
(1, 'PHP'),
(2, 'Friends'),
(3, 'Work');

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id` int NOT NULL,
  `message` text NOT NULL,
  `user_id` int NOT NULL,
  `chat_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `message`
--

INSERT INTO `message` (`id`, `message`, `user_id`, `chat_id`, `date`) VALUES
(1, 'Hello', 1, 1, '2021-05-10 18:18:33'),
(2, 'Test test hello', 3, 2, '2021-05-10 18:18:33'),
(3, 'Привет как дела', 3, 2, '2021-05-10 18:56:21'),
(4, 'Все хорошо как сам?', 4, 2, '2021-05-10 18:56:21'),
(5, 'Привет есть вопросы для обсуждения', 3, 1, '2021-05-10 18:56:21'),
(6, 'Сегодня хорошая погода, погнали в парк', 2, 2, '2021-05-10 19:03:38'),
(7, 'Я смогу только ближе к вечеру ', 5, 2, '2021-05-10 19:03:38'),
(8, 'Я тоже вечером ', 1, 2, '2021-05-10 19:03:38'),
(9, 'Я вечером занят на меня не расчитуйте', 3, 2, '2021-05-10 19:03:38');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`) VALUES
(1, 'Denis '),
(2, 'Dima'),
(3, 'Anton'),
(4, 'Olga'),
(5, 'Natasha');

-- --------------------------------------------------------

--
-- Структура таблицы `user_chat`
--

CREATE TABLE `user_chat` (
  `user_id` int NOT NULL,
  `chat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_chat`
--

INSERT INTO `user_chat` (`user_id`, `chat_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 1),
(4, 2),
(3, 2),
(2, 2),
(4, 2),
(5, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_ibfk_1` (`user_id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_chat`
--
ALTER TABLE `user_chat`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `message`
--
ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user_chat`
--
ALTER TABLE `user_chat`
  ADD CONSTRAINT `user_chat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_chat_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Выводим переписку 4 чата
SELECT * FROM `chat` 
LEFT JOIN user_chat ON chat.id = user_chat.chat_id
LEFT JOIN user ON user.id = user_chat.user_id
WHERE user.id = 1

-- Выводим все переписки с именами пользователя
SELECT message.id, message.message, user.name FROM message
LEFT JOIN user on user.id = message.user_id;

-- Выводим перепискк пользователя №2 (Антон)
SELECT message.id, message.message, user.name FROM message
    LEFT OUTER JOIN user on user.id = message.user_id
WHERE message.user_id = 1;

-- Выводим все переписки всех пользователей
SELECT * FROM message;

-- Выводим смс №7(удалино)
SELECT * FROM message WHERE message.id =7;

-- Удоление №7 переписки
DELETE FROM message WHERE message.id = 7;

-- Вставляем смс от пользователя 1(Денис) в чат 1 (PHP)
INSERT into message ( message, user_id, chat_id ) VALUES ('Hello my name is Tomas', 1, 1);