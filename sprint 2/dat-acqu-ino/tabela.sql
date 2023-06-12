-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE valleysTech;

USE valleysTech;

CREATE TABLE empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(100),
nomeFantasia VARCHAR(50),
cnpj CHAR(14)
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
senha VARCHAR(50),
fkEmpresa int,
constraint fkEmpresaUsuario foreign key(fkEmpresa) references empresa(id)
);

CREATE TABLE endereco (
id INT PRIMARY KEY AUTO_INCREMENT,
logradouro VARCHAR(45),
cidade VARCHAR(50),
bairro VARCHAR(50),
cep CHAR(9),
numero VARCHAR(6),
complemento VARCHAR(45),
fkEmpresa int,
constraint fkEmpresaEndereco foreign key(fkEmpresa) references empresa(id)
);


create table hectare (
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
    fkEndereco int,
    constraint fkEnderecoHectare foreign key (fkEndereco) references endereco(id)
);

CREATE TABLE sensor (
id int primary key auto_increment,
modelo varchar(45),
status_sensor varchar(45),
fkHectare int,
constraint fkHectareSensor foreign key (fkHectare) references hectare(id)
);

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	momento	DATETIME,
	fkHectare INT,
	CONSTRAINT fkHectareMedida FOREIGN KEY (fkHectare) REFERENCES hectare(id)
);
SELECT * from usuario;
select * from medida;
insert into empresa values 
(null, 'Yuri e Caleb Limpeza ME', 'Viticultura JÁ', '34428915000114');

insert into empresa values 
(null, 'Pai do Brandão LTDA', 'Viticultura TOP', '34428915000122');

	select * from usuario;

insert into usuario values
(null, 'Vitor Ramos', 'admin@admin.com', '123456', 1);

insert into usuario values
(null, 'Henrique', 'henrique@admin.com', '123', 2);

insert into endereco values
(null, 'Rua Minha Mãe', 'Cidade de Deus', 'Bovinus', '02183-99', '1155', null, 1);

insert into hectare values
(null, 'Hectar 1', 1),
(null, 'Hectar 2', 1),
(null, 'Hectar 3', 1),
(null, 'Hectar 4', 1);