-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 10 2024 г., 18:27
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvcc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `compounds`
--

CREATE TABLE `compounds` (
  `CompoundID` int(11) NOT NULL,
  `CompoundName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `compounds`
--

INSERT INTO `compounds` (`CompoundID`, `CompoundName`) VALUES
(1, 'aaa');

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `DepartmentType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`DepartmentID`, `DepartmentName`, `DepartmentType`) VALUES
(1, 'awdawd', 'awdawd'),
(2, 'sss', 'sss'),
(3, 'jenya', 'jenyt'),
(4, 'awdsaw', 'sadwdawddsd');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Address` varchar(255) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `UserRoleID` int(11) NOT NULL,
  `PositionID` int(11) NOT NULL,
  `CompoundID` int(11) NOT NULL,
  `Image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `positions`
--

CREATE TABLE `positions` (
  `PositionID` int(11) NOT NULL,
  `PositionName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `positions`
--

INSERT INTO `positions` (`PositionID`, `PositionName`) VALUES
(1, 'копирайтер'),
(2, 'кодер'),
(5, 'аналитик'),
(6, 'бездельник');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`) VALUES
(1, 'ноовый1', 'фцвгнфгшцнвшфнцшгвншнш'),
(2, 'ноовый2', 'фцвгнфгшцнвшфнцшгвншнш');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `UserRoleID` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`UserRoleID`, `name`, `login`, `password`, `role`) VALUES
(13, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(28, 'asd', 'asd', '7815696ecbf1c96e6894b779456d330e', 'employee'),
(29, 'нефор', 'нефор', 'b592ad20e034eaeeaae5261943ef32b4', 'employee'),
(30, 'Бульба', 'qwe@rr.com', '8068c76c7376bc08e2836ab26359d4a4', 'quest');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `compounds`
--
ALTER TABLE `compounds`
  ADD PRIMARY KEY (`CompoundID`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `UserRoleID` (`UserRoleID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `PositionID` (`PositionID`),
  ADD KEY `CompoundID` (`CompoundID`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`PositionID`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserRoleID`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `compounds`
--
ALTER TABLE `compounds`
  MODIFY `CompoundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `positions`
--
ALTER TABLE `positions`
  MODIFY `PositionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `UserRoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`UserRoleID`) REFERENCES `users` (`UserRoleID`),
  ADD CONSTRAINT `employees_ibfk_5` FOREIGN KEY (`CompoundID`) REFERENCES `compounds` (`CompoundID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
