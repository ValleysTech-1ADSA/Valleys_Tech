CREATE DATABASE valleysTech;

USE valleysTech;

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
razao_social varchar(55),
nome_fantasia varchar(55),
cnpj char(14)
);

CREATE TABLE tipo_usuario (
idTipo_usuario int primary key auto_increment,
cargo varchar(45) unique
);

CREATE TABLE usuario (
idUsuario int auto_increment,
nome varchar(45),
sobrenome varchar(45),
cpf char(11),
celular char(12),
email varchar(65),
senha varchar(45),
status_funcionario varchar(15),
fkEmpresa int,
constraint fkEmpresa foreign key (fkEmpresa) references empresa(idEmpresa),
constraint pkUsuario primary key (idUsuario, fkEmpresa)
);

CREATE TABLE local_empresa (
idLocal int primary key auto_increment,
Nome_local varchar(65),
fkEmpresa int,
constraint fkEmpresa2 foreign key (fkEmpresa) references empresa(idEmpresa)
);

CREATE TABLE endereco (
idEndereco int primary key auto_increment,
cep char(9),
bairro varchar(50),
estado char(2),
cidade varchar(50),
rua varchar(50),
numero varchar(10),
fkLocal int,
constraint fkLocal foreign key (fkLocal) references local_empresa(idLocal)
);

CREATE TABLE tipo_sensor (
idTipo_sensor int primary key auto_increment,
tipo_leitura1 varchar(45),
tipo_leitura2 varchar(45),
unidade_medida1 varchar(45),
unidade_medida2 varchar(45),
modelo varchar(45)
);

CREATE TABLE sensor (
idSensor int primary key auto_increment,
status_sensor varchar(15),
fkEmpresa int,
fkLocal int,
fkTipo_sensor int,
constraint fkEmpresa3 foreign key (fkEmpresa) references empresa(idEmpresa), 
constraint fkLocal2 foreign key (fkLocal) references local_empresa(idLocal),
constraint fkTipo foreign key (fkTipo_sensor) references tipo_sensor(idTipo_sensor)
);

CREATE TABLE leitura_sensor (
idLeitura int auto_increment,
leitura_tipo1 decimal(10,2),
leitura_tipo2 decimal(10,2),
dtLeitura datetime,
fkSensor int,
constraint fkSensor foreign key (fkSensor) references sensor(idSensor),
constraint pkLeitura primary key (idLeitura, fksensor)
);