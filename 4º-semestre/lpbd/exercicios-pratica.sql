########### AULA 01 ###########

#EXERCÍCIO DATABASE ESCOLA

#Criação do BD.
CREATE DATABASE ESCOLA;
DROP DATABASE ESCOLA;

#Para abrir o banco de Dados:
USE ESCOLA;

#Para ver se o BD foi criado:
SHOW DATABASES;

#Criação da tabela Aluno.
CREATE  TABLE  Alunos(
Matricula int(2) unsigned not null,
Nome varChar(40),
Sexo varChar(01),
Endereco varChar(13),
PRIMARY KEY(Matricula)); 

#Para ver se a tabela foi criada
SHOW TABLES;

#Para ver as características da tabela.      
DESC ALUNOS;
DESCRIBE ALUNOS;

#Inserindo dados na tabela
INSERT INTO  Alunos  VALUES
(1,"Magnolia","F", "Rua A, 13"), 
(2,"Epaminondas","M","Rua B, 14"),
(3,"Raymunda","F","Rua C, 15"), 
(4,"Emengarda","F","Rua D, 16"),
(5,"Asdrubal","M","Rua E, 17"),
(6, "Emilio", "M", "Rua F, 16"),
(7, "Tiburcio", "M", "Rua G, 44");

#1. Listar os dados dos alunos.
SELECT * FROM ALUNOS;

#2. Listar todas as matriculas e nomes dos alunos.
SELECT MATRICULA, NOME FROM ALUNOS;

#3. Listar todos os nomes e endereços dos alunos.
SELECT NOME, ENDERECO FROM ALUNOS;

#4. Listar matricula, endereço, sexo e nome dos alunos.
SELECT NOME, ENDERECO, SEXO FROM ALUNOS;

#5. Listar matricula, nome e endereço das alunas.
SELECT MATRICULA, NOME FROM ALUNOS WHERE SEXO = 'F';

#6. Listar todos alunos com matricula maior do que 3.
SELECT * FROM ALUNOS WHERE MATRICULA > 3;

#7. Listar os alunos cujo nome começa com a letra E.
SELECT * FROM ALUNOS WHERE NOME LIKE "E%";

#8. Alterar na tabela Aluno o Endereço para varChar(35). 
ALTER TABLE ALUNOS MODIFY ENDERECO VARCHAR(35);

#9. Incluir na tabela Aluno o Curso varchar(30) após o nome do aluno.
ALTER TABLE ALUNOS ADD Curso VARCHAR(30) AFTER NOME;

#10. Ver como ficaram os dados da tabela Aluno.
SELECT * FROM ALUNOS;

#11. Incluir na tabela Aluno a Mensalidade DECIMAL(7,2).
ALTER TABLE ALUNOS ADD Mensalidade DECIMAL(7,2);
#12. Para a Aluna Emengarda, alterar os dados da tabela aluno, colocando: Curso = Ciências da Computação e 
#Mensalidade = 721.80.
UPDATE ALUNOS SET CURSO = "Ciências da Computação", Mensalidade = 721.80 WHERE NOME = "Emengarda";

#13. Listar os dados da tabela Aluno.
SELECT * FROM ALUNOS;

#14. Excluir os dados do Aluno Epaminondas.
DELETE FROM ALUNOS WHERE NOME = "Epaminondas";

#EXERCÍCIO DB AMBULATORIO

#1. Criar o db e as tabelas

CREATE DATABASE AMBULATORIO;

USE AMBULATORIO;

CREATE TABLE MEDICO
(Id_Medico int(2)      not null,
NomeMed        varChar(35) not null,
Crm          varChar(15),
Telefone   varChar(15),
Primary Key(Id_Medico))
Engine=InnoDB;

CREATE TABLE PACIENTE
  (Id_Paciente int(2)   not null,
   NomePac        varChar(35) not null,
   Convenio varChar(20),
   Endereco varChar(40),
   Primary Key(Id_Paciente))
   Engine =InnoDB;

CREATE TABLE CONSULTA
  (Id_Medico   int(2)   not null, 
   Id_Paciente int(2)   not null,
   Data             date,
   Hora             time,
   Primary Key(Id_Medico,Id_Paciente))
   Engine =InnoDB;

DESC MEDICO;
DESC PACIENTE;
DESC CONSULTA;
SHOW TABLES;

#Criar a tabela Prontuario.

CREATE TABLE PRONTUARIO
(Id_Paciente      int(2)   not null,
DataConsulta  date,
HoraConsulta  time,
id_Medico        int(2),
ResConsulta varChar(256))
Engine=InnoDB;

#2. ALTERAR na tabela Prontuario a coluna NomePaciente para 40 posições.
ALTER TABLE PACIENTE MODIFY NOME VARCHAR(40);

#3. Inserir na tabela Prontuario a coluna EndPaciente char(40) após a coluna NomePaciente.
ALTER TABLE PACIENTE ADD EndPaciente VARCHAR(40) AFTER NOME;

#4. Incluir a chave primária Id_Paciente, DataConsulta e HoraConsulta na tabela Prontuário.
ALTER TABLE PRONTUARIO ADD PRIMARY KEY(DataConsulta, HoraConsulta);

#5. Inserir dados nas tabelas: Medico.

INSERT INTO Medico VALUES
(111, "Jose Dilva","1234567890","1111 11 11"),
(112, "Maria Souza","0987654321","2222 22 22"),
(113,"Ana Bastos","4567893210","3333 33 33"),
(114,"Ari Santos","7894561230","4444 44 44"),
(115,"Eva Brown","3216549879","5555 55 55");

#6. Inserir dados nas tabelas: Paciente.
ALTER TABLE PACIENTE DROP Endereco;
INSERT INTO Paciente VALUES
(1, "Epaminondas","Unimed","Rua A"),
(2, "Asdrubal","Amico","Rua B"),
(3,"Filisbina","Sulamerica","Rua C"),
(4,"Gumercindo","Maritma","Rua D"),
(5,"Cabrioca","Samaritano","Rua E");
DROP TABLE PACIENTE;

#7. Inserir dados nas tabelas: Consulta.

INSERT INTO Consulta VALUES
(114,3,"2009-08-01","10:05:00"),
(111,1,"2009-08-01","09:00:00"),    
(112,3,"2009-08-01","11:15:00"),
(115,3,"2009-08-01","07:45:00"),
(113,2,"2009-08-02","07:00:00"),
(111,4,"2009-08-02","09:08:00"),
(112,2,"2009-08-01","10:20:00"),
(111,5,"2009-08-03","08:00:00"),
(113,5,"2009-08-03","09:05:00"),
(112,5,"2009-08-03","10:05:00");

#8. Verificar os dados das tabelas.
SELECT * FROM PACIENTE;
SELECT * FROM MEDICO;
SELECT * FROM CONSULTA;
SELECT * FROM PRONTUARIO;

#9. Criar a Visão MedPac, com o nome do médico, crm, nome do paciente e convenio. 
CREATE VIEW CMedPac AS SELECT M.NOMEMED, CRM, P.NOMEPAC, CONVENIO FROM MEDICO M JOIN CONSULTA C
ON M.ID_MEDICO = C.ID_MEDICO JOIN PACIENTE P ON C.ID_PACIENTE = P.ID_PACIENTE;

#10. Na visão criada, listar o nome do médico e o nome do paciente.
SELECT NOMEMED, NOMEPAC FROM CMEDPAC;

#11. Alterar o nome do médico 111 para Jose Silva.
UPDATE MEDICO SET NOMEMED = "Jose Silva" where ID_MEDICO = 111;

#12. Executar novamente o exercício 10. VEJA QUE O NOME DO MÉDICO MUDOU.
SELECT NOMEMED, NOMEPAC FROM CMEDPAC;

#13. Alterar na tabela Medico, para a medica Ana Bastos o telefone 666 66 66.
UPDATE MEDICO SET TELEFONE = "6666 66 66" WHERE ID_MEDICO = 113;
SELECT * FROM MEDICO;

#14. Mostrar os médicos que atenderam a paciente Filisbina.
SELECT NOMEMED FROM CMEDPAC WHERE NOMEPAC = "Filisbina";

#15. Mostrar os médicos que atenderam a paciente Filisbina.
SELECT NOMEMED FROM CMEDPAC WHERE NOMEPAC = "Filisbina";

#16. Mostrar os nomes e convenio dos pacientes que a médica Maria Souza atendeu.
SELECT NOMEPAC, CONVENIO FROM CMEDPAC WHERE NOMEMED = "Maria Souza";

#17. Mostrar os nomes e convenio dos pacientes que a médica Maria Souza atendeu.
SELECT NOMEPAC, CONVENIO FROM CMEDPAC WHERE NOMEMED = "Maria Souza";

#18. Inserir dados nas tabelas: Prontuario.
INSERT INTO Prontuario VALUES
(3,"2009-08-01","10:05:00",114,"Unha Encravada" ),
(1,"2009-08-01","09:00:00",111,"Cirrose Biliar"),    
(3,"2009-08-01","11:15:00",112,"Coração Partido"),
(3,"2009-08-01","07:45:00",115, "Febre Alta"),
(2,"2009-08-02","07:00:00",113,"Tosse Persistente"),
(4,"2009-08-02","09:08:00",111,"Diarréia"),
(2,"2009-08-01","10:20:00",112,"Dores Abdominais"),
(5,"2009-08-03","08:00:00",111,"Sarampo"),
(5,"2009-08-03","09:05:00",111,"Dor de Cabeça"),
(5,"2009-08-03","10:05:00",112,"Catapóra");

#19. Mostrar os nomes dos pacientes, nomes dos médicos, data, hora e resultado da consulta.
SELECT P.NOMEPAC, M.NOMEMED, DATACONSULTA, HORACONSULTA, RESCONSULTA FROM PACIENTE P JOIN PRONTUARIO PR
ON P.ID_PACIENTE = PR.ID_PACIENTE JOIN MEDICO M ON PR.ID_MEDICO = M.ID_MEDICO;

#20. Excluir a tabela Prontuarios.
DROP TABLE PRONTUARIO;

#21. Excluir a visão MedPac.
DROP VIEW CMEDPAC;

#22. Excluir o Banco de Dados Ambulatorio. 
DROP DATABASE AMBULATORIO;

########### AULA 02 ###########

#1. Criar o BANCO DE DADOS: UNIVERSIDADE
CREATE DATABASE UNIVERSIDADE;

#2. Abrir o Banco de Dados  UNIVERSIDADE
USE UNIVERSIDADE;

#3. Criar a tabela Aluno
CREATE TABLE ALUNO(
Matricula int(2),
Nome varchar(35),
Media decimal(3,1)
);

#4. Mostrar as tabelas do Banco de Dados UNIVERSIDADE
SHOW TABLES;

#5. Mostrar a estrutura da tabela ALUNO
DESC ALUNO;

#6. Inserir os dados abaixo na tabela ALUNO.
INSERT INTO ALUNO VALUES
(1234, "Maria da Silva",8.2), (1231, "João da Silva",5.5),
(1236, "Jose da Silva",10.0), (1237, "Ana da Silva",0.0),
(1233, "Ari da Silva",7.0), (1230, "Benedita da Silva",8.2),
(12381, "Asdrubal da Silva",5.5), (1232, "Filó da Silva",10.0),
(1239, "José da Silva",0.0), (1235, "Alcinda da Silva",7.0);

#7. Listar todos os dados dos Alunos.
SELECT * FROM ALUNO;

#8. Listar os Nomes e Médias dos Alunos
SELECT NOME, MEDIA FROM ALUNO;

#9. Listar os Nomes e Medias dos Alunos com média Maior do que 5.0.
SELECT NOME, MEDIA FROM ALUNO WHERE MEDIA > 5.0;

#10. Listar os dados dos Alunos cujas matrícula sejam maiores do que 1234 e menore do que 1237.
SELECT * FROM ALUNO WHERE MATRICULA > 1234 AND MATRICULA < 1237;

#11. Listar os Nomes e Médias dos Alunos com matrículas maiores do que 1235 e 
#médias menores do que 5.0.
SELECT NOME, MEDIA FROM ALUNO WHERE MATRICULA > 1235 AND MEDIA < 5.0;

#12. Listar os Matricula e Nome dos Alunos aprovados (média igual ou maior do que 7.0).
SELECT MATRICULA, NOME FROM ALUNO WHERE MEDIA >= 7.0;

#13. Listar os dados do aluno Jose da Silva.
SELECT * FROM ALUNO WHERE NOME = "Jose da Silva";

#14. Listar os dados das alunas Maria da Silva e Ana da Silva.
SELECT * FROM ALUNO WHERE NOME = "Maria da Silva" OR NOME="Ana da Silva";

#15. Listar os dados dos alunos que estão de exame 
#(notas maiores do que 3,0 e menores do que 7,0).. 
SELECT * FROM ALUNO WHERE MEDIA > 3.0 AND MEDIA < 7.0;

#16. Listar os Nome e medias dos alunos que não estão de exame 
#(notas menores ou iguais a 3.0 e notas maiores ou iguais a 7.0).
SELECT * FROM ALUNO WHERE MEDIA <= 3.0 OR MEDIA >= 7.0;

#17. Listar os Nome e medias dos alunos que não estão de exame (notas menores ou iguaua a 3.0 e notas maiores ou iguais a 7.0).
#Adaptei para alunos aprovados, pois este exercício é o mesmo que o 16
SELECT * FROM ALUNO WHERE MEDIA >= 7.0;

#18. Listar os dados dos alunos masculinos.
SELECT * FROM ALUNO;
ALTER TABLE ALUNO ADD Sexo varchar(1) AFTER MEDIA;
UPDATE ALUNO SET SEXO='M' WHERE MATRICULA=1231 OR MATRICULA=1236 OR MATRICULA=1233 OR MATRICULA=12381
OR MATRICULA=1239;
UPDATE ALUNO SET SEXO='F' WHERE SEXO IS NULL;
SELECT * FROM ALUNO WHERE SEXO = 'M';

#Criar o Banco de Dados: Veiculo.
CREATE DATABASE Veiculo;

#2. Abrir o Banco de Dados Veiculo.
USE Veiculo;

#3. Criar a tabela: Automovel
CREATE TABLE AUTOMOVEL(
Placa varchar(8),
Ano int(2),
Modelo varchar(20),
Preco decimal(7,2)
);

#4. Inserir dados na yabela Automovel.
INSERT INTO Automovel VALUES
("PXJ 5678",2012,"Gol",10000.00), 
("DBM 2345",2014,"Corsa",10500.00),
("KPT 1234",2015,"Tempra",15500.00),
("PKT 9876",2018,"Santana",29800.00),
("LKU 5432",2013,"Monza",24700.00),
("JKY 1478",2016,"Corsa",28000.00),
("MCU 4321",2012,"Fiorino",15000.00),
("DQZ 8877",2018,"Corolla",31200.00),
("DQR 6479",2019,"Santana",49600.00);

#5. Mostrar os dados dos automóveis.
SELECT * FROM AUTOMOVEL;

#6. Mostrar os dados dos automóveis   classificados por modelo em ordem crescente.
SELECT * FROM AUTOMOVEL ORDER BY MODELO ASC;

#7. Mostrar os dados dos automóveis classificados por modelo em ordem crescente 
#e por preço em orfem decrescente..
SELECT * FROM AUTOMOVEL ORDER BY MODELO DESC, PRECO;

#8. Liste as Placas, os Modelos, os Anos e os Preços dos automóveis
#com preço menor do que R$ 20000.00.
SELECT * FROM AUTOMOVEL WHERE PRECO < 20000.00;

#9. Listar os dados dos automóveis.
SELECT * FROM AUTOMOVEL;

#10. Liste as Placas, os Modelos os Anos  os Preços e o 
#NOVO_PRECO com um aumento de 15% dos autom com preço menor do que R$ 20000.00.
SELECT PLACA, MODELO, ANO, PRECO, ROUND((PRECO * 1.15),2) AS NOVO_PRECO FROM AUTOMOVEL
WHERE PRECO < 20000.00;

#11. Listar os dados dos automóveis.
SELECT * FROM AUTOMOVEL;

#12. Alterar na tabela os preços dos automóveis em 15%, para os automóveis que custam 
#menos de 20000.00.
UPDATE AUTOMOVEL SET PRECO = PRECO * 1.15 WHERE PRECO < 20000.00;

#13. Listar os dados dos automóveis.
SELECT * FROM AUTOMOVEL;

########### AULA 03 ###########

#1. Criar o Banco de Dados Empregado.
CREATE DATABASE EMPREGADO;

#2. Abrir o Banco de Dados Empregado.
USE EMPREGADO;

#3. Criar e criar a tabela Func.
CREATE TABLE Func
(ID_FUNC int  UNSIGNED NOT NULL,
NOME_FUNC varChar(40)  NOT NULL ,
DEP_FUNC  int(2),
PRIMARY KEY(ID_FUNC)) 
ENGINE = InnoDB;

#4. Inserir dados na tabela Func.
INSERT INTO Func VALUES
(123,"Alipio de Souza",18),
(124,"Aparecido de Oliveira",16), 
(125,"Joaninha Santos",11), 
(126,"Carmelia Alves",18), 
(127,"Adrualdo Macedo",14),
(128,"Emengardo Silva",14), 
(129,"Margarida Donald",16), 
(130,"Raimundo Nonato",16), 
(131,"Criselda Moreita",11), 
(132,"Gumercindo Batista",14);

#5. Copiar e criar a tabela Dependente com 
CREATE TABLE Dependente
(ID_DEPENDENTE int UNSIGNED NOT NULL,
NOME_DEPENDENTE varChar(40) NOT NULL,
DataNasc DATE,
ID_FUNC int  UNSIGNED NOT NULL,
PRIMARY KEY (ID_DEPENDENTE))
ENGINE = InnoDB;

#6. Inserir dados na tabela Dependente.
INSERT INTO Dependente VALUES
(11,"Aparecida","191-05-10",124), 
(12,"Aparecidinho","2002-01-20",124), 
(13,"Raimunda","1977-04-04",130), 
(14,"Raimundinha","2003-06-30",130),    
(15,"Raimundinho","2005-02-02",130), 
(16,"Raimundeto","2007-04-04",130), 
(17,"Emengarda","1986-01-10",128), 
(18,"Emengardinha","1999-03-10",128), 
(19,"Gumercindinha","2004-05-01",132), 
(20,"Gumercindinho","2008-05-29",132), 
(21,"Alipia","2007-02-11",123), 
(22,"Epaminondinha","2007-03-13",123);

#7. Listar os nomes dos Funcionários e seus dependentes, 
#classificado por Nome do Funcionário em ordem ascendente.
SELECT NOME_FUNC, NOME_DEPENDENTE FROM FUNC F JOIN DEPENDENTE D ON
F.ID_FUNC = D.ID_FUNC;

#8. Excluir o funcionário 128 (Emengardo Silva).
DELETE FROM FUNC WHERE ID_FUNC = 128;

#9. Listar Nome do Funcionario e ver se o funcinario Emengardo Silva foi excluido.
SELECT * FROM FUNC;

#10. Listar Nome dos Dependentes e ver se os dependentes do Emengardo Silva estãao na tabela.
SELECT NOME_DEPENDENTE FROM DEPENDENTE WHERE ID_FUNC=128;

#11. Listar os nomes dos Funcionários  e seus dependentes.
SELECT NOME_FUNC, NOME_DEPENDENTE FROM FUNC F JOIN DEPENDENTE D ON
F.ID_FUNC = D.ID_FUNC;

#12. Listar os nomes dos Funcionários  e seus dependentes, inclusive os dependentes sem “pai".
SELECT NOME_FUNC, NOME_DEPENDENTE FROM FUNC F RIGHT JOIN DEPENDENTE D ON
F.ID_FUNC = D.ID_FUNC;

#13. Inserir o dependente: (25,"Asdrubinha","2005-05-25",135);
INSERT INTO DEPENDENTE VALUES (25,"Asdrubinha","2005-05-25",135);

#14. Listar os nomes dos dependents, classificados em ordem ascendente, para ver se foi incluido.
#para ver se foi incluido.
SELECT * FROM DEPENDENTE ORDER BY NOME_DEPENDENTE ASC;

#15. Listar o nome dos funcionário e os nomes dos dependentes, para o funcionário 124.
SELECT NOME_FUNC, NOME_DEPENDENTE FROM FUNC F JOIN DEPENDENTE D ON F.ID_FUNC = D.ID_FUNC WHERE D.ID_FUNC = 124;

#16. Alterar a Identificacao do func 124 para 136
UPDATE FUNC SET ID_FUNC = 136 WHERE ID_FUNC = 124;

#17. Listar os funcs para ver se foi alterado.
SELECT NOME_FUNC, NOME_DEPENDENTE FROM FUNC F JOIN DEPENDENTE D ON F.ID_FUNC = D.ID_FUNC WHERE D.ID_FUNC = 136;

#18. Listar os nomes dos Funcionários  e seus dependentes, inclusive os dependentes sem “pai”.
SELECT NOME_FUNC, NOME_DEPENDENTE FROM FUNC F RIGHT JOIN DEPENDENTE D ON F.ID_FUNC = D.ID_FUNC;

#19. Altera a tabela Deppendente, incluindo a     FOREIGN KEY com restricoes de delete e update. Foi possível?
ALTER TABLE DEPENDENTE ADD FOREIGN KEY (ID_FUNC) REFERENCES FUNC (ID_FUNC) ON DELETE RESTRICT ON UPDATE RESTRICT;
#Não, pois há "filhos" sem "pais" na tabela, o que entra em divergência com as regras de RESTRICTS que estão sendo criadas

#20. Excluir os dependentes: 124, 128, 135.
DELETE FROM DEPENDENTE WHERE ID_FUNC=124 OR ID_FUNC=128 OR ID_FUNC=135;

#21. Novamente, altera a tabela Deppendente, incluindo a FOREIGN KEY com restricoes de delete e update. Foi possível?
ALTER TABLE DEPENDENTE ADD FOREIGN KEY (ID_FUNC) REFERENCES FUNC (ID_FUNC) ON DELETE RESTRICT ON UPDATE RESTRICT;
#Sim, pois foram deletados os dados que não tinham "pais" para que estas RESTRICTS funcionassem

#22. Excluir o funcin[ario 130, Raimundo Nonato. Foi possível?
DELETE FROM FUNC WHERE ID_FUNC=130;
#Não, pois o DELETE RESTRICT criado barra este comando

#23. Alterar a identificacao do func 132 para 137. Foi possível?
UPDATE FUNC SET ID_FUNC=127 WHERE ID_FUNC=132;
#Não, pois o UPDATE RESTRICT criado barra este comando

#24. Inserir dependente
INSERT INTO DEPENDENTE VALUES (24,"Pafuncinho","2009-10-02",140);

#25. Na tabela Dependente, excluir a chave estrangeira: coluna Id_Func.
ALTER TABLE DEPENDENTE DROP ID_FUNC;

#26. Excluir a tabela DEPENDENTE.
DROP TABLE DEPENDENTE;

#27. Criar novamente a tabela DEOENDENTE com o FOREIGN KEY e a cláusula> CASCADE.
CREATE TABLE DEPENDENTE
(ID_DEPENDENTE int UNSIGNED NOT NULL,
NOME_DEPENDENTE varchar(40) NOT NULL,
DATANASC DATE,
ID_FUNC int UNSIGNED NOT NULL,
PRIMARY KEY (ID_DEPENDENTE),
FOREIGN KEY(ID_FUNC) REFERENCES FUNC(ID_FUNC) ON DELETE CASCADE ON UPDATE RESTRICT)
ENGINE=InnoDB;

#28. Inserir dados na tabela DEPENDENTE.
INSERT INTO Dependente VALUES
(13,"Raimunda","1977-04-04",130), 
(14,"Raimundinha","2003-06-30",130),    
(15,"Raimundinho","2005-02-02",130), 
(16,"Raimundeto","2007-04-04",130), 
(19,"Gumercindinha","2004-05-01",132), 
(20,"Gumercindinho","2008-05-29",132), 
(21,"Alipia","2007-02-11",123), 
(22,"Epaminondinha","2007-03-13",123);

#29. Excluir o funcin[ario 130, Raimundo Nonato.
DELETE FROM FUNC WHERE ID_FUNC=130;
SELECT * FROM FUNC;

########### AULA 04 ###########

#1. Criar o Banco de Dados UNIP.
CREATE DATABASE UNIP;

#2. Abrir o Banco de Dados UNIP
USE UNIP;

#3. Criar a Tabela ALUNO
CREATE TABLE ALUNO
(AlMatr  int  unsigned  not null, 
AlNome  varChar(40), 
AlCurso  varChar(30),
AlDtNasc  date, 
AlDescont  int(2),   
PRIMARY KEY(AlMatr))
ENGINE = InnoDB;

#4. Criar a Tabela DISCIPLINA 
CREATE TABLE DISCIPLINA
(DisCod  int(2)  unsigned  not null,
DisNome  varChar(30), 
DisHoras  int(2),  
DisPreco  decimal(7,2),
PRIMARY KEY(DisCod))
Engine= InnoDB;

#5. Criar a tabela DISC_ALU
CREATE TABLE DISC_ALU
(DisCod  int(2)  unsigned  not null, 
AlMatr  int  unsigned  not null, 
Media   decimal(3,1),
PRIMARY KEY(DisCod, AlMatr))
ENGINE = InnoDB;

#6. Inserir Dados na tabela Aluno.
INSERT INTO ALUNO VALUES
(123,"Jose Silva","Ciencias Computação","1980-10-10",10),
(124,"Maria Silva","Direito","1981-05-05",15),
(125,"Ana Silva","Ciencias Computação","1982-03-03",5), 
(126,"Mario Silva","Ciencias Computação","1983-02-02",20),
(127,"Joao Silva","Direito","1981-06-06",15),
(128,"Ari Silva","Ciencias Computação","1982-08-08",10),
(129,"Fabio Silva","Direito","1980-09-09",5),
(130,"Eva Silva","Direito","1984-07-07",10);

#7. Inserir Dados na tabela Disciplina. 
INSERT INTO DISCIPLINA VALUES
(11,"Eng Software",80,250.00),
(14,"Ingles",40,100.00),
(16,"Portugues",40,140.00),
(19,"Matemática",40,220.00),
(12,"Ling Pog Java",80,280.00),
(15,"Banco de Dados",80,250.00);

#8. Inserir Dados na tabela Disc_Alu.l
INSERT INTO DISC_ALU VALUES
(16, 124, 6.0), (19, 124, 8.5), (11, 130, 4.5), 
(15, 127, 5.0),  (14, 130, 7.0),  (15, 129, 7.5),
(12, 1127, 3.5), (16, 125, 6.0), (19, 127, 5.5),
(11, 123, 9.0), (15, 130, 10.0), (16, 130, 10.0),
(16, 127, 6.5), (12, 124, 8.5), (14, 128, 10.0); 

#9. Listar os dados dos Alunos em ordem decrescente por Nome.
SELECT * FROM ALUNO ORDER BY ALMATR DESC;

#10. Listar o Nome da Diasciplina, Horas e Preço, calculando um NOVO_PRECO 20% maior que o atual. 
SELECT DISNOME, DISHORAS, DISPRECO, ROUND((DISPRECO * 1.2),2) AS NOVO_PRECO FROM DISCIPLINA;

#11. Listar a Matrícula, Nome do Aluno, Nome do Curso e da Disciplina em ordem ascendente por Nome do Aluno.
SELECT A.ALMATR, ALNOME, ALCURSO, D.DISNOME FROM ALUNO A JOIN DISC_ALU DA ON A.ALMATR = DA.ALMATR JOIN DISCIPLINA D ON
DA.DISCOD = D.DISCOD ORDER BY ALNOME ASC;

#12. Listar a Matrícula, Nome do Aluno,  Nome do Curso e da Disciplina em ordem ascendente por Nome do Aluno e 
#descendente por Nome da Disciplina.
SELECT A.ALMATR, ALNOME, ALCURSO, D.DISNOME FROM ALUNO A JOIN DISC_ALU DA ON A.ALMATR = DA.ALMATR JOIN DISCIPLINA D ON
DA.DISCOD = D.DISCOD ORDER BY ALNOME ASC, DISNOME DESC;

#13. Listar todos alunos nascidos em 1981 e 1982.
SELECT * FROM ALUNO WHERE YEAR(ALDTNASC) = 1981 OR YEAR(ALDTNASC) = 1982;

#14. Listar o Nome do aluno, Nome da disciplina , Preço, Desconto e NOVO_PRECO, 
#aplicando o desconto relativo ao aluno (tabela Aluno).
SELECT A.ALNOME, D.DISNOME, DISPRECO, ROUND((DISPRECO - DISPRECO * (A.ALDESCONT/100)),2) AS NOVO_PRECO FROM ALUNO A JOIN DISC_ALU DA ON A.ALMATR = DA.ALMATR JOIN DISCIPLINA D ON
DA.DISCOD = D.DISCOD;

#15. Listar o Nome do aluno, Nome da disciplina Desconto, Ano de nascimento  
#e Novo-Preço, aplicando o desconto relativo ao aluno (tabela Aluno), . somente para os alunos nascidos antes de 1982.
SELECT ALNOME, DISNOME, ALDESCONT AS DESCONTO_PCT, ALDTNASC, ROUND((DISPRECO - DISPRECO * ALDESCONT/100),2)
AS NOVO_PRECO FROM ALUNO A JOIN DISC_ALU DA ON A.ALMATR = DA.ALMATR JOIN DISCIPLINA D ON DA.DISCOD = D.DISCOD;

#16. Criar a VISÃO AlunoDisciplina com os atributos matrÍcula, nome do aluno e curso que frequenta, 
#nome da disciplina e média.
CREATE VIEW AlunoDisciplina AS SELECT A.ALMATR, ALNOME, ALCURSO, D.DISNOME, DA.MEDIA
FROM ALUNO A JOIN DISC_ALU DA ON A.ALMATR = DA.ALMATR JOIN DISCIPLINA D ON DA.DISCOD = D.DISCOD; 

#17. Mostrar os dados da visão AlinoDisciplina.
SELECT * FROM ALUNODISCIPLINA;

#18. Mostrar os dados dos alunos que cursam as disciplinas Ingles  e Portugues (Usar a visão criada)
SELECT * FROM ALUNODISCIPLINA WHERE DISNOME = "Ingles" OR DISNOME="Portugues";

#19. #Criar o Banco de Dados: RedeHotel
CREATE DATABASE RedeHotel;

#20. Abrir o Banco de Dados RedeHotel
USE RedeHotel;

#21. Criar a tabela: Hotel
CREATE TABLE Hotel
(NOME  varChar(35)   NOT NULL,
End       varChar(35), 
Gerente varChar(40),
DtINasc date,
NrEmpreg int(2),
PRIMARY KEY (Nome))
ENGINE = InnoDB; 

#22. Criar a tabelas: HOT_HOSP
CREATE TABLE Hot_Hosp
(NOME  varChar(40)   NOT NULL,
CPF       varChar(15)  NOT NULL, 
DtEntrada date,
DtSaida     date,
PrecoDiaria decimal(7,2),
PRIMARY KEY (Nome, CPF))
ENGINE = InnoDB; 

# 23. Criar a tabelas: HOSPEDE
CREATE TABLE HOSPEDE
(Nome   varChar(40), END varChar(35),     
RG    varChar(12),
CPF  varChar(15)   NOT NULL,
DtNasc  date, Fone  varChar(10),
Profissao  varChar(25),
Sexo  varChar(1), EstCivil  varChar(1),
PRIMARY KEY (CPF)) 
ENGINE = InnoDB; 

#24. Entrar com dados na tabela: HOTEL 
       INSERT INTO HOTEL VALUES
("HOTEL PIRIRI SÃO PAULO","Rua X","José Silva","1950-10-13", 12),
("HOTEL PIRIRI GUARUJA","Rua Y","Nair Souza","1982-01-01", 10),
("HOTEL PIRIRI NATAL", "Rua Z", "Ari Santos","1987-05-01", 5),
("HOTEL PIRIRI MACEIO", "Rua K", "Jorge Soares","1978-03-11", 15),
("HOTEL PIRIRI CUIABA", "Rua M", "Aba Bastos","1992-09-04", 10),
("HOTEL PIRIRI CURITIBA", "Rua N", "Maria Silva","1982-10-13", 13),
("HOTEL PIRIRI BELEM", "Rua J", "Antonio Souza","1995-04-01", 11),
("HOTEL PIRIRI LIMA", "Rua L", "Ruiz Solano","1982-11-05", 16),
("HOTEL PIRIRI QUITO", "Rua Q", "José Syllan","1987-06-02", 10),
("HOTEL PIRIRI CAMPINAS", "Rua W","Joao Santos","1995-11-10", 9);

#25. Entrar com dados na tabela: HOSPEDE
          INSERT INTO HOSPEDE VALUES
   ("Mario Souza","Rua A","145.492.789","123.456.789-12",
   "1972-12-10","1111 11 11","Engenheiro Civil","M","2"),
   ("Joao Silva","Rua B","541.294.987","321.654.987-21",
   "1958-01-30","2222 22 22","Analista Sistemas","M","2"),
   ("Maria Soares","Rua C","258.369.147","741.852.936-11",
   "1977-10-12","3333 33 33","Secretária","F","1"),
   ("Magda Souza","Rua D","963.852.741","159.357.753-10",
   "1968-01-21","4444 44 44","Delegada Feminina","F","2"),
   ("Eva Braun","Ria E","777.444.333","999.111.555-07",
   "1958-05-02","5555 55 55","Engenheiro Eletrica","F","2");
   
#26. Entrar com dados na tabela: HOT_HOSP 
INSERT INTO HOT_HOSP VALUES
("HOTEL PIRIRI GUARUJA", "321.654.987-21",
"2007-12-30","2008-01-10",180.00),
("HOTEL PIRIRI BELEM", "123.456.789-12",
"2006-12-23","2007-01-06",140.00),
("HOTEL PIRIRI NATAL", "321.654.987-21",
"2008-07-01","2008-07-21",210.00),
("HOTEL PIRIRI CAMPINAS", "123.456.789-12",
"2007-06-28","2007-07-10",160.00),
("HOTEL PIRIRI GUARUJA", "123.456.789-12",
"2008-10-18","2008-10-24",170.00),
("HOTEL PIRIRI SÃO PAULO", "741.852.936-11",
"2009-01-01","2009-01-10",200.00);

#27. Mostrar quem se hospedou no hotel: HOTEL PIRIRI NATAL e quando.
SELECT H.NOME FROM HOSPEDE H JOIN HOT_HOSP HH ON H.CPF = HH.CPF WHERE HH.NOME = "HOTEL PIRIRI NATAL";

#28. Mostrar quem utilizou o hotel no ano de 2008 e qual hotel.
SELECT H.NOME, HH.NOME FROM HOSPEDE H JOIN HOT_HOSP HH ON H.CPF = HH.CPF WHERE YEAR(DTENTRADA);

#29. Mostrar quem utilizou o hotel no ano de 2008 e qual hotel.
#REPETIDO

#30. Mostrar que hoteis e quando, o hospede Joao Silva utilizou e quais as diárias pagas.
SELECT HH.NOME, DTENTRADA, DTSAIDA, PRECODIARIA, (DATEDIFF(DTSAIDA, DTENTRADA) * PRECODIARIA) AS SOMA_DIARIAS FROM HOSPEDE H JOIN HOT_HOSP HH ON H.CPF = HH.CPF WHERE
H.CPF="321.654.987-21";

#31. Mostrar qual o preço e PREÇO_ATUAL da diária do HOTEL PIRIRI SÃO PAULO, sabendo qie houve um aumento de 22%.
SELECT ROUND((PRECODIARIA * 1.22),2) AS AUMENTO_22_PCT FROM HOT_HOSP WHERE NOME="HOTEL PIRIRI SÃO PAULO";

#32. Mostrar quantas entradas houveram nos hoteis.
SELECT COUNT(*) FROM HOT_HOSP;

#33. Mostrar os nomes dos hospedes, nomes dos hotéis e datas de entrada de quem utilizou a rede de hoteis em Dezembro.
SELECT H.NOME, HH.NOME, DTENTRADA FROM HOSPEDE H JOIN HOT_HOSP HH ON H.CPF = HH.CPF WHERE MONTH(DTENTRADA) = 12;

#34. Mostrar os hospedes cujos nomes NÃO começam com a letra ‘E’.
SELECT NOME FROM HOSPEDE WHERE NOME NOT LIKE "E%";

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

########### AULA 06 ###########

#1. Criação do Banco de Dados
CREATE DATABASE ESTOQUE;
USE ESTOQUE;

#2. Criação da tabela: Produtos
CREATE TABLE PRODUTOS 
(CodProd  int  unsigned not null,
NomeProd varChar(35), 
CategoriaProd varChar(20),
PrecoUnitProd decimal(7,2),
Primary Key(CodProd)) Engine=InnoDB;

#3. Inserir dados na tabela: Produtos
INSERT INTO PRODUTOS VALUES
(1022, "Camiseta", "Grande", 15.00),
(1029, "Alcool Gel", "Unidade", 4.20),
(1024, "Grampo Papel","Caixa", 9.85),
(1036, "Cartucho Impress", "Unidade", 62.00),
(1026, "Macacão", "Grande", 82.00),
(1023, "Vassoura", "Unidade", 12.00);

#4. Criar a procedure InsereProduto com os parâmetros: 
#cod int, nome char(35), cat char(20) e  prec decimal(7,2) e os 
#procedimentos para inserir um produto na tabela Produtos.
DELIMITER |
CREATE PROCEDURE InsereProduto
(cod int, nome char(35), cat char(20), prec decimal(7,2))
BEGIN
INSERT INTO PRODUTOS VALUES (cod,nome,cat,prec);
END
|DELIMITER ;

#5. Ver as procedures criadas e as características da procedure InsereProduto. 
SHOW CREATE PROCEDURE INSEREPRODUTO;

#6. Executar a procedure InsereProduto com (1025, "Rebimbola Piriri", "Unidade", 35.50)
CALL INSEREPRODUTO(1025, "Rebimbola Piriri", "Unidade", 35.50);
SELECT * FROM PRODUTOS;

#7. Crie a procedure: ListaProduto com os procedimentos que liste codigo, nome e preco unitário) dos produtos 
#cujos preços unitários sejam maiores do que o preço informado em parâmetro.
DELIMITER |
CREATE PROCEDURE ListaProduto
(preco decimal(7,2))
BEGIN
SELECT CodProd, NomeProd, PrecoUnitProd FROM PRODUTOS WHERE PrecoUnitProd > preco;
END
| DELIMITER ;

#8. Ver as procedures criadas.
SHOW PROCEDURE STATUS;

#9. Executar a procedure ListaPreco com: 10,00 
CALL ListaProduto(10.00);

#10. Crie a procedure: AumentaPreco que aumente os preços unitários, 
#no percentual informado por parâmetro, do produto, também informados por parâmetro.
DELIMITER |
CREATE PROCEDURE AumentaPreco
(cod int, aumento decimal(7,2))
BEGIN
UPDATE PRODUTOS SET PrecoUnitProd = PrecoUnitProd + PrecoUnitProd * aumento/100 WHERE CodProd = cod;
END
| DELIMITER ;
select * FROM PRODUTOS;

#11. Executar a procedure AumentaPreco com: 1025, 30
CALL AumentaPreco(1025,30);
SELECT * FROM PRODUTOS;

#12. Excluir a procedure InsereProduto. 
DROP PROCEDURE InsereProduto;



