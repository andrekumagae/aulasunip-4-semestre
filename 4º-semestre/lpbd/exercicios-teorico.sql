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
SELECT NOMEFUNC, FUNCAOFUNC, NOMEDEP FROM FUNC JOIN DEPTO ON CODDEPFUNC = CODDEP;

#14. Listar o nome dos empregados, a função e o salário dos empregados do depto: Produção.
SELECT NOMEFUNC, FUNCAOFUNC, SALFUNC FROM FUNC JOIN DEPTO ON CODDEPFUNC = CODDEP
WHERE NOMEDEP = "Producao";
#Ou
SELECT NOMEFUNC, FUNCAOFUNC, SALFUNC FROM FUNC WHERE CODDEPFUNC = 17;

#15. Aumentar o salário dos funcionários do depto de Vendas em 20%.
UPDATE FUNC JOIN DEPTO ON CODDEPFUNC = CODDEP SET SALFUNC = SALFUNC * 1.2 WHERE NOMEDEP = "Vendas";
#OU
UPDATE FUNC SET SALFUNC = SALFUNC * 1.2 WHERE CODDEPFUNC = 15;
SELECT * FROM FUNC;


#16. Aumentar o salário dos funcionários do depto de Marketing, em 10%, 
#para os funcionários que ganham, com salario e comissão menos de 1200.00.
UPDATE FUNC JOIN DEPTO ON CODDEPFUNC = CODDEP SET SALFUNC = SALFUNC * 1.1 WHERE NOMEDEP = "Marketing"
AND (SALFUNC + COMISFUNC) < 1200.00;
#OU
UPDATE FUNC SET SALFUNC = SALFUNC * 1.1 WHERE CODDEPFUNC = 13 AND  (SALFUNC + COMISFUNC) < 1200.00;
SELECT * FROM FUNC;

#17. Listar o nome, o salario a comissão e o NOVO_SALARIO 
#(salário + comissão) dos empregados do departamento de Vendas.
SELECT NOMEFUNC, SALFUNC, COMISFUNC, (SALFUNC + COMISFUNC) AS NOVO_SALARIO FROM FUNC F JOIN DEPTO D ON
F.CODDEPFUNC = D.CODDEP WHERE NOMEDEP = "Vendas";

#18. Excluir todos funcionários do depto de Maeketing e que não sejam Analistas.
DELETE F.* FROM FUNC F JOIN DEPTO D ON F.CODDEPFUNC = D.CODDEP WHERE NOMEDEP = "Marketing" AND
FUNCAOFUNC <> "Analista";
SELECT NOMEFUNC, SALFUNC, COMISFUNC AS NOVO_SALARIO FROM FUNC F JOIN DEPTO D ON
F.CODDEPFUNC = D.CODDEP WHERE NOMEDEP = "Marketing";
SELECT * FROM FUNC;

########### AULA 06 ###########

#Sem exercícios

########### AULA 07 ###########

#Sem exercícios

########### AULA 08 ###########

#1. Criar o Banco de Dados Funcionarios
CREATE DATABASE FUNCIONARIOS;
USE FUNCIONARIOS;

#2. Criar a tabela Func
CREATE TABLE Func
(ID_FUNC int UNSIGNED NOT NULL,
NOME_FUNC varChar(40)  NOT NULL ,
SALARIO DECIMAL(7,2),
DEPTO varChar(03),
PRIMARY KEY(ID_FUNC)) ENGINE=InnoDB;

#3. Inserir dados na tabela Func.
INSERT INTO FUNC VALUES
(5,"Jose Silva",1300.00,"INF"),(3,"Maria Santos",2400.00,"COM"), (1,"Nair Bello",4800.00,"ven"), (7,"                Carlos Souza",900.00,"pro"), 
(9,"Marcio Bastos",6200.00,"FIN"), (2,"      João Maia",2010.00,"inf"),(4,"Nair Caju",1950.00,"com"), 
(6,"Eva Brito",4480.00,"vem"), (10,"José das Couves",3290.00,"PES"), (8,"Vania Melo",725.10,"pes"),(11,"Joana Matos",848.50,"RH");

SELECT * FROM FUNC;

#4. Funções LOWER() e UPPER()
SELECT LOWER(NOME_FUNC) AS MINUSCULO, UPPER(NOME_FUNC) AS MAIUSCULO FROM FUNC;

/*#5.
LTRIM para tirar espaços a esquerda
LENGTH RETORNA TAMANHO
SUBSTR Fatia a string
CONCAT  concatena strings
*/

SELECT LTRIM(NOME_FUNC) AS NOME_ALINHADO, 
		LENGTH(NOME_FUNC) AS TAMANHO,SUBSTR(NOME_FUNC, 2,5) AS PEDACO,
        CONCAT(NOME_FUNC," ",DEPTO) AS NOME_FUNC_DEPTO FROM FUNC;
        
#6. INSTR Saber a posição da string
SELECT NOME_FUNC AS NOME, INSTR(NOME_FUNC, "Caju") as POSICAO FROM FUNC;

#Possível usar com WHERE pra buscar pelo nome
SELECT nome_Func as Nome_Funcionario,
salario as Salario FROM Func WHERE INSTR(nome_Func,"Couves") != 0;

#7.
/*
ABS Valor absoluto (sempre positivo)
MOD Resto da divisao
PI valor de PI
POW potencia
ROUND arredondar
SQRT raiz quadrada
*/
SELECT ABS(-1328), MOD(233,2), PI() as VALOR_PI, POW(3,4),SQRT(id_Func) 
FROM Func WHERE Id_Func = 8;
SELECT salario as Salario, ROUND(salario) as Salario_Arredondado FROM Func WHERE Id_Func = 8;

#8
/*
AVG media
COUNT quantidade de registros
MAX valor maximo
MIN valor minimo
STD o desvio padrao
STDDEV desvio padrao para Oracle
SUM soma
VARIANCE variancia
*/

/*
CURDATE     Data atual
CURTIME      Hora atual
DATEDIFF     Diferença entre duas datas
DAY                O dia de uma data
HOUR            A hora de um atributo hora
MIN                Os minutos de um atributo hora
MONTH         O mês de uma data
MONTHNAME  O nome do mês de uma data
NOW              Data e hora atual
SECOND       Os segundos de um atributo hora
YEAR             O ano de uma data
*/
SELECT CURDATE(), CURTIME(), DATEDIFF(CURDATE(),"2020-01-01") AS DIFERENCA_DATAS;

#FUNÇÕES

#1. Criar a tabela Dependente
CREATE TABLE Dependente
(Id_Dep int UNSIGNED NOT NULL,
Nome_Dep varChar(40)  NOT NULL ,
Grau_Dep varChar(10),
Data_Nasc Date,
Id_Func_Dep int UNSIGNED NOT NULL,
PRIMARY KEY(Id_Dep, Id_Func_Dep)) 
ENGINE=InnoDB;

#2. Inserir dados na tabela Dependente.
INSERT INTO Dependente VALUES
(1,"Maria Silva","Esposa","2008-09-26",5),
(2,"Mariazinha","Filha","1997-05-02",5),  (3,"Zezinho","Filho","2010-01-15",5),
(1,"Carlota Souza","Esposa","2011-06-20",7),
(2,"Carlinhos","Filho","2015-04-01",7),
(1,"João Matos","Marido","1985-12-05",11),
(2,"Joaninho","Filho","2005-03-01",11), 
(3,"Joaninha","Filha","2007-01-01",11),
(4,"Matinha","Filha","2012-04-30",11);

/*3. Considerando que a empresa gasta 200.00 reais por dependente, criar uma function, 
chamada TotalGastoDep, que retorne o total de gasto da empresa para um determinado funcionário 
(parâmetro id int).*/
DELIMITER |
CREATE FUNCTION GastoDep(id int)
returns decimal(7,2) -- perceba que comparando com Java, declaramos o retorno depois do nome da função invés de antes
-- e com a palavra returns
BEGIN
declare valorGasto decimal(7,2) default 0; -- temos que colocar a palavra declare para cada var com o tipo primitivo valor default
	SELECT COUNT(*) * 200 into valorGasto FROM DEPENDENTE WHERE ID_FUNC_DEP=id; --  usar a palavrar into para atribuir o calculo a variavel
    return valorGasto; -- declarar o returno da variavel
END
| DELIMITER ;

SELECT GastoDep(11) as SOMA_DEPENDENTES;
SELECT LTRIM(NOME_FUNC) AS NOME_FUNC, NOME_DEP, ID_FUNC_DEP, ID_DEP FROM FUNC F JOIN DEPENDENTE D ON F.ID_FUNC = D.ID_FUNC_DEP
ORDER BY ID_FUNC_DEP;






