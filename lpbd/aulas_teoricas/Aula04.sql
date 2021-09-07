#1
create database empresa;

#2
use empresa;

#3
CREATE TABLE Func          
(IdentFunc  int(2)  unsigned not null,     
NomeFunc   varChar(40),
FuncaoFunc varChar(20),    
DtAdFunc     date,
SalFunc        decimal(7,2),  
ComisFunc   decimal(7,2),      
PRIMARY KEY (identfunc ));

#4
INSERT INTO Func VALUES
(1,"Jose","Analista","1994-10-04",2100,500),  
(2,"Paulo","Pintor","1995-10-10",960,0), 
(3,"Rocha","Funileiro","2000-01-07",1300,0),    
(4,"Maria","Vendedor","1999-05-04",1800,2400),     
(5,"Neide","Analista","2000-12-10",2500,750),
(6,"Irma","Vendedor","2000-09-09",1200,3300),
(7,"Fabio","Presidente","1986-01-07",15000,2300);

#5
select * from func;

#6
select identfunc, nomefunc, salfunc from func;

#7
select identfunc, nomefunc, salfunc from func
where funcaofunc = "Vendedor";

#8
select nomefunc, funcaofunc, salfunc from func
where salfunc < 1600;

#9
update func set salfunc = salfunc * 1.15
where funcaofunc = "Vendedor";
select * from func;

#10
delete from func where identfunc=5;
select * from func;

#11
select nomefunc, dtadfunc, ((year(current_date()) - year(dtadfunc))) as tempo_servico from
func;

#12
update func set salfunc = salfunc * 1.25
where (year(current_date()) - year(dtadfunc) > 25);

#13
select nomefunc, min(salfunc) from func;
select nomefunc, max(salfunc) from func;

#14
select * from func where nomefunc like "m%" or nomefunc like "p%";

#15
select round(avg(salfunc),2) from func;





