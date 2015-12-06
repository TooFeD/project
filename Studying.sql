-- phpMyAdmin SQL Dump
-- version 4.6.0-dev
-- http://www.phpmyadmin.net
--
-- Хост: 192.168.30.23
-- Время создания: Дек 05 2015 г., 17:29
-- Версия сервера: 5.5.46-0+deb8u1
-- Версия PHP: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;

--
-- База данных: `Studying`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Faculties`
--

CREATE TABLE `Faculties` (
  `Ident_Fac` int(11) NOT NULL,
  `Name_Fac` varchar(150) COLLATE cp1251_ukrainian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `Faculties`
--

INSERT INTO `Faculties` (`Ident_Fac`, `Name_Fac`) VALUES
(1, 'ОТІУС'),
(2, 'ОКІТ');

-- --------------------------------------------------------

--
-- Структура таблицы `Groups`
--

CREATE TABLE `Groups` (
  `Ident_Group` int(11) NOT NULL,
  `Ident_Fac` int(11) NOT NULL,
  `Name_Gr` varchar(50) COLLATE cp1251_ukrainian_ci NOT NULL,
  `Count_St` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `Groups`
--

INSERT INTO `Groups` (`Ident_Group`, `Ident_Fac`, `Name_Gr`, `Count_St`) VALUES
(1, 1, 'КС-12', 21),
(2, 1, 'КЕ-12', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Solutions`
--

CREATE TABLE `Solutions` (
  `Ident_St` int(11) NOT NULL,
  `Ident_Task` int(11) NOT NULL,
  `SLink` longtext COLLATE cp1251_ukrainian_ci NOT NULL,
  `SDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `Solutions`
--

INSERT INTO `Solutions` (`Ident_St`, `Ident_Task`, `SLink`, `SDate`) VALUES
(1, 1, 'yatsik95@gmail.com', '2015-12-05');

-- --------------------------------------------------------

--
-- Структура таблицы `Students`
--

CREATE TABLE `Students` (
  `Ident_St` int(11) NOT NULL,
  `Ident_Group` int(11) NOT NULL,
  `SFull_name` varchar(200) COLLATE cp1251_ukrainian_ci NOT NULL,
  `Privilege` varchar(100) COLLATE cp1251_ukrainian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `Students`
--

INSERT INTO `Students` (`Ident_St`, `Ident_Group`, `SFull_name`, `Privilege`) VALUES
(1, 1, 'Яценко Віталій Андрійович', NULL),
(2, 2, 'Кузевич Петро Романович', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Subjects`
--

CREATE TABLE `Subjects` (
  `Ident_Subj` int(11) NOT NULL,
  `Ident_Fac` int(11) NOT NULL,
  `Name_Subj` varchar(150) COLLATE cp1251_ukrainian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `Subjects`
--

INSERT INTO `Subjects` (`Ident_Subj`, `Ident_Fac`, `Name_Subj`) VALUES
(1, 1, 'Безпека програм та даних');

-- --------------------------------------------------------

--
-- Структура таблицы `Tasks`
--

CREATE TABLE `Tasks` (
  `Ident_Task` int(11) NOT NULL,
  `Ident_Group` int(11) NOT NULL,
  `Ident_Teacher` int(11) NOT NULL,
  `Ident_Subj` int(11) NOT NULL,
  `TLink` longtext COLLATE cp1251_ukrainian_ci NOT NULL,
  `Deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `Tasks`
--

INSERT INTO `Tasks` (`Ident_Task`, `Ident_Group`, `Ident_Teacher`, `Ident_Subj`, `TLink`, `Deadline`) VALUES
(1, 1, 1, 1, 'Зробити свій Google акаунт', '2015-12-20');

-- --------------------------------------------------------

--
-- Структура таблицы `Teachers`
--

CREATE TABLE `Teachers` (
  `Ident_Teacher` int(11) NOT NULL,
  `TFull_Name` varchar(200) COLLATE cp1251_ukrainian_ci NOT NULL,
  `Degree` varchar(150) COLLATE cp1251_ukrainian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `Teachers`
--

INSERT INTO `Teachers` (`Ident_Teacher`, `TFull_Name`, `Degree`) VALUES
(1, 'Гук Володимир Іванович', 'Доцент');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Faculties`
--
ALTER TABLE `Faculties`
  ADD PRIMARY KEY (`Ident_Fac`);

--
-- Индексы таблицы `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`Ident_Group`),
  ADD KEY `FK_has` (`Ident_Fac`);

--
-- Индексы таблицы `Solutions`
--
ALTER TABLE `Solutions`
  ADD KEY `FK_do` (`Ident_St`),
  ADD KEY `FK_need` (`Ident_Task`);

--
-- Индексы таблицы `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`Ident_St`),
  ADD KEY `FK_consist` (`Ident_Group`);

--
-- Индексы таблицы `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`Ident_Subj`),
  ADD KEY `FK_have` (`Ident_Fac`);

--
-- Индексы таблицы `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`Ident_Task`),
  ADD KEY `FK_designed` (`Ident_Group`),
  ADD KEY `FK_give` (`Ident_Teacher`),
  ADD KEY `FK_include` (`Ident_Subj`);

--
-- Индексы таблицы `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`Ident_Teacher`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `FK_has` FOREIGN KEY (`Ident_Fac`) REFERENCES `Faculties` (`Ident_Fac`);

--
-- Ограничения внешнего ключа таблицы `Solutions`
--
ALTER TABLE `Solutions`
  ADD CONSTRAINT `FK_need` FOREIGN KEY (`Ident_Task`) REFERENCES `Tasks` (`Ident_Task`),
  ADD CONSTRAINT `FK_do` FOREIGN KEY (`Ident_St`) REFERENCES `Students` (`Ident_St`);

--
-- Ограничения внешнего ключа таблицы `Students`
--
ALTER TABLE `Students`
  ADD CONSTRAINT `FK_consist` FOREIGN KEY (`Ident_Group`) REFERENCES `Groups` (`Ident_Group`);

--
-- Ограничения внешнего ключа таблицы `Subjects`
--
ALTER TABLE `Subjects`
  ADD CONSTRAINT `FK_have` FOREIGN KEY (`Ident_Fac`) REFERENCES `Faculties` (`Ident_Fac`);

--
-- Ограничения внешнего ключа таблицы `Tasks`
--
ALTER TABLE `Tasks`
  ADD CONSTRAINT `FK_include` FOREIGN KEY (`Ident_Subj`) REFERENCES `Subjects` (`Ident_Subj`),
  ADD CONSTRAINT `FK_designed` FOREIGN KEY (`Ident_Group`) REFERENCES `Groups` (`Ident_Group`),
  ADD CONSTRAINT `FK_give` FOREIGN KEY (`Ident_Teacher`) REFERENCES `Teachers` (`Ident_Teacher`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
