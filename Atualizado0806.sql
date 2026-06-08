-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.42 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para clinica_medica
DROP DATABASE IF EXISTS `clinica_medica`;
CREATE DATABASE IF NOT EXISTS `clinica_medica` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinica_medica`;

-- Copiando estrutura para tabela clinica_medica.consulta
DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `status` enum('agendada','realizada','cancelada') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'agendada',
  `medico_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  `consultorio_id` int NOT NULL,
  PRIMARY KEY (`id_consulta`) USING BTREE,
  KEY `fk_consulta_medico` (`medico_id`),
  KEY `fk_consulta_paciente` (`paciente_id`),
  KEY `consultorio_id` (`consultorio_id`),
  CONSTRAINT `fk_consulta_consultorio` FOREIGN KEY (`consultorio_id`) REFERENCES `consultorio` (`id_consultorio`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_consulta_medico` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id_medico`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_consulta_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.consulta: ~15 rows (aproximadamente)
INSERT INTO `consulta` (`id_consulta`, `data`, `hora`, `status`, `medico_id`, `paciente_id`, `consultorio_id`) VALUES
	(1, '2025-05-05', '08:00:00', 'realizada', 1, 1, 3),
	(2, '2025-05-06', '09:30:00', 'realizada', 2, 2, 1),
	(3, '2025-05-07', '10:00:00', 'realizada', 3, 3, 6),
	(4, '2025-05-08', '11:00:00', 'realizada', 4, 4, 2),
	(5, '2025-05-09', '13:00:00', 'cancelada', 5, 5, 5),
	(6, '2025-05-12', '14:00:00', 'realizada', 6, 6, 7),
	(7, '2025-05-13', '15:00:00', 'realizada', 7, 7, 8),
	(8, '2025-05-14', '08:30:00', 'realizada', 8, 8, 4),
	(9, '2025-05-15', '09:00:00', 'cancelada', 9, 9, 9),
	(10, '2025-05-16', '10:30:00', 'realizada', 10, 10, 10),
	(11, '2025-06-02', '08:00:00', 'realizada', 1, 11, 3),
	(12, '2025-06-03', '09:00:00', 'realizada', 3, 12, 6),
	(13, '2025-06-04', '10:00:00', 'realizada', 5, 13, 5),
	(14, '2025-06-09', '11:00:00', 'agendada', 2, 14, 1),
	(15, '2025-06-10', '14:00:00', 'agendada', 8, 15, 4);

-- Copiando estrutura para tabela clinica_medica.consultorio
DROP TABLE IF EXISTS `consultorio`;
CREATE TABLE IF NOT EXISTS `consultorio` (
  `id_consultorio` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL DEFAULT '0',
  `andar` int NOT NULL DEFAULT '0',
  `capacidade` int DEFAULT NULL,
  PRIMARY KEY (`id_consultorio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.consultorio: ~10 rows (aproximadamente)
INSERT INTO `consultorio` (`id_consultorio`, `numero`, `andar`, `capacidade`) VALUES
	(1, 101, 1, 4),
	(2, 102, 1, 3),
	(3, 201, 2, 5),
	(4, 202, 2, 4),
	(5, 301, 3, 6),
	(6, 302, 3, 4),
	(7, 401, 4, 3),
	(8, 402, 4, 5),
	(9, 501, 5, 6),
	(10, 502, 5, 4);

-- Copiando estrutura para tabela clinica_medica.convenio
DROP TABLE IF EXISTS `convenio`;
CREATE TABLE IF NOT EXISTS `convenio` (
  `id_convenio` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `registro_ans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone_contato` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_convenio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.convenio: ~6 rows (aproximadamente)
INSERT INTO `convenio` (`id_convenio`, `nome`, `registro_ans`, `telefone_contato`) VALUES
	(1, 'Unimed', '123456', '0800 722 4848'),
	(2, 'Bradesco Saúde', '654321', '0800 701 2020'),
	(3, 'SulAmérica', '789012', '0800 722 0099'),
	(4, 'Amil', '321654', '0800 722 2645'),
	(5, 'Hapvida', '456789', '0800 280 0040'),
	(6, 'NotreDame', '987654', '0800 887 0900');

-- Copiando estrutura para tabela clinica_medica.especialidade
DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `id_especialidade` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.especialidade: ~8 rows (aproximadamente)
INSERT INTO `especialidade` (`id_especialidade`, `nome`, `descricao`) VALUES
	(1, 'Clínica Geral', 'Atendimento geral de adultos'),
	(2, 'Pediatria', 'Atendimento de crianças e adolescentes'),
	(3, 'Cardiologia', 'Doenças do coração e sistema circulatório'),
	(4, 'Dermatologia', 'Doenças da pele'),
	(5, 'Ortopedia', 'Doenças do sistema musculoesquelético'),
	(6, 'Neurologia', 'Doenças do sistema nervoso'),
	(7, 'Ginecologia', 'Saúde da mulher e sistema reprodutor feminino'),
	(8, 'Oftalmologia', 'Doenças dos olhos e visão');

-- Copiando estrutura para tabela clinica_medica.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `telefone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `endereco` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `salario` double NOT NULL DEFAULT (0),
  `cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.funcionario: ~6 rows (aproximadamente)
INSERT INTO `funcionario` (`id_funcionario`, `nome`, `telefone`, `email`, `endereco`, `salario`, `cargo`) VALUES
	(1, 'Alexandre Silva', '(35) 98874-5321', 'alexandre.silva@clinica.com.br', 'Rua Sebastião Arnaldo, 456 – Bairro Outro Olhar', 3000.45, 'Atendente'),
	(2, 'Yasmin Guarini', '(33) 3445-6789', 'yasmin.guarini@clinica.com.br', 'Rua Bem Vividos, 678 – Centro', 2400.87, 'Atendente'),
	(3, 'Roberto Andrade', '(35) 99123-4567', 'roberto.andrade@clinica.com.br', 'Av. Brasil, 1200 – Jardim Europa', 4500, 'Coordenador Administrativo'),
	(4, 'Fernanda Costa', '(35) 98765-0011', 'fernanda.costa@clinica.com.br', 'Rua das Flores, 89 – Bairro Santo Antônio', 2800, 'Recepcionista'),
	(5, 'Marcelo Teixeira', '(33) 99876-5432', 'marcelo.teixeira@clinica.com.br', 'Rua Tiradentes, 330 – Centro', 3200, 'Técnico em Enfermagem'),
	(6, 'Patrícia Mendonça', '(35) 98001-2233', 'patricia.mendonca@clinica.com.br', 'Rua Sete de Setembro, 210 – Vila Nova', 3100, 'Técnico em Enfermagem');

-- Copiando estrutura para tabela clinica_medica.item_receita
DROP TABLE IF EXISTS `item_receita`;
CREATE TABLE IF NOT EXISTS `item_receita` (
  `id_itemReceita` int NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosagem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posologia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receita_id` int NOT NULL,
  PRIMARY KEY (`id_itemReceita`) USING BTREE,
  KEY `fk_item_receita_receita` (`receita_id`),
  CONSTRAINT `fk_item_receita_receita` FOREIGN KEY (`receita_id`) REFERENCES `receita` (`id_receita`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.item_receita: ~15 rows (aproximadamente)
INSERT INTO `item_receita` (`id_itemReceita`, `medicamento`, `dosagem`, `posologia`, `receita_id`) VALUES
	(1, 'Amoxicilina', '500 mg', '1 cápsula a cada 8h por 7 dias', 1),
	(2, 'Ibuprofeno', '600 mg', '1 comprimido a cada 12h por 3 dias (se dor)', 1),
	(3, 'Betametasona creme', '0,1%', 'Aplicar fina camada na área afetada 2x/dia', 2),
	(4, 'Loratadina', '10 mg', '1 comprimido à noite por 10 dias', 2),
	(5, 'Atenolol', '50 mg', '1 comprimido pela manhã', 3),
	(6, 'AAS', '100 mg', '1 comprimido ao dia durante as refeições', 3),
	(7, 'Losartana', '50 mg', '1 comprimido pela manhã', 4),
	(8, 'Hidroclorotiazida', '25 mg', '1 comprimido pela manhã junto com Losartana', 4),
	(9, 'Sumatriptano', '50 mg', '1 comprimido no início da crise; repetir após 2h se necessário', 5),
	(10, 'Metoclopramida', '10 mg', '1 comprimido se náusea', 5),
	(11, 'Salbutamol spray', '100 mcg', '2 jatos a cada 6h por 5 dias', 6),
	(12, 'Prednisolona', '20 mg', '1 comprimido ao dia por 5 dias', 6),
	(13, 'Metformina', '850 mg', '1 comprimido com o café da manhã e jantar', 7),
	(14, 'Amoxicilina', '250 mg/5ml', '5 ml a cada 8h por 7 dias (suspensão pediátrica)', 8),
	(15, 'Paracetamol', '200 mg/ml', '2 ml a cada 6h se febre ou dor', 8);

-- Copiando estrutura para tabela clinica_medica.medico
DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crm` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `especialidade_id` int NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `FK_medico_especialidade` (`especialidade_id`),
  CONSTRAINT `fk_medico_especialidade` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.medico: ~10 rows (aproximadamente)
INSERT INTO `medico` (`id_medico`, `nome`, `telefone`, `crm`, `especialidade_id`, `email`, `endereco`) VALUES
	(1, 'Dr. Carlos Eduardo Ramos', '(35) 98787-3244', 'CRM/MG 344565', 3, 'carlos.ramos@clinica.com.br', 'Rua Pinheiros, 560 – Jardim América'),
	(2, 'Dra. Helena Martins', '(35) 99234-5678', 'CRM/MG 223348', 4, 'helena.martins@clinica.com.br', 'Av. Paulista, 1800 – Centro'),
	(3, 'Dra. Jussara Fernandes', '(33) 98901-2345', 'CRM/MG 234523', 3, 'jussara.fernandes@clinica.com.br', 'Rua Goiás, 77 – Bairro Nova Era'),
	(4, 'Dr. André Luiz Braga', '(35) 99345-6789', 'CRM/MG 112233', 1, 'andre.braga@clinica.com.br', 'Rua Minas Gerais, 430 – Centro'),
	(5, 'Dra. Camila Souza', '(35) 98456-7890', 'CRM/MG 445566', 2, 'camila.souza@clinica.com.br', 'Rua Infantil, 250 – Jardim das Crianças'),
	(6, 'Dr. Ricardo Pimentel', '(33) 99567-8901', 'CRM/MG 667788', 5, 'ricardo.pimentel@clinica.com.br', 'Av. Ortopédica, 900 – Vila Saúde'),
	(7, 'Dra. Letícia Alves', '(35) 98678-9012', 'CRM/MG 889900', 6, 'leticia.alves@clinica.com.br', 'Rua Neuronal, 45 – Bairro Ciência'),
	(8, 'Dra. Paula Regina Cunha', '(35) 99789-0123', 'CRM/MG 101112', 7, 'paula.cunha@clinica.com.br', 'Rua Esperança, 130 – Vila Feminina'),
	(9, 'Dr. Sérgio Monteiro', '(33) 98890-1234', 'CRM/MG 131415', 8, 'sergio.monteiro@clinica.com.br', 'Rua da Visão, 88 – Centro Óptico'),
	(10, 'Dr. Fábio Nascimento', '(35) 99901-2345', 'CRM/MG 161718', 1, 'fabio.nascimento@clinica.com.br', 'Av. Geral, 500 – Bairro Clínico');

-- Copiando estrutura para tabela clinica_medica.paciente
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `convenio_id` int DEFAULT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_paciente`) USING BTREE,
  KEY `fk_paciente_convenio` (`convenio_id`),
  CONSTRAINT `fk_paciente_convenio` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id_convenio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.paciente: ~15 rows (aproximadamente)
INSERT INTO `paciente` (`id_paciente`, `nome`, `data_nascimento`, `cpf`, `convenio_id`, `telefone`, `email`, `endereco`) VALUES
	(1, 'João Silva', '1985-03-20', '111.222.333-44', 1, '(35) 99111-2222', 'joao.silva@email.com', 'Rua das Acácias, 100 – Centro'),
	(2, 'Maria Oliveira', '2001-07-15', '555.666.777-88', 2, '(35) 98222-3333', 'maria.oliveira@email.com', 'Rua das Orquídeas, 200 – Jardim Belo'),
	(3, 'Lucas Pereira', '1998-11-02', '999.000.111-22', NULL, '(33) 97333-4444', 'lucas.pereira@email.com', 'Av. dos Ipês, 300 – Vila Nova'),
	(4, 'Ana Beatriz Costa', '1975-05-10', '123.456.789-00', 3, '(35) 96444-5555', 'ana.costa@email.com', 'Rua Primavera, 400 – Bosque'),
	(5, 'Pedro Henrique Lima', '1990-08-25', '234.567.890-11', 4, '(35) 95555-6666', 'pedro.lima@email.com', 'Rua Outono, 500 – Parque'),
	(6, 'Fernanda Gomes', '2010-02-18', '345.678.901-22', 1, '(33) 94666-7777', 'fernanda.gomes@email.com', 'Rua Inverno, 600 – Centro'),
	(7, 'Rafael Souza', '1965-12-30', '456.789.012-33', 5, '(35) 93777-8888', 'rafael.souza@email.com', 'Rua Verão, 700 – Vila Rica'),
	(8, 'Juliana Martins', '1988-04-07', '567.890.123-44', 2, '(35) 92888-9999', 'juliana.martins@email.com', 'Av. das Rosas, 800 – Bairro Norte'),
	(9, 'Carlos Alberto Nunes', '1952-09-14', '678.901.234-55', 6, '(33) 91999-0000', 'carlos.nunes@email.com', 'Rua da Paz, 900 – Centro'),
	(10, 'Isabela Rodrigues', '2005-06-22', '789.012.345-66', 3, '(35) 90000-1111', 'isabela.rodrigues@email.com', 'Rua Alegria, 1000 – Jardim Sul'),
	(11, 'Marcelo Almeida', '1979-01-05', '890.123.456-77', NULL, '(35) 99101-1212', 'marcelo.almeida@email.com', 'Rua Esperança, 1100 – Bairro Leste'),
	(12, 'Tatiane Ferreira', '1994-10-11', '901.234.567-88', 4, '(33) 98202-2323', 'tatiane.ferreira@email.com', 'Av. Liberdade, 1200 – Centro'),
	(13, 'Bruno Carvalho', '1983-03-03', '012.345.678-99', 1, '(35) 97303-3434', 'bruno.carvalho@email.com', 'Rua Independência, 1300 – Vila Velha'),
	(14, 'Renata Pinto', '2008-11-28', '111.333.555-77', 5, '(35) 96404-4545', 'renata.pinto@email.com', 'Rua das Palmeiras, 1400 – Parque Real'),
	(15, 'Eduardo Campos', '1970-07-04', '222.444.666-88', 6, '(33) 95505-5656', 'eduardo.campos@email.com', 'Av. Central, 1500 – Centro Novo');

-- Copiando estrutura para tabela clinica_medica.prontuario
DROP TABLE IF EXISTS `prontuario`;
CREATE TABLE IF NOT EXISTS `prontuario` (
  `id_prontuario` int NOT NULL AUTO_INCREMENT,
  `diagnostico` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_sintomas` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data_registro` date NOT NULL,
  `consulta_id` int NOT NULL,
  PRIMARY KEY (`id_prontuario`) USING BTREE,
  KEY `fk_prontuario_consulta` (`consulta_id`),
  CONSTRAINT `fk_prontuario_consulta` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id_consulta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.prontuario: ~11 rows (aproximadamente)
INSERT INTO `prontuario` (`id_prontuario`, `diagnostico`, `descricao_sintomas`, `data_registro`, `consulta_id`) VALUES
	(1, 'Faringite bacteriana aguda', 'Dor de garganta há 3 dias, febre baixa. Prescrito antibiótico.', '2025-05-05', 1),
	(2, 'Dermatite atópica', 'Lesões pruriginosas em antebraços e pescoço. Indicado corticoide tópico.', '2025-05-06', 2),
	(3, 'Angina pectoris estável', 'Dor no peito aos esforços. Solicitado ECG e teste ergométrico.', '2025-05-07', 3),
	(4, 'Hipertensão arterial sistêmica', 'Pressão 160/100 mmHg. Ajuste de medicação anti-hipertensiva.', '2025-05-08', 4),
	(5, 'Entorse do tornozelo', 'Queda com torção do pé direito. Raio-X sem fratura. Imobilização e repouso.', '2025-05-12', 6),
	(6, 'Enxaqueca sem aura', 'Cefaleia unilateral pulsátil há 2 dias, fotofobia. Prescrito analgésico.', '2025-05-13', 7),
	(7, 'Síndrome do ovário policístico', 'Irregularidade menstrual e acne. Exames hormonais solicitados.', '2025-05-14', 8),
	(8, 'Consulta de rotina – sem queixas', 'Paciente assintomático. Exames de rotina solicitados. Retorno em 6 meses.', '2025-05-16', 10),
	(9, 'Bronquite aguda', 'Tosse produtiva há 5 dias, chiado no peito. Broncodilatador prescrito.', '2025-06-02', 11),
	(10, 'Diabetes mellitus tipo 2', 'Glicemia 215 mg/dL em jejum. Iniciado metformina e dieta controlada.', '2025-06-03', 12),
	(11, 'Otite média aguda', 'Criança com dor de ouvido e febre há 2 dias. Antibiótico prescrito.', '2025-06-04', 13);

-- Copiando estrutura para tabela clinica_medica.receita
DROP TABLE IF EXISTS `receita`;
CREATE TABLE IF NOT EXISTS `receita` (
  `id_receita` int NOT NULL AUTO_INCREMENT,
  `data_emissao` date NOT NULL,
  `observacoes` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consulta_id` int NOT NULL,
  PRIMARY KEY (`id_receita`) USING BTREE,
  KEY `fk_receita_consulta` (`consulta_id`),
  CONSTRAINT `fk_receita_consulta` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id_consulta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.receita: ~1 rows (aproximadamente)
INSERT INTO `receita` (`id_receita`, `data_emissao`, `observacoes`, `consulta_id`) VALUES
	(1, '2025-05-05', 'Tomar com água em jejum. Evitar álcool.', 1),
	(2, '2025-05-06', 'Aplicar na área afetada 2x ao dia. Evitar sol direto.', 2),
	(3, '2025-05-07', 'Uso contínuo. Retornar se piorar a dor torácica.', 3),
	(4, '2025-05-08', 'Tomar pela manhã. Monitorar pressão diariamente.', 4),
	(5, '2025-05-13', 'Tomar na crise. Máximo 2 comprimidos por dia.', 7),
	(6, '2025-06-02', 'Usar inalador a cada 6h nos primeiros 3 dias.', 11),
	(7, '2025-06-03', 'Tomar com a primeira refeição do dia. Retorno em 30 dias.', 12),
	(8, '2025-06-04', 'Administrar a cada 12h. Completar os 7 dias de tratamento.', 13);

-- Copiando estrutura para tabela clinica_medica.solicitacao_exame
DROP TABLE IF EXISTS `solicitacao_exame`;
CREATE TABLE IF NOT EXISTS `solicitacao_exame` (
  `id_solicitacaoExame` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `resultado` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consulta_id` int NOT NULL,
  `tipo_exame_id` int NOT NULL,
  `funcionario_id` int NOT NULL,
  PRIMARY KEY (`id_solicitacaoExame`) USING BTREE,
  KEY `fk_solicitacao_consulta` (`consulta_id`),
  KEY `fk_solicitacao_tipo_exame` (`tipo_exame_id`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `fk_solicitacao_consulta` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id_consulta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitacao_exame_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitacao_tipo_exame` FOREIGN KEY (`tipo_exame_id`) REFERENCES `tipo_exame` (`id_tipoExame`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.solicitacao_exame: ~8 rows (aproximadamente)
INSERT INTO `solicitacao_exame` (`id_solicitacaoExame`, `data`, `resultado`, `consulta_id`, `tipo_exame_id`, `funcionario_id`) VALUES
	(1, '2025-05-05', 'Leucocitose com desvio à esquerda. Confirma infecção bacteriana.', 1, 1, 1),
	(2, '2025-05-07', 'Ritmo sinusal, sem alterações isquêmicas agudas.', 3, 2, 2),
	(3, '2025-05-07', 'Campos pulmonares sem consolidações. Coração levemente aumentado.', 3, 3, 1),
	(4, '2025-05-08', NULL, 4, 4, 5),
	(5, '2025-05-16', 'Glicemia 98 mg/dL – dentro dos valores de referência.', 10, 5, 6),
	(6, '2025-06-02', NULL, 11, 3, 5),
	(7, '2025-06-03', 'Glicemia 215 mg/dL – diabetes confirmado.', 12, 5, 6),
	(8, '2025-06-04', NULL, 13, 1, 2);

-- Copiando estrutura para tabela clinica_medica.tipo_exame
DROP TABLE IF EXISTS `tipo_exame`;
CREATE TABLE IF NOT EXISTS `tipo_exame` (
  `id_tipoExame` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` double NOT NULL,
  `funcionario_id` int NOT NULL,
  `consultorio_id` int DEFAULT NULL,
  PRIMARY KEY (`id_tipoExame`) USING BTREE,
  KEY `funcionario_id` (`funcionario_id`),
  KEY `consultorio_id` (`consultorio_id`),
  CONSTRAINT `fk_tipo_exame_consultorio` FOREIGN KEY (`consultorio_id`) REFERENCES `consultorio` (`id_consultorio`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_exame_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela clinica_medica.tipo_exame: ~6 rows (aproximadamente)
INSERT INTO `tipo_exame` (`id_tipoExame`, `nome`, `descricao`, `valor`, `funcionario_id`, `consultorio_id`) VALUES
	(1, 'Hemograma Completo', 'Análise das células do sangue', 345.99, 2, 2),
	(2, 'Eletrocardiograma', 'Registro da atividade elétrica do coração', 245.76, 2, 5),
	(3, 'Raio-X Tórax', 'Imagem radiológica da região torácica', 132.65, 1, 6),
	(4, 'Ultrassom Abdominal', 'Imagem ultrassonográfica dos órgãos abdominais', 280, 5, 3),
	(5, 'Glicemia em Jejum', 'Dosagem de glicose no sangue após período de jejum', 89.9, 6, 1),
	(6, 'Tomografia de Crânio', 'Tomografia computadorizada da região craniana', 890, 3, 9);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
