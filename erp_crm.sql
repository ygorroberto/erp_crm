-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Maio-2021 às 05:08
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `erp_crm`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ativar_status` (IN `var_id` INT, IN `var_nome` VARCHAR(250))  BEGIN

	IF EXISTS (SELECT * FROM tbl_erp_contatos WHERE nome = var_nome AND id = var_id) THEN
		#SELECT 'Existe ERP';
        UPDATE tbl_erp_contatos SET status = 1 WHERE nome = var_nome AND id = var_id;
	ELSEIF EXISTS (SELECT * FROM tbl_crm_contatos WHERE nome = var_nome AND id = var_id) THEN
    	#SELECT 'Existe CRM';
		UPDATE tbl_crm_contatos SET status = 1 WHERE nome = var_nome AND id = var_id;
    ELSE
    	SELECT 'Erro de alteração';
	END IF; 
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `desativar_status` (IN `var_id` INT, IN `var_nome` VARCHAR(250))  BEGIN

	IF EXISTS (SELECT * FROM tbl_erp_contatos WHERE nome = var_nome AND id = var_id) THEN
		#SELECT 'Existe ERP';
        UPDATE tbl_erp_contatos SET status = 0 WHERE nome = var_nome AND id = var_id;
	ELSEIF EXISTS (SELECT * FROM tbl_crm_contatos WHERE nome = var_nome AND id = var_id) THEN
    	#SELECT 'Existe CRM';
		UPDATE tbl_crm_contatos SET status = 0 WHERE nome = var_nome AND id = var_id;
    ELSE
    	SELECT 'Erro de alteração';
	END IF; 
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_crm_contatos`
--

CREATE TABLE `tbl_crm_contatos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `estado` char(2) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `create_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbl_crm_contatos`
--

INSERT INTO `tbl_crm_contatos` (`id`, `nome`, `estado`, `cidade`, `email`, `create_date`, `status`) VALUES
(1, 'Nome CRM 1', 'SC', 'Urubici', 'crm1@crm.com.br', '2021-05-24 00:03:27', 0),
(2, 'Nome CRM 2', 'PR', 'Curitiba', 'crm2@crm.com.br', '2021-05-24 00:03:27', 1),
(3, 'Nome CRM 3', 'SP', 'São Paulo', 'crm3@crm.com.br', '2021-05-24 00:03:27', 1),
(4, 'Nome CRM 4', 'SC', 'Florianópolis', 'crm4@crm.com.br', '2021-05-24 00:03:27', 1),
(5, 'Nome CRM 5', 'PR', 'Londrina', 'crm5@crm.com.br', '2021-05-24 00:03:27', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_erp_contatos`
--

CREATE TABLE `tbl_erp_contatos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `estado` char(2) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `create_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbl_erp_contatos`
--

INSERT INTO `tbl_erp_contatos` (`id`, `nome`, `estado`, `cidade`, `email`, `create_date`, `status`) VALUES
(1, 'Nome ERP 1', 'MG', 'Minas Gerais', 'erp1@crm.com.br', '2021-05-24 00:05:52', 1),
(2, 'Nome ERP 2', 'RN', 'Rio Grande do Norte', 'erp2@crm.com.br', '2021-05-24 00:05:52', 1),
(3, 'Nome ERP 3', 'RS', 'Rio Grande do Sul', 'erp3@crm', '2021-05-24 00:05:52', 1),
(4, 'Nome ERP 4', 'RS', 'Passo Fundo', 'erp4@crm.com.br', '2021-05-24 00:05:52', 0),
(5, 'Nome ERP 5', 'PR', 'Campo Largo', 'erp5@crm.com.br', '2021-05-24 00:05:52', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbl_crm_contatos`
--
ALTER TABLE `tbl_crm_contatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tbl_erp_contatos`
--
ALTER TABLE `tbl_erp_contatos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_crm_contatos`
--
ALTER TABLE `tbl_crm_contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbl_erp_contatos`
--
ALTER TABLE `tbl_erp_contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
