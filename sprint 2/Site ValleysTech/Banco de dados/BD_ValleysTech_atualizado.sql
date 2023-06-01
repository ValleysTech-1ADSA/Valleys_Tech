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
fkTipo_usuario int,
constraint fkTipo_usuario foreign key (fkTipo_usuario) references tipo_usuario(idTipo_usuario),
constraint fkEmpresa foreign key (fkEmpresa) references empresa(idEmpresa),
constraint pkUsuario primary key (idUsuario, fkEmpresa)
);

CREATE TABLE local_empresa (
idLocal int primary key auto_increment,
Nome_local varchar(65),
fkEmpresa int,
constraint fkEmpresa2 foreign key (fkEmpresa) references empresa(idEmpresa)
);

CREATE TABLE local_associativa (
idAssociativa int auto_increment,
fkLocal int,
fkEndereco int,
numero int,
complemento varchar (60),
constraint fkLocal foreign key (fkLocal) references local_empresa (idLocal),
constraint fkEndereco foreign key (fkEndereco) references endereco (idEndereco),
constraint pkAssocitiva primary key (idAssociativa, fkLocal, fkEndereco)
);

CREATE TABLE endereco (
idEndereco int primary key auto_increment,
cep char(9),
bairro varchar(50),
estado char(2),
cidade varchar(50),
rua varchar(50)	
);

CREATE TABLE sensor (
idSensor int primary key auto_increment,
status_sensor varchar(15),
unidade_medida varchar (45),
modelo varchar (45),
fkLocal int,
constraint fkLocal2 foreign key (fkLocal) references local_empresa(idLocal)
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


desc;

INSERT INTO empresa VALUES
	(null, 'viticultura', 'Valleys Tec', '56330862000137'),
	(null, 'viticultura', 'Gerudo Uvas', '56334462000137'),
	(null, 'viticultura', 'Kakariko Village', '92450862000137');


INSERT INTO usuario VALUES 
(null, 'Wanda', 'Maximoff', '35131534791', '14-989719697', 'wanda.maximoff@email.com', 'wanda123', 'ativo', 1, 1),
(null, 'Lucas', 'Vinicius', '24231534745', '11-129719456', 'lucas.vinicius@email.com', 'Luquinhas000', 'ativo', 2, 3),
(null, 'Vitoria', 'Dias', '35131534722', '55-959719753', 'vitoria.dias@email.com', 'Victory1212', 'ativo', 3, 2),
(null, 'Caue', 'Zigmmount', '87531534931', '12-989719697', 'caue.zigmmount@email.com', 'Coelho1992', 'ativo', 2, 4);

INSERT INTO tipo_usuario VALUES
(null, 'CEO'),
(null, 'diretor-geral'),
(null, 'diretor de produção'),
(null, 'auxiliar de viticultura');

INSERT INTO local_empresa VALUES 
(null, 'hectar 1', 1),
(null, 'hectar 2', 1),
(null, 'hectar 3', 1),
(null, 'hectar 4', 1),
(null, 'hectar 5', 1);

INSERT INTO local_empresa VALUES
(null, 'hectar 1', 2),
(null, 'hectar 2', 2),
(null, 'hectar 3', 2),
(null, 'hectar 4', 2),
(null, 'hectar 5', 2);

INSERT INTO local_empresa VALUES
(null, 'hectar 1', 3),
(null, 'hectar 2', 3),
(null, 'hectar 3', 3),
(null, 'hectar 4', 3),
(null, 'hectar 5', 3);

