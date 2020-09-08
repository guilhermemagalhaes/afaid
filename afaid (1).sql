-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29-Nov-2016 às 16:36
-- Versão do servidor: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `afaid`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `amizade`
--

CREATE TABLE `amizade` (
  `user_id` int(11) NOT NULL,
  `seguindo_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `amizade`
--

INSERT INTO `amizade` (`user_id`, `seguindo_id`, `id`) VALUES
(5, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `local` varchar(300) DEFAULT NULL,
  `tipo_avaliacao` varchar(11) DEFAULT NULL,
  `categoria` varchar(200) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nota` float DEFAULT NULL,
  `local_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `avaliacao`
--

INSERT INTO `avaliacao` (`id`, `user`, `local`, `tipo_avaliacao`, `categoria`, `foto`, `descricao`, `data`, `nota`, `local_id`) VALUES
(1, 1, 'Legal doce', 'site', 'Acessibilidade', '', '123', '2016-11-28 16:03:25', 3, 1),
(2, 1, 'Legal doce', 'site', 'Acessibilidade', '', '123', '2016-11-28 16:03:34', 3, 1),
(3, 1, 'Legal doce2', 'site', 'Acessibilidade', '', 'asdada', '2016-11-28 16:04:04', 2, 2),
(4, 4, 'Legal doce', 'site', 'Acessibilidade', '2016.11.28-14.43.04.jpg', 'Muito bom!', '2016-11-28 16:43:04', NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `avaliacao_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `veracidade` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `comentario`
--

INSERT INTO `comentario` (`id`, `avaliacao_id`, `usuario_id`, `comentario`, `data`, `veracidade`) VALUES
(1, 3, 5, 'adfadfa', '2016-11-28 17:44:13', 'verdadeira'),
(2, 3, 5, 'adfadfad', '2016-11-28 17:44:48', 'falsa'),
(3, 3, 1, 'a', '2016-11-29 15:21:56', 'verdadeira');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mensagem` varchar(500) NOT NULL,
  `data_cadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id`, `nome`, `email`, `mensagem`, `data_cadastro`) VALUES
(1, 'EDGAR PEREIRA MAGALHAES', 'guilherme19988@gmail.com', 'l', '2016-11-12'),
(2, 'EDGAR PEREIRA MAGALHAES', 'guilherme19988@gmail.com', 'l', '2016-11-12'),
(3, 'bnbknlnkl', 'nlnklnknklnkl', '', '2016-11-25'),
(4, 'njkljkjkl', 'jhjjjj', 'pookoko', '2016-11-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncia`
--

CREATE TABLE `denuncia` (
  `id` int(11) NOT NULL,
  `denunciado_id` int(11) NOT NULL,
  `denunciante_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `avaliacao_id` int(11) NOT NULL,
  `motivacao` text NOT NULL,
  `feedback` text NOT NULL,
  `conteudoavaliacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `denuncia`
--

INSERT INTO `denuncia` (`id`, `denunciado_id`, `denunciante_id`, `data`, `avaliacao_id`, `motivacao`, `feedback`, `conteudoavaliacao`) VALUES
(1, 2, 4, '2016-11-23', 1, '    me senti ofendido', '', 'que bosta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `local`
--

CREATE TABLE `local` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `Nome` varchar(500) NOT NULL,
  `data` datetime NOT NULL,
  `Endereco` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL,
  `tipo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `local`
--

INSERT INTO `local` (`id`, `usuario_id`, `Nome`, `data`, `Endereco`, `url`, `tipo`) VALUES
(1, 3, 'Legal doce', '2016-11-28 13:49:49', '', 'www.legaldoce.com', 'site'),
(2, 3, 'Legal doce2', '2016-11-28 13:51:18', '', 'www.l2.com', 'site'),
(3, 3, 'Legal doce', '2016-11-28 15:10:30', 'Rua: Nova do Tuparoquera,18201', '', 'local');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `de_id` int(11) NOT NULL,
  `para_id` int(11) DEFAULT NULL,
  `avaliacao_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tipo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `de_id`, `para_id`, `avaliacao_id`, `status`, `tipo`) VALUES
(1, 5, 1, NULL, 1, 'amizade'),
(2, 5, 1, 3, 1, 'opiniao'),
(3, 5, 1, 3, 1, 'opiniao'),
(4, 1, 1, 3, 1, 'opiniao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `Id` int(11) NOT NULL,
  `perfil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`Id`, `perfil`) VALUES
(1, 'Administrador empresarial'),
(2, 'Usuario'),
(3, 'Usuario facebook'),
(4, 'Administrador sistema');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_cadastro` date NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `perfil` int(11) NOT NULL,
  `imagem` varchar(300) NOT NULL,
  `deficiencia` varchar(50) NOT NULL,
  `sexo` varchar(30) NOT NULL,
  `status` varchar(100) NOT NULL,
  `senha` varchar(500) NOT NULL,
  `capa` varchar(500) DEFAULT NULL,
  `sobrenome` varchar(500) NOT NULL,
  `RazaoSocial` varchar(500) DEFAULT NULL,
  `NomeFantasia` varchar(500) DEFAULT NULL,
  `CNPJ` varchar(500) DEFAULT NULL,
  `Telefone` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `data_cadastro`, `data_nascimento`, `perfil`, `imagem`, `deficiencia`, `sexo`, `status`, `senha`, `capa`, `sobrenome`, `RazaoSocial`, `NomeFantasia`, `CNPJ`, `Telefone`) VALUES
(1, 'Guilherme Batista', '1462662887096685', '2016-11-28', NULL, 3, 'http://graph.facebook.com/1462662887096685/picture?width=300&height=300', '', 'masculino', 'ativo', '7d67c4ffbb3f4f29501d51057b287a9b', 'https://scontent.xx.fbcdn.net/v/t1.0-9/p720x720/11990527_1190924014270575_7743209007957442398_n.jpg?oh=80b3d284b4f3163a4d77c190c2552ca7&oe=58CEE12E', 'Batista', NULL, NULL, NULL, NULL),
(2, 'EDGAR', 'guilherme19988@hotmail.com', '2016-11-28', NULL, 2, 'null', 'NÃ£o possuo', 'Masculino', 'ativo', '202cb962ac59075b964b07152d234b70', 'default.png', '', '', '', '', ''),
(3, 'EDGAR', 'g@g.com', '2016-11-28', NULL, 1, 'null', 'NÃ£o possuo', 'Masculino', 'ativo', '202cb962ac59075b964b07152d234b70', 'default.png', '', 'sadasd', 'asdasd', '234235345', '345234523534'),
(4, 'Lucas', 'lucas.98@gmail.com', '2016-11-28', NULL, 2, 'uploads/usuarios/416.jpg', 'Intelectual', 'Masculino', 'ativo', '202cb962ac59075b964b07152d234b70', '421.jpg', '', '', '', '', ''),
(5, 'Humberto', 'h@h.com', '2016-11-28', NULL, 2, 'uploads/usuarios/529.jpg', 'NÃ£o possuo', 'Masculino', 'ativo', '202cb962ac59075b964b07152d234b70', 'default.png', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amizade`
--
ALTER TABLE `amizade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seguindo_id` (`seguindo_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amizade`
--
ALTER TABLE `amizade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `contato`
--
ALTER TABLE `contato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `local`
--
ALTER TABLE `local`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
