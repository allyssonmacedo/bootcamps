-- Criando o banco de dados
CREATE DATABASE	ecommerce;
USE ecommerce;

-- Criando a tabela Clientes
CREATE TABLE Clientes (
idCliente INT PRIMARY KEY NOT NULL, 
Tipo ENUM('PJ', 'PF')
);

-- Criando a tabela Vendedor
CREATE TABLE Vendedor (
idVendedor INT NOT NULL PRIMARY KEY, 
Nome VARCHAR(45) NOT NULL,
Loja VARCHAR(45) NOT NULL
);

-- Criando a tabela Produto
CREATE TABLE Produto (
idProduto INT PRIMARY KEY NOT NULL, 
Categoria VARCHAR(45) NOT NULL,
Quantidade INT NOT NULL, 
Preço FLOAT NOT NULL
);

-- Criando a tabela Pagamentos
CREATE TABLE Pagamento (
idPagamento INT PRIMARY KEY NOT NULL,
Método_pagamento ENUM("Cartão", "Boleto", "PIX"),
Data_venc DATE NOT NULL,
Cod_pagamento INT NOT NULL UNIQUE
);

-- Criando a tabela Fornecedor 
CREATE TABLE Fornecedor (
idFornecedor INT PRIMARY KEY NOT NULL,
Razão_social VARCHAR(45) NOT NULL UNIQUE, 
CNPJ CHAR(14) NOT NULL UNIQUE,
Localidade VARCHAR(45),
CEP CHAR(8)
);

-- Criando a tabela de Entrega
CREATE TABLE Entrega (
idEntrega INT NOT NULL PRIMARY KEY,
Data_entrega DATE NOT NULL, 
Data_envio DATE NOT NULL,
Cod_rastreio INT NOT NULL UNIQUE
);

-- Criando tabela Pedidos
CREATE TABLE Pedidos (
idPedido INT PRIMARY KEY AUTO_INCREMENT, 
Status_pedido ENUM('Em andamento', 'cancelado', 'finalizado') DEFAULT 'Em andamento',
Desc_pedido VARCHAR(45) NOT NULL,
Frete FLOAT DEFAULT 0, 
Preço FLOAT, 
Data_pedido DATE NOT NULL,
idCliente INT,
idProduto INT,
idVendedor INT, 
CONSTRAINT fk_idcliente FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
CONSTRAINT fk_idproduto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
CONSTRAINT fk_idvendedor FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor)
);

-- Criando as tabelas herança de Clientes
CREATE TABLE Cliente_PF (
idCliente INT,
Nome VARCHAR(20) NOT NULL,
Sobrenome VARCHAR(20),
CPF CHAR(11) NOT NULL UNIQUE,
Endereço VARCHAR(45), 
Data_nasc DATE NOT NULL,
CONSTRAINT fk_cliente_pf FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Cliente_PJ (
idCliente INT,
CNPJ CHAR(11) NOT NULL UNIQUE,
Razão_social VARCHAR(45) NOT NULL,
Endereço VARCHAR(45),
CONSTRAINT fk_cliente_pj FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Criando tabelas n:m
CREATE TABLE PedidosPagamentos (
idCliente INT,
CNPJ CHAR(11) NOT NULL UNIQUE,
Razão_social VARCHAR(45) NOT NULL,
Endereço VARCHAR(45),
CONSTRAINT fk_cliente_pj FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

INSERT INTO Clientes (idCliente, Tipo) values
(1,'PF'),
(2,'PF');


INSERT INTO Cliente_Pf (idCliente, Nome, Sobrenome, CPF, Endereço, Data_nasc) values
(1,'Jonny','MacGillacolm',12345678910,'Mallard',1/28/2018),
(2,'Retha','Wiltshaw',12345678911,'Center',7/2/2012);

select * from Cliente_PF;


