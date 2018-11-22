-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 20-Out-2018 às 01:12
-- Versão do servidor: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pokemon_status`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
CREATE TABLE IF NOT EXISTS `pokemon` (
  `Pokemon_lng_Codigo` int(11) NOT NULL,
  `Pokemon_vch_Name` varchar(255) NOT NULL,
  `Pokemon_vch_Type1` varchar(255) NOT NULL,
  `Pokemon_vch_Type2` varchar(255) NOT NULL,
  `Pokemon_lng_Hp` int(11) NOT NULL,
  `Pokemon_lng_Attack` int(11) NOT NULL,
  `Pokemon_lng_Defense` int(11) NOT NULL,
  `Pokemon_lng_SpAttack` int(11) NOT NULL,
  `Pokemon_lng_SpDefense` int(11) NOT NULL,
  `Pokemon_lng_Speed` int(11) NOT NULL,
  `Pokemon_lng_Generation` int(11) NOT NULL,
  `Pokemon_bln_Legendary` tinyint(1) NOT NULL,
  PRIMARY KEY (`Pokemon_lng_Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pokemon`
--

INSERT INTO `pokemon` (`Pokemon_lng_Codigo`, `Pokemon_vch_Name`, `Pokemon_vch_Type1`, `Pokemon_vch_Type2`, `Pokemon_lng_Hp`, `Pokemon_lng_Attack`, `Pokemon_lng_Defense`, `Pokemon_lng_SpAttack`, `Pokemon_lng_SpDefense`, `Pokemon_lng_Speed`, `Pokemon_lng_Generation`, `Pokemon_bln_Legendary`) VALUES
(1, 'Bulbasaur', 'Grass', 'Poison', 45, 49, 49, 65, 65, 45, 1, 0),
(2, 'Ivysaur', 'Grass', 'Poison', 60, 62, 63, 80, 80, 60, 1, 0),
(3, 'Venusaur', 'Grass', 'Poison', 80, 82, 83, 100, 100, 80, 1, 0),
(5, 'Charmander', 'Fire', '', 39, 52, 43, 60, 50, 65, 1, 0),
(6, 'Charmeleon', 'Fire', '', 58, 64, 58, 80, 65, 80, 1, 0),
(7, 'Charizard', 'Fire', 'Flying', 78, 84, 78, 109, 85, 100, 1, 0),
(10, 'Squirtle', 'Water', '', 44, 48, 65, 50, 64, 43, 1, 0),
(11, 'Wartortle', 'Water', '', 59, 63, 80, 65, 80, 58, 1, 0),
(12, 'Blastoise', 'Water', '', 79, 83, 100, 85, 105, 78, 1, 0),
(14, 'Caterpie', 'Bug', '', 45, 30, 35, 20, 20, 45, 1, 0),
(15, 'Metapod', 'Bug', '', 50, 20, 55, 25, 25, 30, 1, 0),
(16, 'Butterfree', 'Bug', 'Flying', 60, 45, 50, 90, 80, 70, 1, 0),
(17, 'Weedle', 'Bug', 'Poison', 40, 35, 30, 20, 20, 50, 1, 0),
(18, 'Kakuna', 'Bug', 'Poison', 45, 25, 50, 25, 25, 35, 1, 0),
(19, 'Beedrill', 'Bug', 'Poison', 65, 90, 40, 45, 80, 75, 1, 0),
(21, 'Pidgey', 'Normal', 'Flying', 40, 45, 40, 35, 35, 56, 1, 0),
(22, 'Pidgeotto', 'Normal', 'Flying', 63, 60, 55, 50, 50, 71, 1, 0),
(23, 'Pidgeot', 'Normal', 'Flying', 83, 80, 75, 70, 70, 101, 1, 0),
(25, 'Rattata', 'Normal', '', 30, 56, 35, 25, 35, 72, 1, 0),
(26, 'Raticate', 'Normal', '', 55, 81, 60, 50, 70, 97, 1, 0),
(27, 'Spearow', 'Normal', 'Flying', 40, 60, 30, 31, 31, 70, 1, 0),
(28, 'Fearow', 'Normal', 'Flying', 65, 90, 65, 61, 61, 100, 1, 0),
(29, 'Ekans', 'Poison', '', 35, 60, 44, 40, 54, 55, 1, 0),
(30, 'Arbok', 'Poison', '', 60, 85, 69, 65, 79, 80, 1, 0),
(31, 'Pikachu', 'Electric', '', 35, 55, 40, 50, 50, 90, 1, 0),
(32, 'Raichu', 'Electric', '', 60, 90, 55, 90, 80, 110, 1, 0),
(33, 'Sandshrew', 'Ground', '', 50, 75, 85, 20, 30, 40, 1, 0),
(34, 'Sandslash', 'Ground', '', 75, 100, 110, 45, 55, 65, 1, 0),
(36, 'Nidorina', 'Poison', '', 70, 62, 67, 55, 55, 56, 1, 0),
(37, 'Nidoqueen', 'Poison', 'Ground', 90, 92, 87, 75, 85, 76, 1, 0),
(39, 'Nidorino', 'Poison', '', 61, 72, 57, 55, 55, 65, 1, 0),
(40, 'Nidoking', 'Poison', 'Ground', 81, 102, 77, 85, 75, 85, 1, 0),
(41, 'Clefairy', 'Fairy', '', 70, 45, 48, 60, 65, 35, 1, 0),
(42, 'Clefable', 'Fairy', '', 95, 70, 73, 95, 90, 60, 1, 0),
(43, 'Vulpix', 'Fire', '', 38, 41, 40, 50, 65, 65, 1, 0),
(44, 'Ninetales', 'Fire', '', 73, 76, 75, 81, 100, 100, 1, 0),
(45, 'Jigglypuff', 'Normal', 'Fairy', 115, 45, 20, 45, 25, 20, 1, 0),
(46, 'Wigglytuff', 'Normal', 'Fairy', 140, 70, 45, 85, 50, 45, 1, 0),
(47, 'Zubat', 'Poison', 'Flying', 40, 45, 35, 30, 40, 55, 1, 0),
(48, 'Golbat', 'Poison', 'Flying', 75, 80, 70, 65, 75, 90, 1, 0),
(49, 'Oddish', 'Grass', 'Poison', 45, 50, 55, 75, 65, 30, 1, 0),
(50, 'Gloom', 'Grass', 'Poison', 60, 65, 70, 85, 75, 40, 1, 0),
(51, 'Vileplume', 'Grass', 'Poison', 75, 80, 85, 110, 90, 50, 1, 0),
(52, 'Paras', 'Bug', 'Grass', 35, 70, 55, 45, 55, 25, 1, 0),
(53, 'Parasect', 'Bug', 'Grass', 60, 95, 80, 60, 80, 30, 1, 0),
(54, 'Venonat', 'Bug', 'Poison', 60, 55, 50, 40, 55, 45, 1, 0),
(55, 'Venomoth', 'Bug', 'Poison', 70, 65, 60, 90, 75, 90, 1, 0),
(56, 'Diglett', 'Ground', '', 10, 55, 25, 35, 45, 95, 1, 0),
(57, 'Dugtrio', 'Ground', '', 35, 80, 50, 50, 70, 120, 1, 0),
(58, 'Meowth', 'Normal', '', 40, 45, 35, 40, 40, 90, 1, 0),
(59, 'Persian', 'Normal', '', 65, 70, 60, 65, 65, 115, 1, 0),
(60, 'Psyduck', 'Water', '', 50, 52, 48, 65, 50, 55, 1, 0),
(61, 'Golduck', 'Water', '', 80, 82, 78, 95, 80, 85, 1, 0),
(62, 'Mankey', 'Fighting', '', 40, 80, 35, 35, 45, 70, 1, 0),
(63, 'Primeape', 'Fighting', '', 65, 105, 60, 60, 70, 95, 1, 0),
(64, 'Growlithe', 'Fire', '', 55, 70, 45, 70, 50, 60, 1, 0),
(65, 'Arcanine', 'Fire', '', 90, 110, 80, 100, 80, 95, 1, 0),
(66, 'Poliwag', 'Water', '', 40, 50, 40, 40, 40, 90, 1, 0),
(67, 'Poliwhirl', 'Water', '', 65, 65, 65, 50, 50, 90, 1, 0),
(68, 'Poliwrath', 'Water', 'Fighting', 90, 95, 95, 70, 90, 70, 1, 0),
(69, 'Abra', 'Psychic', '', 25, 20, 15, 105, 55, 90, 1, 0),
(70, 'Kadabra', 'Psychic', '', 40, 35, 30, 120, 70, 105, 1, 0),
(71, 'Alakazam', 'Psychic', '', 55, 50, 45, 135, 95, 120, 1, 0),
(73, 'Machop', 'Fighting', '', 70, 80, 50, 35, 35, 35, 1, 0),
(74, 'Machoke', 'Fighting', '', 80, 100, 70, 50, 60, 45, 1, 0),
(75, 'Machamp', 'Fighting', '', 90, 130, 80, 65, 85, 55, 1, 0),
(76, 'Bellsprout', 'Grass', 'Poison', 50, 75, 35, 70, 30, 40, 1, 0),
(77, 'Weepinbell', 'Grass', 'Poison', 65, 90, 50, 85, 45, 55, 1, 0),
(78, 'Victreebel', 'Grass', 'Poison', 80, 105, 65, 100, 70, 70, 1, 0),
(79, 'Tentacool', 'Water', 'Poison', 40, 40, 35, 50, 100, 70, 1, 0),
(80, 'Tentacruel', 'Water', 'Poison', 80, 70, 65, 80, 120, 100, 1, 0),
(81, 'Geodude', 'Rock', 'Ground', 40, 80, 100, 30, 30, 20, 1, 0),
(82, 'Graveler', 'Rock', 'Ground', 55, 95, 115, 45, 45, 35, 1, 0),
(83, 'Golem', 'Rock', 'Ground', 80, 120, 130, 55, 65, 45, 1, 0),
(84, 'Ponyta', 'Fire', '', 50, 85, 55, 65, 65, 90, 1, 0),
(85, 'Rapidash', 'Fire', '', 65, 100, 70, 80, 80, 105, 1, 0),
(86, 'Slowpoke', 'Water', 'Psychic', 90, 65, 65, 40, 40, 15, 1, 0),
(87, 'Slowbro', 'Water', 'Psychic', 95, 75, 110, 100, 80, 30, 1, 0),
(89, 'Magnemite', 'Electric', 'Steel', 25, 35, 70, 95, 55, 45, 1, 0),
(90, 'Magneton', 'Electric', 'Steel', 50, 60, 95, 120, 70, 70, 1, 0),
(91, "Farfetch\'d", 'Normal', 'Flying', 52, 65, 55, 58, 62, 60, 1, 0),
(92, 'Doduo', 'Normal', 'Flying', 35, 85, 45, 35, 35, 75, 1, 0),
(93, 'Dodrio', 'Normal', 'Flying', 60, 110, 70, 60, 60, 100, 1, 0),
(94, 'Seel', 'Water', '', 65, 45, 55, 45, 70, 45, 1, 0),
(95, 'Dewgong', 'Water', 'Ice', 90, 70, 80, 70, 95, 70, 1, 0),
(96, 'Grimer', 'Poison', '', 80, 80, 50, 40, 50, 25, 1, 0),
(97, 'Muk', 'Poison', '', 105, 105, 75, 65, 100, 50, 1, 0),
(98, 'Shellder', 'Water', '', 30, 65, 100, 45, 25, 40, 1, 0),
(99, 'Cloyster', 'Water', 'Ice', 50, 95, 180, 85, 45, 70, 1, 0),
(100, 'Gastly', 'Ghost', 'Poison', 30, 35, 30, 100, 35, 80, 1, 0),
(101, 'Haunter', 'Ghost', 'Poison', 45, 50, 45, 115, 55, 95, 1, 0),
(102, 'Gengar', 'Ghost', 'Poison', 60, 65, 60, 130, 75, 110, 1, 0),
(104, 'Onix', 'Rock', 'Ground', 35, 45, 160, 30, 45, 70, 1, 0),
(105, 'Drowzee', 'Psychic', '', 60, 48, 45, 43, 90, 42, 1, 0),
(106, 'Hypno', 'Psychic', '', 85, 73, 70, 73, 115, 67, 1, 0),
(107, 'Krabby', 'Water', '', 30, 105, 90, 25, 25, 50, 1, 0),
(108, 'Kingler', 'Water', '', 55, 130, 115, 50, 50, 75, 1, 0),
(109, 'Voltorb', 'Electric', '', 40, 30, 50, 55, 55, 100, 1, 0),
(110, 'Electrode', 'Electric', '', 60, 50, 70, 80, 80, 140, 1, 0),
(111, 'Exeggcute', 'Grass', 'Psychic', 60, 40, 80, 60, 45, 40, 1, 0),
(112, 'Exeggutor', 'Grass', 'Psychic', 95, 95, 85, 125, 65, 55, 1, 0),
(113, 'Cubone', 'Ground', '', 50, 50, 95, 40, 50, 35, 1, 0),
(114, 'Marowak', 'Ground', '', 60, 80, 110, 50, 80, 45, 1, 0),
(115, 'Hitmonlee', 'Fighting', '', 50, 120, 53, 35, 110, 87, 1, 0),
(116, 'Hitmonchan', 'Fighting', '', 50, 105, 79, 35, 110, 76, 1, 0),
(117, 'Lickitung', 'Normal', '', 90, 55, 75, 60, 75, 30, 1, 0),
(118, 'Koffing', 'Poison', '', 40, 65, 95, 60, 45, 35, 1, 0),
(119, 'Weezing', 'Poison', '', 65, 90, 120, 85, 70, 60, 1, 0),
(120, 'Rhyhorn', 'Ground', 'Rock', 80, 85, 95, 30, 30, 25, 1, 0),
(121, 'Rhydon', 'Ground', 'Rock', 105, 130, 120, 45, 45, 40, 1, 0),
(122, 'Chansey', 'Normal', '', 250, 5, 5, 35, 105, 50, 1, 0),
(123, 'Tangela', 'Grass', '', 65, 55, 115, 100, 40, 60, 1, 0),
(124, 'Kangaskhan', 'Normal', '', 105, 95, 80, 40, 80, 90, 1, 0),
(126, 'Horsea', 'Water', '', 30, 40, 70, 70, 25, 60, 1, 0),
(127, 'Seadra', 'Water', '', 55, 65, 95, 95, 45, 85, 1, 0),
(128, 'Goldeen', 'Water', '', 45, 67, 60, 35, 50, 63, 1, 0),
(129, 'Seaking', 'Water', '', 80, 92, 65, 65, 80, 68, 1, 0),
(130, 'Staryu', 'Water', '', 30, 45, 55, 70, 55, 85, 1, 0),
(131, 'Starmie', 'Water', 'Psychic', 60, 75, 85, 100, 85, 115, 1, 0),
(132, 'Mr. Mime', 'Psychic', 'Fairy', 40, 45, 65, 100, 120, 90, 1, 0),
(133, 'Scyther', 'Bug', 'Flying', 70, 110, 80, 55, 80, 105, 1, 0),
(134, 'Jynx', 'Ice', 'Psychic', 65, 50, 35, 115, 95, 95, 1, 0),
(135, 'Electabuzz', 'Electric', '', 65, 83, 57, 95, 85, 105, 1, 0),
(136, 'Magmar', 'Fire', '', 65, 95, 57, 100, 85, 93, 1, 0),
(137, 'Pinsir', 'Bug', '', 65, 125, 100, 55, 70, 85, 1, 0),
(139, 'Tauros', 'Normal', '', 75, 100, 95, 40, 70, 110, 1, 0),
(140, 'Magikarp', 'Water', '', 20, 10, 55, 15, 20, 80, 1, 0),
(141, 'Gyarados', 'Water', 'Flying', 95, 125, 79, 60, 100, 81, 1, 0),
(143, 'Lapras', 'Water', 'Ice', 130, 85, 80, 85, 95, 60, 1, 0),
(144, 'Ditto', 'Normal', '', 48, 48, 48, 48, 48, 48, 1, 0),
(145, 'Eevee', 'Normal', '', 55, 55, 50, 45, 65, 55, 1, 0),
(146, 'Vaporeon', 'Water', '', 130, 65, 60, 110, 95, 65, 1, 0),
(147, 'Jolteon', 'Electric', '', 65, 65, 60, 110, 95, 130, 1, 0),
(148, 'Flareon', 'Fire', '', 65, 130, 60, 95, 110, 65, 1, 0),
(149, 'Porygon', 'Normal', '', 65, 60, 70, 85, 75, 40, 1, 0),
(150, 'Omanyte', 'Rock', 'Water', 35, 40, 100, 90, 55, 35, 1, 0),
(151, 'Omastar', 'Rock', 'Water', 70, 60, 125, 115, 70, 55, 1, 0),
(152, 'Kabuto', 'Rock', 'Water', 30, 80, 90, 55, 45, 55, 1, 0),
(153, 'Kabutops', 'Rock', 'Water', 60, 115, 105, 65, 70, 80, 1, 0),
(154, 'Aerodactyl', 'Rock', 'Flying', 80, 105, 65, 60, 75, 130, 1, 0),
(156, 'Snorlax', 'Normal', '', 160, 110, 65, 65, 110, 30, 1, 0),
(157, 'Articuno', 'Ice', 'Flying', 90, 85, 100, 95, 125, 85, 1, 1),
(158, 'Zapdos', 'Electric', 'Flying', 90, 90, 85, 125, 90, 100, 1, 1),
(159, 'Moltres', 'Fire', 'Flying', 90, 100, 90, 125, 85, 90, 1, 1),
(160, 'Dratini', 'Dragon', '', 41, 64, 45, 50, 50, 50, 1, 0),
(161, 'Dragonair', 'Dragon', '', 61, 84, 65, 70, 70, 70, 1, 0),
(162, 'Dragonite', 'Dragon', 'Flying', 91, 134, 95, 100, 100, 80, 1, 0),
(163, 'Mewtwo', 'Psychic', '', 106, 110, 90, 154, 90, 130, 1, 1),
(166, 'Mew', 'Psychic', '', 100, 100, 100, 100, 100, 100, 1, 0)


TIPO	NORMAL	FOGO	AGUA	ELÉTRICO	GRAMA	GELO	COMBATE	POÇÃO	CHÃO	VÔO	PSÍQUICO	ERRO	ROCHA	FANTASMA	DRAGÃO	SOMBRIO	AÇO	FADA
normal	1	1	1	1	1	1	1	1	1	1	1	1	0,5	0	1	1	0,5	1
fogo	1	0,5	0,5	1	2	2	1	1	1	1	1	2	0,5	1	0,5	1	2	1
agua	1	2	0,5	1	0,5	1	1	1	2	1	1	1	2	1	0,5	1	1	1
elétrico	1	1	2	0,5	0,5	1	1	1	0	2	1	1	1	1	0,5	1	1	1
grama	1	0,5	2	1	0,5	1	1	0,5	2	0,5	1	0,5	2	1	0,5	1	0,5	1
gelo	1	0,5	0,5	1	2	0,5	1	1	2	2	1	1	1	1	2	1	0,5	1
combate	2	1	1	1	1	2	1	0,5	1	0,5	0,5	0,5	2	0	1	2	2	0,5
Poção	1	1	1	1	2	1	1	0,5	0,5	1	1	1	0,5	0,5	1	1	0	2
chão	1	2	1	2	0,5	1	1	2	1	0	1	0,5	2	1	1	1	2	1
vôo	1	1	1	0,5	2	1	2	1	1	1	1	2	0,5	1	1	1	0,5	1
psíquico	1	1	1	1	1	1	2	2	1	1	0,5	1	1	1	1	0	0,5	1
erro	1	0,5	1	1	2	1	0,5	0,5	1	0,5	2	1	1	0,5	1	2	0,5	0,5
Rocha	1	2	1	1	1	2	0,5	1	0,5	2	1	2	1	1	1	1	0,5	1
fantasma	0	1	1	1	1	1	1	1	1	1	2	1	1	2	1	0,5	1	1
Dragão	1	1	1	1	1	1	1	1	1	1	1	1	1	1	2	1	0,5	0
Sombrio	1	1	1	1	1	1	0,5	1	1	1	2	1	1	2	1	0,5	1	0,5
aço	1	0,5	0,5	0,5	1	2	1	1	1	1	1	1	2	1	1	1	0,5	2
fada	1	0,5	1	1	1	1	2	0,5	1	1	1	1	1	1	2	2	0,5	1