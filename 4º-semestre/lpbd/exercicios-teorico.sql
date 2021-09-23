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

########### AULA 05 ###########

#EX01 - Criar e abrir o Banco de Dados Ensino.
CREATE DATABASE ENSINO;
USE ENSINO;

#EX02 - Criar a tabela Aluno
CREATE TABLE Aluno
(AlMatr  int  unsigned  not null, 
AlNome  varChar(40), 
AlCurso  varChar(30),
AlDtNasc  date, 
AlDescont  int(2),   
PRIMARY KEY(AlMatr))
ENGINE = InnoDB;

#EX03 - Criar a tabela Disciplina.
CREATE TABLE Disciplina
(DisCod  int(2)  unsigned  not null, 
DisMatr int, 
DisNome  varChar(35), 
DisHoras  int(2), 
DisPreco  DECIMAL(7,2),
DisMedia  DECIMAL(3,1), 
PRIMARY KEY(DisCod,DisMatr))
ENGINE = InnoDB;

#EX04 - Inserir dados na tabela Aluno.
INSERT INTO Aluno VALUES
(123,"Jose Silva","Ciencias Computação","1980-10-10",5),
(124,"Maria Silva","Direito","1982-05-05",20),
(125,"Ana Silva","Ciencias Computação","1982-03-03",10),
(126,"Mario Silva","Ciencias Computação","1983-02-02",15),
(127,"Joao Silva","Direito","1981-06-06",15),
(128,"Ari Silva","Ciencias Computação","1982-08-08",20),
(129,"Fabio Silva","Direito","1980-09-09",10),
(130,"Eva Silva","Direito","1984-07-07",15),
(131,"Calixto Souza","ED Fisica","1979-02-21",5),
(132,"Audrey Gomes","ED Fisica","1985-03-21",15);

#EX05 - Inserir dados na tabela Disciplina
INSERT INTO DISCIPLINA VALUES
(11,123,"Eng Software",80,250.00,5.0),
(14,123,"Ingles",40,100.00,9.0),
(16,124,"Portugues",40,140.00,8.0),
(14,124,"Ingles",40,100.00,7.0),
(11,125,"Eng Software",80,250.00,6.0),
(13,126,"Algoritmo",40,140.00,10.0),
(16,127,"Portugues",40,140.00,5.0),
(11,128,"Eng Software",80,250.00,5.0),
(16,129,"Portugues",40,140.00,5.0), 
(14,129,"Ingles",40,100.00,9.0),
(14,132,"Ingles",40,150.00,7.0),  
(14,131,"Ingles",40,150.00,5.0);

#EX06 - Listar o Nome do Aluno, nome da disciplina que ele cursa e o preço da mensalidade, e também NOVO_PRECO,
# aplicando o desconto do aluno.
SELECT A.ALNOME, ALCURSO, D.DISPRECO AS PRECO_DISCIPLINA, ROUND((DISPRECO - (DISPRECO * ALDESCONT/100)),2) AS VALOR_DESCONTO 
FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR;

#EX07 - Listar a Matrícula, Nome do Aluno, Nome do Curso, Nome da  Disciplina e Data de Nascimento,
#para os alunos nascidos em 1982 e que pagam 200.00 ou menos de mensalidade, aplicado o desconto.
SELECT A.ALMATR, ALNOME, ALCURSO, D.DISNOME, ALDTNASC FROM ALUNO A JOIN DISCIPLINA D ON
A.ALMATR = D.DISMATR WHERE YEAR(ALDTNASC) =1982 AND DISPRECO <= 200;

#EX08 - Listar os Alunos cujo nome se inicie por "A"
SELECT * FROM ALUNO WHERE ALNOME LIKE "A%";

#EX09 - Listar os nomes dos Alunos que não tenham a letra "o" no nome.
SELECT * FROM ALUNO WHERE ALNOME NOT LIKE "%O%" AND ALNOME NOT LIKE "O%" AND ALNOME NOT LIKE "%O";

#EX010 - Listar a quantidade de Alunos.
SELECT COUNT(*) FROM ALUNO;

#EX11 - Listar a quantidade de Alunos que fazem Eng Software
SELECT COUNT(*) FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR WHERE DISNOME="Eng Software";

#EX12 - Listar o maior e o menor preço de disciplina. 
SELECT MAX(DISPRECO), MIN(DISPRECO) FROM DISCIPLINA;

#EX13 - Listar a soma dos Preços das Disciplinas do Aluno Jose Silva.
SELECT SUM(DISPRECO) AS SOMA_JOSE FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALMATR = 123;

#EX14 - Listar a média de pagamento das disciplinas do Aluno Jose Silva.
SELECT ROUND(AVG(DISPRECO),2) AS SOMA_JOSE FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALMATR = 123;

#EX15 - Listar, para o aluno Fabio Silva, a média de preço das disciplinas, o maior e o menor preço.
SELECT ROUND(AVG(DISPRECO),2), MAX(DISPRECO), MIN(DISPRECO) FROM ALUNO A JOIN DISCIPLINA D ON
A.ALMATR = D.DISMATR WHERE ALMATR = 129;

#EX16 - Listar a soma das mensalidades dos alunos que cursam a disciplina Ingles e que nasceram após 1980.
SELECT SUM(DISPRECO) FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR WHERE DISNOME = "Ingles" AND
YEAR(ALDTNASC) > 1980;

#EX17 - Listar a quantidade e a soma das mensalidades dos alunos cujo nome começam com A.
SELECT COUNT(*), ROUND(SUM(DISPRECO),2) AS SOMA_MENSALIDADES FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALNOME LIKE "A%";

#EX18 - Listar a maior e a menor mensalidade e a média das mensalidades dos alunos cujo nome começam com J.
SELECT MAX(DISPRECO) AS MAIOR_MENSALIDADE, MIN(DISPRECO) AS MENOR_MENSALIDADE, ROUND(AVG(DISPRECO),2) AS MEDIA_MENSALIDADE
FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR WHERE ALNOME LIKE "J%";

#EX19 - Listar a quantidade e a media das mensalidades dos alunos que cursam Eng Software.
SELECT COUNT(*) AS QTDE, ROUND(AVG(DISPRECO),2) AS MEDIA FROM DISCIPLINA WHERE DISNOME = "Eng Software";

#EX20 - Listar a matricula, o nome do aluno, o nome da disciplina que ele cursa e o preço que ele paga, para os alunos 
#cujos nomes começam com a letra M e A
SELECT A.ALMATR, ALNOME, D.DISNOME, DISPRECO FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALNOME LIKE "M%" OR ALNOME LIKE "A%";

#EX21 - Listar a quantidade e a media das mensalidades das disciplinas, para os alunos cujo nome começam com A e J e que cursam 
#Eng Sofware.
SELECT COUNT(*) AS QTDE, ROUND(AVG(D.DISPRECO),2) AS MEDIA FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE DISNOME = "Eng Software" AND ALNOME LIKE "A%" OR DISNOME = "Eng Software" AND ALNOME LIKE "J%";

#EX22 - Excluir a disciplina Ingles para os alunos cuja matricula seja 123 e 129.
UPDATE ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR SET DISNOME="" WHERE
DISMATR = 123 OR DISMATR = 129;
SELECT * FROM DISCIPLINA;

#EX23 - Alterar, a disciplina para Algoritmo, para os  alunos cujo nome começa com A e M e a disciplina está Inglês.
UPDATE ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR SET DISNOME="Algoritmo" WHERE
ALNOME LIKE "A%" OR ALNOME LIKE "M%";































