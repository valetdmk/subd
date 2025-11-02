-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 01 2025 г., 19:59
-- Версия сервера: 10.3.31-MariaDB-0+deb10u1
-- Версия PHP: 7.3.31-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `i24s0210`
--

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `stud_id` int(11) DEFAULT NULL,
  `subj_id` int(11) DEFAULT NULL,
  `ddate` datetime DEFAULT current_timestamp(),
  `mark` tinyint(4) DEFAULT NULL CHECK (`mark` > 1 and `mark` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`stud_id`, `subj_id`, `ddate`, `mark`) VALUES
(345, 52, '2025-10-06 00:00:00', 4),
(345, 67, '2025-10-03 00:00:00', 4),
(345, 91, '2025-10-07 00:00:00', 5),
(456, 67, '2025-09-29 00:00:00', 3),
(456, 91, '2025-09-27 00:00:00', 5),
(456, 52, '2025-10-01 00:00:00', 2),
(789, 67, '2025-10-10 00:00:00', 4),
(789, 52, '2025-10-08 00:00:00', 3),
(789, 91, '2025-10-22 00:00:00', 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD KEY `fk_marks_students` (`stud_id`),
  ADD KEY `fk_marks_subjects` (`subj_id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `fk_marks_students` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_marks_subjects` FOREIGN KEY (`subj_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
