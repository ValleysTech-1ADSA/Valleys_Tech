CREATE DATABASE bd_sprint1;

USE bd_sprint1;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(50),
emailUsuario VARCHAR(50) UNIQUE,
senhaUsuario CHAR(16) UNIQUE,
cpfUsuario CHAR(11) UNIQUE
);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(50),
tipoSensor VARCHAR(50) CONSTRAINT chkTipoSensor CHECK(tipoSensor IN ('Temperatura', 'Umidade')),
descricaoSensor VARCHAR(150)
);

CREATE TABLE leitura(
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
dadosLeitura INT,
data_horaLeitura DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(50),
cnpjEmpresa CHAR(14) UNIQUE,
descricaoEmpresa VARCHAR(150)
);

INSERT INTO usuario (nomeUsuario, emailUsuario, senhaUsuario, cpfUsuario) VALUES
	('José Henrique', 'josehenrique@gmail.com', 'jose1234', '93507834254'),
    ('Pedro Ferreira', 'pedrofer@gmail.com', 'ferreira4321', '53276209142');
    
INSERT INTO sensor (nomeSensor, tipoSensor, descricaoSensor) VALUES
	('LM35', 'Temperatura', 'Sensor que mede a temperatura do ambiente atual'),
    ('DHT11', 'Umidade', 'Sensor DHT11 que mede a temperatura/umidade do local');
    
INSERT INTO leitura (dadosLeitura) VALUES
	(19),
    (28);
    
INSERT INTO empresa (nomeEmpresa, cnpjEmpresa, descricaoEmpresa) VALUES
	('Plantation', '27384267000186', 'Empresa voltada para plantação de vinhedos em ambiente umido'),
    ('Hort Tech', '63892169000113', 'Empresa internacional de plantação específica de vinho');
    
SELECT * FROM usuario;
SELECT * FROM sensor;
SELECT * FROM leitura;
SELECT * FROM empresa;

-- Usuario
SELECT concat('A senha do email: ', emailUsuario ,' é: ', senhaUsuario) AS 'Usuario'
	FROM usuario;

SELECT * FROM usuario WHERE nomeUsuario LIKE 'J%';

-- Sensor
SELECT descricaoSensor FROM sensor WHERE tipoSensor = 'Temperatura';

SELECT concat('O nome do sensor que mede a ', tipoSensor ,' é ', nomeSensor) AS 'Sensor'
	FROM sensor;
    
-- Leitura
SELECT * FROM leitura WHERE dadosLeitura > 20;

SELECT dadosLeitura FROM leitura WHERE idLeitura = 2;

-- Empresa
SELECT concat('A descrição da empresa ', nomeEmpresa ,' é: ', descricaoEmpresa) AS 'Empresa'
	FROM empresa;
    
SELECT cnpjEmpresa FROM empresa WHERE nomeEmpresa LIKE 'H%';
