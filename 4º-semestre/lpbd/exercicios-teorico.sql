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

#01. Listar todos os dados dos deptos
SELECT * FROM DEPTO;

#02. Listar nome do depto e quantidade de funcionários.
SELECT NOMEDEPTO, QTDFUNC FROM DEPTO;

#03. Alterar o tamanho do atributo NomeDepto para 35.
ALTER TABLE DEPTO MODIFY NOMEDEPTO VARCHAR(35);
DESC DEPTO;

#04. Incluir o atributo LocalDepto varChar(30) após o atributo NomeDepto
ALTER TABLE DEPTO ADD LOCALDEPTO VARCHAR(30) AFTER NOMEDEPTO;
SELECT * FROM DEPTO;

#05. cluir o atributo LocalDepto da tabela;
ALTER TABLE DEPTO DROP LOCALDEPTO;
SELECT * FROM DEPTO;

########### AULA 03 ###########

#SEM EXERCÍCIOS

########### AULA 04 ###########

#01. Criar o Banco de Dados EMPRESA:
CREATE DATABASE EMPRESA;

#02. Abrir Banco de Dados EMPRESA:
USE EMPRESA;

#03. Criar a tabela Func.
CREATE TABLE Func          
(IdentFunc int(2) unsigned not null,     
NomeFunc varChar(40),
FuncaoFunc varChar(20),    
DtAdFunc date,
SalFunc decimal(7,2),  
ComisFunc decimal(7,2),      
PRIMARY KEY (identfunc)
);

#04. Inserir dados na tabela Func
INSERT INTO Func VALUES
(1,"Jose","Analista","1994-10-04",2100,500),  
(2,"Paulo","Pintor","1995-10-10",960,0), 
(3,"Rocha","Funileiro","2000-01-07",1300,0),    
(4,"Maria","Vendedor","1999-05-04",1800,2400),     
(5,"Neide","Analista","2000-12-10",2500,750),
(6,"Irma","Vendedor","2000-09-09",1200,3300),
(7,"Fabio","Presidente","1986-01-07",15000,2300);

#05. Listar os dados dos Funcionários.
SELECT * FROM FUNC;

#06. Listar a Identificação, o nome e o salário dos funcionários cadastrados
SELECT IDENTFUNC, NOMEFUNC, SALFUNC FROM FUNC;

#07. Listar a identificação, o nome, o salário dos funcionários que são vendedores
SELECT IDENTFUNC, NOMEFUNC, SALFUNC FROM FUNC WHERE FUNCAOFUNC="VENDEDOR";

#08. Listar o nome, função e o salário dos empregados que ganham abaixo de 1600
SELECT NOMEFUNC, FUNCAOFUNC, SALFUNC FROM FUNC WHERE SALFUNC<1600;

#09. Alterar, em 15%, o salário dos funcionários que são vendedores
UPDATE FUNC SET SALFUNC = SALFUNC * 1.15 WHERE FUNCAOFUNC = "VENDEDOR";
SELECT * FROM FUNC;

#10. cluir do cadastro, o funcionário Neide (id – 05)
DELETE FROM FUNC WHERE IDENTFUNC = 5;
SELECT * FROM FUNC;

#11. Calcular o tempo de serviço dos funcionários
SELECT NOMEFUNC, (YEAR(current_date()) - year(DTADFUNC))AS TEMPO_SERVICO FROM FUNC;

#12.- Conceder, no BD, um aumento de 20% para os funcionários que tem mais de 25 anos de serviço.
UPDATE FUNC SET SALFUNC = SALFUNC * 1.2 WHERE (YEAR(current_date()) - year(DTADFUNC)) > 25;
SELECT * FROM FUNC;

#13. Mostrar o menor e o maior salário da empresa.
SELECT (MAX(SALFUNC)) AS MAIOR_SALARIO, (MIN(SALFUNC)) AS MENOR_SALARIO FROM FUNC;

#14. Mostrar os funcionários cujo nome começam com a letra M ou P
SELECT * FROM FUNC WHERE NOMEFUNC LIKE "M%" OR NOMEFUNC LIKE "P%";

#15. Mostrar a média dos salários dos funcionários
SELECT AVG(SALFUNC) AS MEDIA_SALARIOS FROM FUNC;
#ARREDONDAR EM 2 CASAS
SELECT ROUND(AVG(SALFUNC),2) AS MEDIA_SALARIOS FROM FUNC;

########### AULA 05 ###########

#1. Criar o Banco de Dados: 
CREATE DATABASE ORGANIZACAO;

#2. Abrir o Banco de Dados:
USE ORGANIZACAO;

#3. Criar a tabela Depto:
CREATE TABLE DEPTO(
CODDEP INT(2) unsigned not null,
NOMEDEP varchar(25),
QUANTDEP int(2),
primary key(CODDEP)
);

#4. Criar a tabela Func:
CREATE TABLE FUNC          
(identFunc int(2) unsigned not null,     
nomeFunc   char(40),
funcaoFunc char(20), dtadFunc  date,
salFunc  decimal(7,2),  
comisFunc  decimal(7,2),  
codDepFunc   int(2), 
PRIMARY KEY(identFunc));

#5. Inserir dados na tabela Depto:
INSERT INTO Depto VALUES
(10,"Diretoria",5), (13, "Marketing", 18),(16, "Financeiro", 23),
(17, "Producao", 109),(14, "Pessoal", 11), (15, "Vendas", 9),   
(12, "Compras",22),(11,  "Suprimento",8),(18, "Estoque",7);

#6. Inserir dados na tabela Func:
INSERT INTO Func VALUES
(1,"Jose","Analista","1994-10-04",2100,500,12),  
(2,"Paulo","Pintor","1995-10-10",960,0,13), 
(3,"Rocha","Funileiro","2000-01-07",1300,0,13),    
(4,"Maria","Vendedor","1999-05-04",1800,2400,15),     
(5,"Neide","Analista","2000-12-10",2500,750,17),
(6,"Irma","Vendedor","2000-09-09",1200,3300,15),
(7,"Fabio","Presidente","1986-01-07",15000,2300,10);

#7.Listar os dados da tabela: Depto:
SELECT * FROM DEPTO;

#8. Listar os dados da tabela: Func:
SELECT * FROM FUNC;

#9. Listar a identificação e o nome dos empregados cadastrados.
SELECT IDENTFUNC, NOMEFUNC FROM FUNC;

#10. Listar a identificação, nome, salário e o código do departamento dos empregados que são vendedores.
SELECT IDENTFUNC, NOMEFUNC, SALFUNC, CODDEPFUNC FROM FUNC WHERE FUNCAOFUNC = "Vendedor";

#11. Listar o nome e o salário dos empregados que têm salário entre 1500 e 2600.
SELECT NOMEFUNC, SALFUNC FROM FUNC WHERE SALFUNC > 1500 AND SALFUNC < 2600;

#12. Alterar na tabela Func a Comissão do Pintor para 100.00.
UPDATE FUNC SET COMISFUNC = 100.00 WHERE FUNCAOFUNC = "Pintor";

#13. Listar o nome dos empregados, a função e o nome do departamento.


