CREATE DATABASE ValleysTech;

USE ValleysTech;

CREATE TABLE empresa (
id int primary key auto_increment,
razao_social varchar(45),
nome_fantasia varchar(45),
cnpj char(14)
);

CREATE TABLE usuario (
id int primary key auto_increment,
nome varchar(50),
email varchar(50),
senha varchar(50),
conta_admin boolean,
fkEmpresa int,
constraint fkEmpresa foreign key (fkEmpresa) references empresa(id)
);

CREATE TABLE endereco (
id int primary key auto_increment,
logradouro varchar(45),
cidade varchar(45),
bairro varchar(45),
cep char(9)
);

CREATE TABLE empresa_endereco (
id int auto_increment,
fkEmpresa int,
fkEndereco int,
complemento varchar(45),
numero varchar(5),
constraint fkEmpresaAss foreign key (fkEmpresa) references empresa(id),
constraint fkEnderecoAss foreign key (fkEndereco) references endereco(id),
constraint pkEmpresa_endereco primary key (id, fkEmpresa, fkEndereco)
);

CREATE TABLE hectare (
id int primary key auto_increment,
descricao varchar(300),
fkEndereco int,
constraint fkEndereco foreign key (fkEndereco) references endereco(id),
fkEmpresa int,
constraint fkEmpresaHect foreign key (fkEmpresa) references empresa(id)
);

CREATE TABLE sensor (
id int primary key auto_increment,
modelo varchar(45),
status_sensor varchar(45),
fkHectare int,
constraint fkHectare foreign key (fkHectare) references hectare(id)
);

CREATE TABLE medida (
id int primary key auto_increment,
dht11_umidade decimal,
dht11_temperatura decimal,
momento datetime,
fkSensor int,
constraint fkSensor foreign key (fkSensor) references sensor(id)
);

insert into empresa values
(null, 'Marquinhos Uvas', 'Uvas do Mano Marquinhos', '14681276000134');

insert into usuario values
(null, 'Nicolas Cage', 'nickcage@gmail.com', 'motoqueirofantasma', 1);

insert into endereco values
(null, 'Rua Tilambuco', 'Ponta Grossa', 'Jardim São Vicente', '02365-444');

insert into empresa_endereco values
(null, 1, 1, null, '171');

insert into hectare values
(null, 'Hectare ao norte da plantação', 1, 1);

insert into sensor values
(null, 'DHT-11', 'Ativo', 1);
