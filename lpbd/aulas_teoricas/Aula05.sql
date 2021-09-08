#1
create database organizacao;

#2
use organizacao;

#3
CREATE TABLE DEPTO          
(codDep int(2) unsigned   not null,    
 nomeDep  varChar(25),
 quantDep  int(2),
 PRIMARY KEY(codDep));
 
 #4
 CREATE TABLE FUNC          
 (identFunc int(2) unsigned not null,     
 nomeFunc   char(40),
 funcaoFunc char(20), 
 dtadFunc  date,
 salFunc  decimal(7,2),  
 comisFunc  decimal(7,2),  
 codDepFunc   int(2), 
 PRIMARY KEY(identFunc));
 
 #5
INSERT INTO Depto VALUES
(10,"Diretoria",5),
(13, "Marketing", 18),   
(16, "Financeiro", 23),
(17, "Producao", 109), 
(14, "Pessoal", 11),
(15, "Vendas", 9),   
(12, "Compras",22),
(11,  "Suprimento",8), 
(18, "Estoque",7);

#6
INSERT INTO Func VALUES
(1,"Jose","Analista","1994-10-04",2100,500,12),  
(2,"Paulo","Pintor","1995-10-10",960,0,13), 
(3,"Rocha","Funileiro","2000-01-07",1300,0,13),    
(4,"Maria","Vendedor","1999-05-04",1800,2400,15),     
(5,"Neide","Analista","2000-12-10",2500,750,17),
(6,"Irma","Vendedor","2000-09-09",1200,3300,15),
(7,"Fabio","Presidente","1986-01-07",15000,2300,10);

#7
select * from depto;

#8
select * from func;

#9
select identfunc, nomefunc from func;

#10
select identfunc, nomefunc, coddepfunc from func where funcaofunc = "Vendedor";

#11
select nomefunc, salfunc from func where salfunc > 1500 and salfunc < 2600;

#12
update func set comisfunc = 100.00 where funcaofunc = "Pintor";
select * from func;

#13
select f.nomefunc as FUNCIONÁRIO, funcaofunc as FUNÇÃO, d.nomedep as DEPARTAMENTO from func f join depto d on f.coddepfunc = d.coddep;

#14
select nomefunc as FUNCIONÁRIO, funcaofunc as FUNÇÃO, salfunc as SALÁRIO from func join depto on coddepfunc = coddep
where nomedep = "Producao";

#15
update func join depto on coddepfunc = coddep set salfunc = salfunc * 1.2 where nomedep = "Vendas";
select * from func;

#16
update func join depto on coddepfunc = coddep set salfunc = salfunc * 1.1
where nomedep = "Marketing" and salfunc + comisfunc < 1200;
select * from func;

#17
select nomefunc, salfunc, comisfunc, (salfunc + comisfunc) as NOVO_SALARIO from func join depto on coddepfunc = coddep
where nomedep = "Vendas";

#18
delete from func where coddepfunc = 13 and funcaofunc not like "Analista";