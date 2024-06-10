-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 10 2024 г., 23:10
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
(3, 'профессорско-преподавательский'),
(4, 'учебно-вспомогательный'),
(6, 'административно-хозяйственный');

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
(6, 'Департамент образования', 'Образование'),
(7, 'Департамент спорта', 'Спорт');

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

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `MiddleName`, `Gender`, `DateOfBirth`, `Address`, `DepartmentID`, `UserRoleID`, `PositionID`, `CompoundID`, `Image`) VALUES
(59, 'Наталья', 'Морская', 'Пехота', 'Male', '2024-05-23', 'бейкер стрис 221б', 6, 32, 6, 3, 'uploads/IMG-6667665097d5c1.69755970.jpg'),
(60, 'qew', 'qwe', 'ewq', 'Male', '1990-06-12', 'бейкер стрис 221б', 6, 33, 1, 3, 'uploads/IMG-666766ab87b1c0.54547206.');

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
(1, 'Кодер'),
(2, 'Сварщик'),
(5, 'Слесарь'),
(6, 'Сисадмин');

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
(1, 'Чистый0', 'qweasd'),
(2, 'Чистый1', 'qweasd');

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
(13, 'admin', 'admin', '200820e3227815ed1756a6b531e7e0d2', 'admin'),
(30, 'Бульба', 'qwe@rr.com', '8068c76c7376bc08e2836ab26359d4a4', 'employee'),
(31, 'сквидвард', 'asd@gmail.com', '200820e3227815ed1756a6b531e7e0d2', 'employee'),
(32, 'святополк', 'ww@gmail.com', '200820e3227815ed1756a6b531e7e0d2', 'employee'),
(33, 'авпы', 'qq@gmail.com', '200820e3227815ed1756a6b531e7e0d2', 'employee');

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
  MODIFY `CompoundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `UserRoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
