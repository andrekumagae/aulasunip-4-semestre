########### AULA 05 ###########

#01 - Criar e abrir o Banco de Dados Ensino.
CREATE DATABASE ENSINO;
USE ENSINO;

#02 - Criar a tabela Aluno
CREATE TABLE Aluno
(AlMatr  int  unsigned  not null, 
AlNome  varChar(40), 
AlCurso  varChar(30),
AlDtNasc  date, 
AlDescont  int(2),   
PRIMARY KEY(AlMatr))
ENGINE = InnoDB;

#03 - Criar a tabela Disciplina.
CREATE TABLE Disciplina
(DisCod  int(2)  unsigned  not null, 
DisMatr int, 
DisNome  varChar(35), 
DisHoras  int(2), 
DisPreco  DECIMAL(7,2),
DisMedia  DECIMAL(3,1), 
PRIMARY KEY(DisCod,DisMatr))
ENGINE = InnoDB;

#04 - Inserir dados na tabela Aluno.
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

#05 - Inserir dados na tabela Disciplina
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

#06 - Listar o Nome do Aluno, nome da disciplina que ele cursa e o preço da mensalidade, e também NOVO_PRECO,
# aplicando o desconto do aluno.
SELECT A.ALNOME, ALCURSO, D.DISPRECO AS PRECO_DISCIPLINA, ROUND((DISPRECO - (DISPRECO * ALDESCONT/100)),2) AS VALOR_DESCONTO 
FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR;

#07 - Listar a Matrícula, Nome do Aluno, Nome do Curso, Nome da  Disciplina e Data de Nascimento,
#para os alunos nascidos em 1982 e que pagam 200.00 ou menos de mensalidade, aplicado o desconto.
SELECT A.ALMATR, ALNOME, ALCURSO, D.DISNOME, ALDTNASC FROM ALUNO A JOIN DISCIPLINA D ON
A.ALMATR = D.DISMATR WHERE YEAR(ALDTNASC) =1982 AND DISPRECO <= 200;

#08 - Listar os Alunos cujo nome se inicie por "A"
SELECT * FROM ALUNO WHERE ALNOME LIKE "A%";

#09 - Listar os nomes dos Alunos que não tenham a letra "o" no nome.
SELECT * FROM ALUNO WHERE ALNOME NOT LIKE "%O%" AND ALNOME NOT LIKE "O%" AND ALNOME NOT LIKE "%O";

#010 - Listar a quantidade de Alunos.
SELECT COUNT(*) FROM ALUNO;

#11 - Listar a quantidade de Alunos que fazem Eng Software
SELECT COUNT(*) FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR WHERE DISNOME="Eng Software";

#12 - Listar o maior e o menor preço de disciplina. 
SELECT MAX(DISPRECO), MIN(DISPRECO) FROM DISCIPLINA;

#13 - Listar a soma dos Preços das Disciplinas do Aluno Jose Silva.
SELECT SUM(DISPRECO) AS SOMA_JOSE FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALMATR = 123;

#14 - Listar a média de pagamento das disciplinas do Aluno Jose Silva.
SELECT ROUND(AVG(DISPRECO),2) AS SOMA_JOSE FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALMATR = 123;

#15 - Listar, para o aluno Fabio Silva, a média de preço das disciplinas, o maior e o menor preço.
SELECT ROUND(AVG(DISPRECO),2), MAX(DISPRECO), MIN(DISPRECO) FROM ALUNO A JOIN DISCIPLINA D ON
A.ALMATR = D.DISMATR WHERE ALMATR = 129;

#16 - Listar a soma das mensalidades dos alunos que cursam a disciplina Ingles e que nasceram após 1980.
SELECT SUM(DISPRECO) FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR WHERE DISNOME = "Ingles" AND
YEAR(ALDTNASC) > 1980;

#17 - Listar a quantidade e a soma das mensalidades dos alunos cujo nome começam com A.
SELECT COUNT(*), ROUND(SUM(DISPRECO),2) AS SOMA_MENSALIDADES FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALNOME LIKE "A%";

#18 - Listar a maior e a menor mensalidade e a média das mensalidades dos alunos cujo nome começam com J.
SELECT MAX(DISPRECO) AS MAIOR_MENSALIDADE, MIN(DISPRECO) AS MENOR_MENSALIDADE, ROUND(AVG(DISPRECO),2) AS MEDIA_MENSALIDADE
FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR WHERE ALNOME LIKE "J%";

#19 - Listar a quantidade e a media das mensalidades dos alunos que cursam Eng Software.
SELECT COUNT(*) AS QTDE, ROUND(AVG(DISPRECO),2) AS MEDIA FROM DISCIPLINA WHERE DISNOME = "Eng Software";

#20 - Listar a matricula, o nome do aluno, o nome da disciplina que ele cursa e o preço que ele paga, para os alunos 
#cujos nomes começam com a letra M e A
SELECT A.ALMATR, ALNOME, D.DISNOME, DISPRECO FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE ALNOME LIKE "M%" OR ALNOME LIKE "A%";

#21 - Listar a quantidade e a media das mensalidades das disciplinas, para os alunos cujo nome começam com A e J e que cursam 
#Eng Sofware.
SELECT COUNT(*) AS QTDE, ROUND(AVG(D.DISPRECO),2) AS MEDIA FROM ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR
WHERE DISNOME = "Eng Software" AND ALNOME LIKE "A%" OR DISNOME = "Eng Software" AND ALNOME LIKE "J%";

#22 - cluir a disciplina Ingles para os alunos cuja matricula seja 123 e 129.
UPDATE ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR SET DISNOME="" WHERE
DISMATR = 123 OR DISMATR = 129;
SELECT * FROM DISCIPLINA;

#23 - Alterar, a disciplina para Algoritmo, para os  alunos cujo nome começa com A e M e a disciplina está Inglês.
UPDATE ALUNO A JOIN DISCIPLINA D ON A.ALMATR = D.DISMATR SET DISNOME="Algoritmo" WHERE
ALNOME LIKE "A%" OR ALNOME LIKE "M%";

#24 - Criar o Banco de Dados Vinicula.
CREATE DATABASE VINICULA;

#25. Abrir o Banco de Dados Vinicula.
USE VINICULA;

#26. Criar a tabela Produtor
CREATE TABLE Produtor 
(Prod_Id INT(2) UNSIGNED NOT NULL,
Prod_Nome varChar(35) NOT NULL, 
Prod_End varChar(40),
Prod_Tel varChar(15),
Prod_Email varChar(30),
PRIMARY KEY(Prod_Id))
ENGINE = InnoDB;
 
#27. Criar a tabela Vinho.
CREATE TABLE Vinho 
(Vinho_Id INT(2) UNSIGNED NOT NULL,
Vinho_Nome varChar(30),
Vinho_Ano INT(2), Vinho_Cor varChar(20),
Vinho_Grau DECIMAL(5,2),
Vinho_Preco DECIMAL(7,2), 
Vinho_Prod_Id INT(2),
PRIMARY KEY(Vinho_Id)) 
ENGINE = InnoDB;

#28. Inserir Dados na tabela Produtor.
INSERT INTO Produtor VALUES  
(11,"Epaminondas Souza","Vinicula A", "1111 1111 11 11", "epa@maila.br"),
(12,"Asdrubal Silva","Vinicula B", "2222 2222 22 22", "asdra@mailb.br"),
(49,"Xantipo Oliveira","Para Todos", "99999 99 99 99", "piriri@mailc.br"),
(13,"Emengarda Santos","Vinicula C", "3333 3333 33 33", "eme@mailc.br"),
(14,"Xampofago Matos","Vinicula D", "4444 4444 44 44", "xamp@mdila.br"),
(15,"Amaralindo Se","Vinicula E", "5555 5555 55 55", "ama@maile.br"),
(50,"Florindo Gomes","Nosso Vinho", "8888 88 88 88", "arapuc@aile.br");

#29. Inserir Dados na tabela Vinho.
INSERT INTO Vinho VALUES 
(111,"Reserva Especial 1",2005, "Tinto",14.5,18.50,12),
(112,"Quinta do Vale",2002,"Branco",13.5,12.80,11),
(149,"Vinho Bom",2019,"Meio Tinto",25.0,100.00,162),
(113,"Vale Verde",2006,"Tinto",13.8,11.50,11),
(116,"Verdes Belos",2001,"Branco",16.0,11.50,15),
(114,"Reserva de Ouro",2000,"Branco",14.0,19.00,12),
(150,"Vinhaço",2019,"Tinto Rose",40.0,250.00,169),
(117,"Novos Tempos",2007,"Rose",15.4,13.00,12),
(119,"Ouro Branco",2004,"Branco",13.5,15.00,11),
(118,"Especial",2005,"Tinto",16.4,14.50,13);

#30 Listar os Produtores e seus vinhos classificado pelo nome do produtor 
#em ordem ascendente e por vinho em ordem descendente.
SELECT PROD_NOME, VINHO_NOME FROM PRODUTOR P JOIN VINHO V ON P.PROD_ID = V.VINHO_PROD_ID
ORDER BY PROD_NOME ASC, VINHO_NOME DESC; 

#31. Mostrar os Produtores e seus Vinhos, para com os vinhos mesmo que não tenhan produtor.
SELECT PROD_NOME, VINHO_NOME FROM PRODUTOR P RIGHT JOIN VINHO V ON P.PROD_ID = V.VINHO_PROD_ID;

#32. Mostrar o id do produtor, nome do produtor, id do vinho e nome do vinho para os vinhos dos 
#produtores, inclusive os produtores que não tiverem vinho.
SELECT PROD_ID, PROD_NOME, VINHO_ID, VINHO_NOME FROM PRODUTOR P LEFT JOIN VINHO V ON P.PROD_ID = V.VINHO_PROD_ID;

#33. Mostrar o id do produtor, nome do produtor, id do vinho e nome do vinho para os vinhos dos 
#produtores, inclusive os vinhos que não tiverem produtor.
SELECT PROD_ID, PROD_NOME, VINHO_ID, VINHO_NOME FROM PRODUTOR P RIGHT JOIN VINHO V ON P.PROD_ID = V.VINHO_PROD_ID;

#AULA 6

CREATE DATABASE ESTOQUE;
USE ESTOQUE;

CREATE TABLE PRODUTOS 
(CodProd  int  unsigned not null,
NomeProd varChar(35), 
CategoriaProd varChar(20),
PrecoUnitProd decimal(7,2),
Primary Key(CodProd)) Engine=InnoDB;

Delimiter |
CREATE PROCEDURE InsereProduto
(cod int, nome varChar(35), Cat varChar(20),   
preco decimal(7,2))
Begin
INSERT INTO PRODUTOS VALUES
(cod, nome, cat, preco); 
End
|
Delimiter ;


show procedure status;

CALL InsereProduto(1025, "Rebimbola Piriri", "Unidade", 35.50);

SELECT * FROM PRODUTOS;

Delimiter |
CREATE PROCEDURE ListaProduto (preco decimal(7,2))
Begin
SELECT codProd, nomeProd, precoUnitProd FROM PRODUTOS WHERE PRECOUNITPROD > PRECO;
End | Delimiter ;



