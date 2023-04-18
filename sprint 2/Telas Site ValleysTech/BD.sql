create database Valleys_Tech;

use Valleys_Tech;

create table empresa (
idEmpresa int primary key auto_increment,
username varchar (15),
nome varchar(55),
CNPJ char(14),
nome_contato varchar(45),
email varchar (45),
senha varchar(45)
);

create table usuario (
idUsuario int auto_increment,
nome varchar(45),
sobrenome varchar(45),
CPF char(11),
celular char(12),
email varchar(65),
senha varchar(45),
status_funcionario varchar(15),
fkEmpresa int,
constraint pkComposta primary key (idUsuario, fkEmpresa)
) auto_increment = 10;

create table sensores (
idSensores int primary key auto_increment,
status_sensor varchar(15)
);

create table leitura_sensor (
idLeitura_sensor int auto_increment,
valores decimal(10, 2),
tipo_leitura varchar(45),
fkSensor int,
constraint pkComposta2 primary key (idLeitura_sensor, fkSensor)
);

create table tipo_sensor (
idTipo_sensor int primary key auto_increment,
tipo varchar(45),
modelo varchar(45),
metrica_leitura1 varchar(45),
metrica_leitura2 varchar(45)
);

create table locais (
idLocal int primary key auto_increment,
nomeLocal varchar(65)
);

create table endereco (
idEndereco int primary key auto_increment,
CEP char(9),
bairro varchar(50),
estado char(2),
cidade varchar(50),
rua varchar(50),
numero varchar(10)
);

create table parametros_local (
idParametros_local int primary key auto_increment,
min decimal(10, 2),
max decimal(10, 2)
);

alter table locais add column fkEmpresa INT,
	add constraint fkEmpresa_loc foreign key (fkEmpresa)
		references empresa (idEmpresa);

alter table endereco add column fkloc INT,
	add constraint fklocRecursiva foreign key (fkloc)
		references locais (idLocal);

alter table parametros_local add column fkTipo_sensor INT,
	add constraint fkTipoRecursiva foreign key (fkTipo_sensor)
		references tipo_sensor (idTipo_sensor);

alter table parametros_local add column fkLoc INT,
	add constraint fkLocRecursivaTipo foreign key (fkLoc)
		references locais (idLocal);
        
alter table sensores add column fkLoc int,
	add constraint fkLocRecursivaSensor foreign key (fkLoc)
		references locais (idLocal);

alter table sensores add column fkTipo int,
	add constraint fkSensorTipoRecursiva foreign key (fkTipo)
		references tipo_sensor (idTipo_sensor);

alter table leitura_sensor add column umidade DECIMAL (10,2);
alter table leitura_sensor add column temperatura DECIMAL (10,2);