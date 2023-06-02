CREATE DATABASE ValleysTech;

USE ValleysTech;

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
razao_social varchar(45),
nome_fantasia varchar(45),
cnpj char(14)
);

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
nome varchar(50),
email varchar(50),
senha varchar(50),
fkEmpresa int,
constraint fkEmpresa foreign key (fkEmpresa) references empresa(idEmpresa)
);

CREATE TABLE endereco (
idEndereco int primary key auto_increment,
logradouro varchar(45),
cidade varchar(45),
bairro varchar(45),
cep char(9),
numero varchar(6),
complemento varchar(45),
fkEmpresa int,
constraint fkEmpresaEnd foreign key (fkEmpresa) references empresa(idEmpresa)
);

CREATE TABLE hectare (
idHectare int primary key auto_increment,
descricao varchar(300),
fkEndereco int,
constraint fkEndereco foreign key (fkEndereco) references endereco(idEndereco),
fkEmpresa int,
constraint fkEmpresaHect foreign key (fkEmpresa) references empresa(idEmpresa)
);

CREATE TABLE sensor (
idSensor int primary key auto_increment,
modelo varchar(45),
status_sensor varchar(45),
fkHectare int,
constraint fkHectare foreign key (fkHectare) references hectare(idHectare)
);

CREATE TABLE medida (
idMedida int primary key auto_increment,
DHT11_umidade decimal,
DHT11_temperatura decimal,
momento datetime,
fkSensor int,
constraint fkSensor foreign key (fkSensor) references sensor(idSensor)
);