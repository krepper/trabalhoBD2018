-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 28/11/2018 às 22:19
-- Versão do servidor: 5.7.24-0ubuntu0.18.04.1
-- Versão do PHP: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `trabalho`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ANUNCIOS`
--

CREATE TABLE `ANUNCIOS` (
  `preco` float NOT NULL,
  `disponivel` binary(1) NOT NULL,
  `POSTAGEM_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `COMENTARIOS`
--

CREATE TABLE `COMENTARIOS` (
  `id` int(11) NOT NULL,
  `mensagem` varchar(140) NOT NULL,
  `POSTAGEM_id` int(11) NOT NULL,
  `USUARIOS_usuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `CURTIDAS`
--

CREATE TABLE `CURTIDAS` (
  `POSTAGEM_id` int(11) NOT NULL,
  `USUARIOS_usuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `EVENTOS`
--

CREATE TABLE `EVENTOS` (
  `dataI` date NOT NULL,
  `dateF` date NOT NULL,
  `POSTAGEM_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `LEMBRETES`
--

CREATE TABLE `LEMBRETES` (
  `POSTAGEM_id` int(11) NOT NULL,
  `USUARIOS_usuario` varchar(200) NOT NULL,
  `horario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `MURAIS`
--

CREATE TABLE `MURAIS` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `USUARIOS_usuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `POSTAGENS`
--

CREATE TABLE `POSTAGENS` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `mensagem` varchar(140) NOT NULL,
  `media` varchar(200) DEFAULT NULL,
  `MURAIS_id` int(11) NOT NULL,
  `USUARIOS_usuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `POST_SALVOS`
--

CREATE TABLE `POST_SALVOS` (
  `POSTAGEM_id` int(11) NOT NULL,
  `USUARIOS_usuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `PRESENCAS`
--

CREATE TABLE `PRESENCAS` (
  `EVENTOS_POSTAGEM_id` int(11) NOT NULL,
  `USUARIOS_usuario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `USUARIOS`
--

CREATE TABLE `USUARIOS` (
  `usuario` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `cargo` enum('ADMNISTRADOR','MODERADOR','PADRAO') DEFAULT 'PADRAO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `ANUNCIOS`
--
ALTER TABLE `ANUNCIOS`
  ADD PRIMARY KEY (`POSTAGEM_id`);

--
-- Índices de tabela `COMENTARIOS`
--
ALTER TABLE `COMENTARIOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `POSTAGEM_id` (`POSTAGEM_id`),
  ADD KEY `USUARIOS_usuario` (`USUARIOS_usuario`);

--
-- Índices de tabela `CURTIDAS`
--
ALTER TABLE `CURTIDAS`
  ADD PRIMARY KEY (`POSTAGEM_id`,`USUARIOS_usuario`),
  ADD KEY `USUARIOS_usuario` (`USUARIOS_usuario`);

--
-- Índices de tabela `EVENTOS`
--
ALTER TABLE `EVENTOS`
  ADD PRIMARY KEY (`POSTAGEM_id`);

--
-- Índices de tabela `LEMBRETES`
--
ALTER TABLE `LEMBRETES`
  ADD PRIMARY KEY (`POSTAGEM_id`,`USUARIOS_usuario`),
  ADD KEY `USUARIOS_usuario` (`USUARIOS_usuario`);

--
-- Índices de tabela `MURAIS`
--
ALTER TABLE `MURAIS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USUARIOS_usuario` (`USUARIOS_usuario`);

--
-- Índices de tabela `POSTAGENS`
--
ALTER TABLE `POSTAGENS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USUARIOS_usuario` (`USUARIOS_usuario`);

--
-- Índices de tabela `POST_SALVOS`
--
ALTER TABLE `POST_SALVOS`
  ADD PRIMARY KEY (`POSTAGEM_id`,`USUARIOS_usuario`),
  ADD KEY `USUARIOS_usuario` (`USUARIOS_usuario`);

--
-- Índices de tabela `PRESENCAS`
--
ALTER TABLE `PRESENCAS`
  ADD PRIMARY KEY (`EVENTOS_POSTAGEM_id`,`USUARIOS_usuario`),
  ADD KEY `USUARIOS_usuario` (`USUARIOS_usuario`);

--
-- Índices de tabela `USUARIOS`
--
ALTER TABLE `USUARIOS`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `COMENTARIOS`
--
ALTER TABLE `COMENTARIOS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `MURAIS`
--
ALTER TABLE `MURAIS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `POSTAGENS`
--
ALTER TABLE `POSTAGENS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `ANUNCIOS`
--
ALTER TABLE `ANUNCIOS`
  ADD CONSTRAINT `ANUNCIOS_ibfk_1` FOREIGN KEY (`POSTAGEM_id`) REFERENCES `POSTAGENS` (`id`);

--
-- Restrições para tabelas `COMENTARIOS`
--
ALTER TABLE `COMENTARIOS`
  ADD CONSTRAINT `COMENTARIOS_ibfk_1` FOREIGN KEY (`POSTAGEM_id`) REFERENCES `POSTAGENS` (`id`),
  ADD CONSTRAINT `COMENTARIOS_ibfk_2` FOREIGN KEY (`USUARIOS_usuario`) REFERENCES `USUARIOS` (`usuario`);

--
-- Restrições para tabelas `CURTIDAS`
--
ALTER TABLE `CURTIDAS`
  ADD CONSTRAINT `CURTIDAS_ibfk_1` FOREIGN KEY (`POSTAGEM_id`) REFERENCES `POSTAGENS` (`id`),
  ADD CONSTRAINT `CURTIDAS_ibfk_2` FOREIGN KEY (`USUARIOS_usuario`) REFERENCES `USUARIOS` (`usuario`);

--
-- Restrições para tabelas `EVENTOS`
--
ALTER TABLE `EVENTOS`
  ADD CONSTRAINT `EVENTOS_ibfk_1` FOREIGN KEY (`POSTAGEM_id`) REFERENCES `POSTAGENS` (`id`);

--
-- Restrições para tabelas `LEMBRETES`
--
ALTER TABLE `LEMBRETES`
  ADD CONSTRAINT `LEMBRETES_ibfk_1` FOREIGN KEY (`POSTAGEM_id`) REFERENCES `POSTAGENS` (`id`),
  ADD CONSTRAINT `LEMBRETES_ibfk_2` FOREIGN KEY (`USUARIOS_usuario`) REFERENCES `USUARIOS` (`usuario`);

--
-- Restrições para tabelas `MURAIS`
--
ALTER TABLE `MURAIS`
  ADD CONSTRAINT `MURAIS_ibfk_1` FOREIGN KEY (`USUARIOS_usuario`) REFERENCES `USUARIOS` (`usuario`);

--
-- Restrições para tabelas `POSTAGENS`
--
ALTER TABLE `POSTAGENS`
  ADD CONSTRAINT `POSTAGENS_ibfk_1` FOREIGN KEY (`USUARIOS_usuario`) REFERENCES `USUARIOS` (`usuario`);

--
-- Restrições para tabelas `POST_SALVOS`
--
ALTER TABLE `POST_SALVOS`
  ADD CONSTRAINT `POST_SALVOS_ibfk_1` FOREIGN KEY (`POSTAGEM_id`) REFERENCES `POSTAGENS` (`id`),
  ADD CONSTRAINT `POST_SALVOS_ibfk_2` FOREIGN KEY (`USUARIOS_usuario`) REFERENCES `USUARIOS` (`usuario`);

--
-- Restrições para tabelas `PRESENCAS`
--
ALTER TABLE `PRESENCAS`
  ADD CONSTRAINT `PRESENCAS_ibfk_1` FOREIGN KEY (`EVENTOS_POSTAGEM_id`) REFERENCES `EVENTOS` (`POSTAGEM_id`),
  ADD CONSTRAINT `PRESENCAS_ibfk_2` FOREIGN KEY (`USUARIOS_usuario`) REFERENCES `USUARIOS` (`usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
