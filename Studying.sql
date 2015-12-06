-- phpMyAdmin SQL Dump
-- version 4.6.0-dev
-- http://www.phpmyadmin.net
--
-- ����: 192.168.30.23
-- ����� ��������: ��� 05 2015 �., 17:29
-- ������ �������: 5.5.46-0+deb8u1
-- ������ PHP: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;

--
-- ���� ������: `Studying`
--

-- --------------------------------------------------------

--
-- ��������� ������� `Faculties`
--

CREATE TABLE `Faculties` (
  `Ident_Fac` int(11) NOT NULL,
  `Name_Fac` varchar(150) COLLATE cp1251_ukrainian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- ���� ������ ������� `Faculties`
--

INSERT INTO `Faculties` (`Ident_Fac`, `Name_Fac`) VALUES
(1, '�Ҳ��'),
(2, '�ʲ�');

-- --------------------------------------------------------

--
-- ��������� ������� `Groups`
--

CREATE TABLE `Groups` (
  `Ident_Group` int(11) NOT NULL,
  `Ident_Fac` int(11) NOT NULL,
  `Name_Gr` varchar(50) COLLATE cp1251_ukrainian_ci NOT NULL,
  `Count_St` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- ���� ������ ������� `Groups`
--

INSERT INTO `Groups` (`Ident_Group`, `Ident_Fac`, `Name_Gr`, `Count_St`) VALUES
(1, 1, '��-12', 21),
(2, 1, '��-12', NULL);

-- --------------------------------------------------------

--
-- ��������� ������� `Solutions`
--

CREATE TABLE `Solutions` (
  `Ident_St` int(11) NOT NULL,
  `Ident_Task` int(11) NOT NULL,
  `SLink` longtext COLLATE cp1251_ukrainian_ci NOT NULL,
  `SDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- ���� ������ ������� `Solutions`
--

INSERT INTO `Solutions` (`Ident_St`, `Ident_Task`, `SLink`, `SDate`) VALUES
(1, 1, 'yatsik95@gmail.com', '2015-12-05');

-- --------------------------------------------------------

--
-- ��������� ������� `Students`
--

CREATE TABLE `Students` (
  `Ident_St` int(11) NOT NULL,
  `Ident_Group` int(11) NOT NULL,
  `SFull_name` varchar(200) COLLATE cp1251_ukrainian_ci NOT NULL,
  `Privilege` varchar(100) COLLATE cp1251_ukrainian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- ���� ������ ������� `Students`
--

INSERT INTO `Students` (`Ident_St`, `Ident_Group`, `SFull_name`, `Privilege`) VALUES
(1, 1, '������ ³���� ���������', NULL),
(2, 2, '������� ����� ���������', NULL);

-- --------------------------------------------------------

--
-- ��������� ������� `Subjects`
--

CREATE TABLE `Subjects` (
  `Ident_Subj` int(11) NOT NULL,
  `Ident_Fac` int(11) NOT NULL,
  `Name_Subj` varchar(150) COLLATE cp1251_ukrainian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- ���� ������ ������� `Subjects`
--

INSERT INTO `Subjects` (`Ident_Subj`, `Ident_Fac`, `Name_Subj`) VALUES
(1, 1, '������� ������� �� �����');

-- --------------------------------------------------------

--
-- ��������� ������� `Tasks`
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
-- ���� ������ ������� `Tasks`
--

INSERT INTO `Tasks` (`Ident_Task`, `Ident_Group`, `Ident_Teacher`, `Ident_Subj`, `TLink`, `Deadline`) VALUES
(1, 1, 1, 1, '������� ��� Google ������', '2015-12-20');

-- --------------------------------------------------------

--
-- ��������� ������� `Teachers`
--

CREATE TABLE `Teachers` (
  `Ident_Teacher` int(11) NOT NULL,
  `TFull_Name` varchar(200) COLLATE cp1251_ukrainian_ci NOT NULL,
  `Degree` varchar(150) COLLATE cp1251_ukrainian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- ���� ������ ������� `Teachers`
--

INSERT INTO `Teachers` (`Ident_Teacher`, `TFull_Name`, `Degree`) VALUES
(1, '��� ��������� ��������', '������');

--
-- ������� ���������� ������
--

--
-- ������� ������� `Faculties`
--
ALTER TABLE `Faculties`
  ADD PRIMARY KEY (`Ident_Fac`);

--
-- ������� ������� `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`Ident_Group`),
  ADD KEY `FK_has` (`Ident_Fac`);

--
-- ������� ������� `Solutions`
--
ALTER TABLE `Solutions`
  ADD KEY `FK_do` (`Ident_St`),
  ADD KEY `FK_need` (`Ident_Task`);

--
-- ������� ������� `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`Ident_St`),
  ADD KEY `FK_consist` (`Ident_Group`);

--
-- ������� ������� `Subjects`
--
ALTER TABLE `Subjects`
  ADD PRIMARY KEY (`Ident_Subj`),
  ADD KEY `FK_have` (`Ident_Fac`);

--
-- ������� ������� `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`Ident_Task`),
  ADD KEY `FK_designed` (`Ident_Group`),
  ADD KEY `FK_give` (`Ident_Teacher`),
  ADD KEY `FK_include` (`Ident_Subj`);

--
-- ������� ������� `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`Ident_Teacher`);

--
-- ����������� �������� ����� ����������� ������
--

--
-- ����������� �������� ����� ������� `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `FK_has` FOREIGN KEY (`Ident_Fac`) REFERENCES `Faculties` (`Ident_Fac`);

--
-- ����������� �������� ����� ������� `Solutions`
--
ALTER TABLE `Solutions`
  ADD CONSTRAINT `FK_need` FOREIGN KEY (`Ident_Task`) REFERENCES `Tasks` (`Ident_Task`),
  ADD CONSTRAINT `FK_do` FOREIGN KEY (`Ident_St`) REFERENCES `Students` (`Ident_St`);

--
-- ����������� �������� ����� ������� `Students`
--
ALTER TABLE `Students`
  ADD CONSTRAINT `FK_consist` FOREIGN KEY (`Ident_Group`) REFERENCES `Groups` (`Ident_Group`);

--
-- ����������� �������� ����� ������� `Subjects`
--
ALTER TABLE `Subjects`
  ADD CONSTRAINT `FK_have` FOREIGN KEY (`Ident_Fac`) REFERENCES `Faculties` (`Ident_Fac`);

--
-- ����������� �������� ����� ������� `Tasks`
--
ALTER TABLE `Tasks`
  ADD CONSTRAINT `FK_include` FOREIGN KEY (`Ident_Subj`) REFERENCES `Subjects` (`Ident_Subj`),
  ADD CONSTRAINT `FK_designed` FOREIGN KEY (`Ident_Group`) REFERENCES `Groups` (`Ident_Group`),
  ADD CONSTRAINT `FK_give` FOREIGN KEY (`Ident_Teacher`) REFERENCES `Teachers` (`Ident_Teacher`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
