#1
create database veiculo;

#2
use veiculo;

#3
create table automovel(
placa varchar(8) not null,
ano int(2),
modelo varchar(20),
preco decimal(7,2),
primary key (placa)
);

#4
INSERT INTO automovel VALUES
("PXJ 5678",2012,"Gol",10000.00), 
("DBM 2345",2014,"Corsa",10500.00),
("KPT 1234",2015,"Tempra",15500.00),
("PKT 9876",2018,"Santana",29800.00),
("LKU 5432",2013,"Monza",24700.00),
("JKY 1478",2016,"Corsa",28000.00),
("MCU 4321",2012,"Fiorino",15000.00),
("DQZ 8877",2018,"Corolla",31200.00),
("DQR 6479",2019,"Santana",49600.00);

#5
select * from automovel;

#6
select * from automovel order by modelo;

#7
select * from automovel order by modelo asc, preco desc;

#8
select placa, modelo, ano, preco from automovel
where preco < 20000;

#9
select * from automovel;

#10
select placa, modelo, ano, preco, round((preco * 1.15),2) as novo_preco
from automovel where preco < 20000;

#11
select * from automovel;

#12
update automovel set preco= preco * 1.15 where preco < 20000;

#13
select * from automovel;










