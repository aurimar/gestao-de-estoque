-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01-Jul-2016 às 18:09
-- Versão do servidor: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`id_categoria`, `nome_categoria`) VALUES
(1, 'Sanduíches'),
(2, 'Panquecas Tradicionais'),
(3, 'Pizzas Tradicionais'),
(4, 'Pizzas Especiais'),
(5, 'Pizzas Doces'),
(6, 'Espaquetes'),
(7, 'Lasanhas'),
(8, 'Carnes'),
(9, 'Frangos'),
(10, 'Proção'),
(11, 'Sobremesa'),
(12, 'Bebidas'),
(13, 'Cervejas'),
(14, 'Sucos'),
(15, 'Suco da fruta'),
(16, 'Doces'),
(23, 'Outra');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `tipo_cliente` int(11) NOT NULL,
  `numero_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`id_cliente`, `nome_cliente`, `tipo_cliente`, `numero_cliente`) VALUES
(1, 'C. 11', 0, 14),
(2, 'C. 22', 1, 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_compra`
--

CREATE TABLE `tbl_compra` (
  `id_compra` int(11) NOT NULL,
  `data_compra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `preco_compra` decimal(10,2) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_compra`
--

INSERT INTO `tbl_compra` (`id_compra`, `data_compra`, `preco_compra`, `id_cliente`) VALUES
(18, '2016-06-27 20:36:21', '75.00', 1),
(19, '2016-06-28 14:19:52', NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_itens_compra_produto`
--

CREATE TABLE `tbl_itens_compra_produto` (
  `id_item` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_itens_compra_produto`
--

INSERT INTO `tbl_itens_compra_produto` (`id_item`, `id_compra`, `id_produto`, `quantidade_produto`) VALUES
(17, 18, 1, 2),
(18, 18, 35, 3),
(19, 18, 12, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produto`
--

CREATE TABLE `tbl_produto` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `preco_produto` decimal(10,2) NOT NULL,
  `estoque_produto` int(11) NOT NULL,
  `especial_produto` varchar(100) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_produto`
--

INSERT INTO `tbl_produto` (`id_produto`, `nome_produto`, `preco_produto`, `estoque_produto`, `especial_produto`, `id_categoria`) VALUES
(1, 'Refrigerante Lata', '3.50', 0, NULL, 12),
(2, 'Refrigerante 1 Litro', '4.50', 0, '', 12),
(3, 'Refrigerante 2 Litros', '7.00', 0, '', 12),
(4, 'Água Mineral com gás', '2.00', 0, 'Água Mineral com gás', 12),
(5, 'Água Mineral sem gás', '1.50', 0, 'Água Mineral sem gás', 12),
(6, 'Mousse', '2.00', 0, 'Maracucujá', 11),
(7, 'Pudim', '2.50', 0, '', 11),
(8, 'Torta de Chocolate', '4.00', 0, '', 11),
(9, 'Schin Lata', '2.50', 0, '', 13),
(10, 'Schin Latão', '3.00', 0, '', 13),
(11, 'Skol Lata', '4.00', 0, '', 13),
(12, 'Skol Latão', '3.50', 0, '', 13),
(13, 'Acerola sem leite', '4.00', 0, '', 14),
(14, 'Acerola com leite', '4.50', 0, '', 14),
(15, 'Cajú sem leite', '4.50', 0, '', 14),
(16, 'Cajú com leite', '4.00', 0, '', 14),
(17, 'Cajá sem leite', '4.00', 0, '', 14),
(18, 'Cajá com leite', '4.50', 0, '', 14),
(19, 'Graviola sem leite', '4.00', 0, '', 14),
(20, 'Graviola com leite', '4.50', 0, '', 14),
(21, 'Goiaba sem leite', '4.00', 0, '', 14),
(22, 'Goiaba com leite', '4.50', 0, '', 14),
(23, 'Abacaxi com Hortelã sem leite', '4.00', 0, '', 14),
(24, 'Abacaxi com Hortelã com leite', '4.50', 0, '', 14),
(25, 'Laranja', '4.50', 0, '', 15),
(26, 'Batata Frita', '7.00', 0, '', 10),
(27, 'Filet com Fritas', '15.00', 0, '', 10),
(28, 'Arroz Branco', '5.00', 0, '', 10),
(29, 'Purê de Batata', '5.00', 0, '', 10),
(30, 'Espaquete à bolonhesa', '10.90', 0, 'Espaquete, molho de carne', 6),
(31, 'Espaquete 4 queijos', '11.90', 0, 'Espaquete, molho branco, provolone, parmessão, muzzarela, requeijão cremoso', 6),
(32, 'Espaquete com molho de Camarão', '13.00', 0, 'Espaquete, molho de camarão, salsinha', 6),
(33, 'Lasanha à Bolonhesa', '20.90', 0, 'Massa, molho de carne, molho branco, muzzarela, parmesão fresco, orégano', 7),
(34, 'Lasanha de Frango', '20.90', 0, 'Massa, molho de frango, molho branco, muzzarela, parmesão fresco, orégano', 7),
(35, 'Lasanha 4 Queijos', '20.90', 0, 'Massa, molho de tomates, muzzarela, catupiry, provolone, parmesão fresco, orégano', 7),
(36, 'Lasanha Camarão com Catupiry', '24.90', 0, 'Massa, molho de camarão, molho branco, muzzarela, catupiry, parmesão fresco, orégano', 7),
(37, 'Filé de frango à parmegiana', '24.90', 0, 'Filé de frango á milanesa, muzzarela, molho tomate, ervilhas, parmessão, esoaguete ao sugo', 9),
(38, 'Strogonoff de frango', '25.90', 0, 'Tiras de frango grelhado e flambados, molho rosé, cogumelos, arroz e batata palha', 9),
(39, 'Filé à parmegiana', '26.90', 0, 'Filé milanesa, muzzarela, molho tomate, ervilha, parmessão, espaquete ao sugo', 8),
(40, 'Filé Moda', '29.90', 0, 'Filé grelhado, molho ao vilho tinto arroz, presunto, fritas', 8),
(41, 'Strogonoff de filé', '29.90', 0, 'Tiras de filé grelhado e flambados, molho rosado,cogumelos, arroz branco e batata palha', 8),
(42, 'Filé ao molho madeira', '31.20', 0, 'Filé alto grelhado ao molho madeira com cogumelos, arroz, salada, purê de batatas', 8),
(43, 'Panquecas Carne com catupiry', '7.50', 0, 'Molho bolonhesa, muzzarela, orégano, azeitona, e permesão', 2),
(44, 'Panquecas Frango com catupiry', '7.50', 0, 'Frango com catupriy, muzzarela, salsa, azeitona e parmesão', 2),
(45, 'Panquecas Camarão catupriy', '8.90', 0, 'Camarão catupriy, muzzarela, salsa, azeitona e parmesão', 2),
(46, 'Panquecas Pepperoni', '8.90', 0, 'Pepperoni, mussarela, orégano, azeitona e parmesão', 2),
(47, 'Panquecas Quatro Queijos', '8.00', 0, 'Mussarela, parmesão, provolone e catupiry', 2),
(48, 'Dogão Completo', '4.00', 0, 'Pão, saisicha, carne, moida, milho, ervilha, salada, e queijo ralado', 1),
(49, 'Misto', '2.50', 0, 'Pão de caixa ou bola, queijo e presunto', 1),
(50, 'Hamburguer Simples', '3.00', 0, 'Pão bola, carne hamburguer, queijo e salada', 1),
(51, 'Hamburguer Completo', '5.00', 0, 'Pão bola, carne hamburquer, queijo, presunto, ovos, salada', 1),
(52, 'X-Bacon', '6.00', 0, 'Pão bola, carne hamburquer, queijo, presunto, ovo, bacon e salada', 1),
(53, 'X-Calabresa', '6.00', 0, 'Pão bola, carne hamburquer, queijo, presunto, ovo, calabresa e salada', 1),
(54, 'X-Frango', '6.50', 0, 'Pão bola, frango  grelhado, queijo, presunto, ovo e salada', 1),
(55, 'X-Tudo', '7.00', 0, 'Pão bola, carne hamburquer, queijo, presunto, calabreza, ovo, bacon e salada', 1),
(56, 'Médias 6 fatias Doces', '18.00', 0, '2 sabores', 5),
(57, 'Grandes 8 fatias Doces', '23.00', 0, '3 sabores', 5),
(58, 'Gigantes 12 fatias Doces', '28.00', 0, '4 sabores', 5),
(59, 'Médias 6 fatias Especiais', '18.00', 0, '2 sabores', 4),
(60, 'Grandes 8 fatias Especiais', '23.00', 0, '3 sabores', 4),
(61, 'Gigantes 12 fatias Especiais', '28.00', 0, '4 sabores', 4),
(62, 'Médias 6 fatias Fradicionais', '18.00', 0, '2 sabores', 3),
(63, 'Grandes 8 fatias Fradicionais', '23.00', 0, '3 sabores', 3),
(64, 'Gigantes 12 fatias Fradicionais', '28.00', 0, '4 sabores', 3),
(65, 'Tic Tac', '1.50', 0, 'Sabroes', 16),
(66, 'Bolo', '4.00', 0, 'Sabores', 16),
(67, 'Truta', '1.50', 0, 'Sabores', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `nome_cliente` (`nome_cliente`);

--
-- Indexes for table `tbl_compra`
--
ALTER TABLE `tbl_compra`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indexes for table `tbl_itens_compra_produto`
--
ALTER TABLE `tbl_itens_compra_produto`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `tbl_produto`
--
ALTER TABLE `tbl_produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_compra`
--
ALTER TABLE `tbl_compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tbl_itens_compra_produto`
--
ALTER TABLE `tbl_itens_compra_produto`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tbl_produto`
--
ALTER TABLE `tbl_produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
