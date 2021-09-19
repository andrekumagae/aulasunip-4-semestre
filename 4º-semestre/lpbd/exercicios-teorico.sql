########### AULA 02 ###########

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

########### AULA 03 ###########

#SEM EXERCÍCIOS

########### AULA 04 ###########

#EX01 - Criar o Banco de Dados EMPRESA:
CREATE DATABASE EMPRESA;

#EX02 - Abrir Banco de Dados EMPRESA:
USE EMPRESA;

#EX03 - Criar a tabela Func.
CREATE TABLE Func          
(IdentFunc int(2) unsigned not null,     
NomeFunc varChar(40),
FuncaoFunc varChar(20),    
DtAdFunc date,
SalFunc decimal(7,2),  
ComisFunc decimal(7,2),      
PRIMARY KEY (identfunc)
);

#EX04 - Inserir dados na tabela Func
INSERT INTO Func VALUES
(1,"Jose","Analista","1994-10-04",2100,500),  
(2,"Paulo","Pintor","1995-10-10",960,0), 
(3,"Rocha","Funileiro","2000-01-07",1300,0),    
(4,"Maria","Vendedor","1999-05-04",1800,2400),     
(5,"Neide","Analista","2000-12-10",2500,750),
(6,"Irma","Vendedor","2000-09-09",1200,3300),
(7,"Fabio","Presidente","1986-01-07",15000,2300);

#EX05 - Listar os dados dos Funcionários.
SELECT * FROM FUNC;

#EX06 - Listar a Identificação, o nome e o salário dos funcionários cadastrados
SELECT IDENTFUNC, NOMEFUNC, SALFUNC FROM FUNC;

#EX07 - Listar a identificação, o nome, o salário dos funcionários que são vendedores
SELECT IDENTFUNC, NOMEFUNC, SALFUNC FROM FUNC WHERE FUNCAOFUNC="VENDEDOR";

#EX08 - Listar o nome, função e o salário dos empregados que ganham abaixo de 1600
SELECT NOMEFUNC, FUNCAOFUNC, SALFUNC FROM FUNC WHERE SALFUNC<1600;

#EX09 - Alterar, em 15%, o salário dos funcionários que são vendedores
UPDATE FUNC SET SALFUNC = SALFUNC * 1.15 WHERE FUNCAOFUNC = "VENDEDOR";
SELECT * FROM FUNC;

#EX10 - Excluir do cadastro, o funcionário Neide (id – 05)
DELETE FROM FUNC WHERE IDENTFUNC = 5;
SELECT * FROM FUNC;

#EX11 - Calcular o tempo de serviço dos funcionários
SELECT NOMEFUNC, (YEAR(current_date()) - year(DTADFUNC))AS TEMPO_SERVICO FROM FUNC;

#EX12 - Conceder, no BD, um aumento de 20% para os funcionários que tem mais de 25 anos de serviço.
UPDATE FUNC SET SALFUNC = SALFUNC * 1.2 WHERE (YEAR(current_date()) - year(DTADFUNC)) > 25;
SELECT * FROM FUNC;

#EX13 - Mostrar o menor e o maior salário da empresa.
SELECT (MAX(SALFUNC)) AS MAIOR_SALARIO, (MIN(SALFUNC)) AS MENOR_SALARIO FROM FUNC;

#EX14 - Mostrar os funcionários cujo nome começam com a letra M ou P
SELECT * FROM FUNC WHERE NOMEFUNC LIKE "M%" OR NOMEFUNC LIKE "P%";

#EX15 - Mostrar a média dos salários dos funcionários
SELECT AVG(SALFUNC) AS MEDIA_SALARIOS FROM FUNC;
#ARREDONDAR EM 2 CASAS
SELECT ROUND(AVG(SALFUNC),2) AS MEDIA_SALARIOS FROM FUNC;





















