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
temperatura decimal(10, 2),
umidade decimal(10, 2),
tipo_leitura varchar(45),
DtLeitura_sensor datetime,
fkSensor int,
constraint pkComposta2 primary key (idLeitura_sensor, fkSensor)
);

create table tipo_sensor (
idTipo_sensor int primary key auto_increment,
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
        
alter table sensores add column fkEmpresa int,
	add constraint fkEmpresaRecursivaSensor foreign key (fkEmpresa)
		references empresa (idEmpresa);

alter table sensores add column fkTipo int,
	add constraint fkSensorTipoRecursiva foreign key (fkTipo)
		references tipo_sensor (idTipo_sensor);

desc empresa;

insert into empresa values
(null, 'ValleysTech', 'Valleys Tech', '12345671234567', 'Henrique', 'mainemail@valleystech.com', 'vt123456789');

desc usuario;

insert into usuario values 
(null, 'Fernanda', 'Caramico', '***********', '11912345678', 'fernanda.caramico@valleystech.com', 'vtCaramico', 'ativo', 1);

desc locais;

insert into locais values
(null, 'SPTECH', 1);

desc endereco;

insert into endereco values
(null, '123456789', 'Cerqueira César', 'SP', 'São Paulo', 'Rua Haddock Lobo', '595', 1);

desc tipo_sensor;

insert into tipo_sensor values
(null, 'DHT11', 'temperatura', 'umidade');

desc sensores;

insert into sensores values
(null, 'ativo', 1, 1);

desc leitura_sensor;

insert into leitura_sensor values
(null, 25.00, 65.00, 'temp/umi', '2023-04-23 14:30:00', 1);

desc parametros_local;

insert into parametros_local values
(null, 20.00, 30.00, 1, 1);

select * from empresa
join usuario on empresa.idEmpresa = usuario.fkEmpresa
join sensores on sensores.fkEmpresa = empresa.idEmpresa
join leitura_sensor on leitura_sensor.fkSensor = sensores.idSensores
join tipo_sensor on tipo_sensor.idTipo_sensor = sensores.fkTipo
join locais on locais.fkEmpresa = empresa.idEmpresa
join endereco on endereco.fkloc = locais.idLocal
join parametros_local on parametros_local.fkLoc = locais.idLocal;