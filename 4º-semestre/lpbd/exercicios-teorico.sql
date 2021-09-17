#AULA 02

#PARA CRIAR UM BANCO DE DADOS
CREATE DATABASE RH;

#PARA ABRIR O BANCO DE DADOS
USE RH;

#Criar a tabela Depto:
CREATE TABLE Depto
(NrDepto   int(2)   UNSIGNED NOT NULL,
NomeDepto  varChar(25), 
QtdFunc int(2),
PRIMARY KEY (NrDepto));

#Inserir dados na tabela Depto:
INSERT INTO Depto VALUES
(18,"VENDAS",10),
(23,"INFORMÁTICA",18),
(07,"COMPRAS",6),
(02,"PRODUÇÃO",468); 

#EX01 - Listar todos os dados dos deptos
SELECT * FROM DEPTO;

#EX02 - Listar nome do depto e quantidade de funcionários.
SELECT NOMEDEPTO, QTDFUNC FROM DEPTO;

#EX03 - Alterar o tamanho do atributo NomeDepto para 35.
ALTER TABLE DEPTO MODIFY NOMEDEPTO VARCHAR(35);
DESC DEPTO;

#EX04 - Incluir o atributo LocalDepto varChar(30) após o atributo NomeDepto
ALTER TABLE DEPTO ADD LOCALDEPTO VARCHAR(30) AFTER NOMEDEPTO;
SELECT * FROM DEPTO;

#EX05 - Excluir o atributo LocalDepto da tabela;
ALTER TABLE DEPTO DROP LOCALDEPTO;
SELECT * FROM DEPTO;













