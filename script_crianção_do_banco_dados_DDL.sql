# ----------------------------------------------------------------------------------------------
# ------------------------------- Banco de Dados da Loja Virtual -------------------------------
# ----------------------------------------------------------------------------------------------

create database loja_virtual;
use loja_virtual;

# --------------------------------------------------------------------------
# ---------------------------- Tabela Categoria ----------------------------
# --------------------------------------------------------------------------

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

# --------------------------------------------------------------------------
# ----------------------------- Tabela Cliente -----------------------------
# --------------------------------------------------------------------------

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


# --------------------------------------------------------------------------
# --------------------------- Tabela Fornecedor ----------------------------
# --------------------------------------------------------------------------

CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `nome_empresa` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `nome_contato` varchar(45) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `data_cadastro` date NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='	';

# --------------------------------------------------------------------------
# ----------------------------- Tabela Pedido ------------------------------
# --------------------------------------------------------------------------

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `data_pedido` date NOT NULL,
  `status_pedido` varchar(45) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `endereco_entrega` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

# --------------------------------------------------------------------------
# ----------------------------- Tabela Produto -----------------------------
# --------------------------------------------------------------------------

CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque_produto` int unsigned NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_categoria_idx` (`id_categoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

# --------------------------------------------------------------------------
# --------------------------- Tabela Item_pedido ---------------------------
# --------------------------------------------------------------------------

CREATE TABLE `item_pedido` (
  `id_item_pedido` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int unsigned NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item_pedido`),
  KEY `fk_item_pedido_pedido_idx` (`id_pedido`),
  KEY `fk_item_pedido_produto_idx` (`id_produto`),
  CONSTRAINT `fk_item_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_item_pedido_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

# --------------------------------------------------------------------------
# ---------------------------- Tabela Pagamento ----------------------------
# --------------------------------------------------------------------------

CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `valor_pagamento` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(30) NOT NULL,
  `data_pagamento` date NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `fk_pagamento_pedido1_idx` (`id_pedido`),
  CONSTRAINT `fk_pagamento_pedido1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

# --------------------------------------------------------------------------
# ------------------------ Tabela Pagamento_a_vista ------------------------
# --------------------------------------------------------------------------

CREATE TABLE `pagamento_a_vista` (
  `id_pagamento` int NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  CONSTRAINT `fk_pag_a_vista_pagamento` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# --------------------------------------------------------------------------
# ----------------------- Tabela Pagamento_parcelado -----------------------
# --------------------------------------------------------------------------

CREATE TABLE `pagamento_parcelado` (
  `id_pagamento` int NOT NULL,
  `num_parcela` int NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  CONSTRAINT `fk_pag_parcelado_pagamento` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# --------------------------------------------------------------------------
# --------------------- Tabela Produto_tem_fornecedor ----------------------
# --------------------------------------------------------------------------

CREATE TABLE `produto_tem_fornecedor` (
  `id_produto` int NOT NULL,
  `id_fornecedor` int NOT NULL,
  PRIMARY KEY (`id_produto`,`id_fornecedor`),
  KEY `fk_produto_has_fornecedor_fornecedor1_idx` (`id_fornecedor`),
  KEY `fk_produto_has_fornecedor_produto1_idx` (`id_produto`),
  CONSTRAINT `fk_produto_has_fornecedor_fornecedor1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_produto_has_fornecedor_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Server version	8.0.46
