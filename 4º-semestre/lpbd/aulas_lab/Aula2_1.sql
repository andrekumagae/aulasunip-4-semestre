#1
drop database universidade;
create database universidade;

#2
use universidade;

#3
create table aluno(
matricula int(2),
nome varchar(35),
media decimal(3.1)
);

#4
show tables;

#5
desc aluno;


#6
insert into aluno values
(1234, "Maria da Silva",8.2), (1231, "João da Silva",5.5),
(1236, "Jose da Silva",10.0), (1237, "Ana da Silva",0.0),
(1233, "Ari da Silva",7.0), (1230, "Benedita da Silva",8.2),
(12381, "Asdrubal da Silva",5.5), (1232, "Filó da Silva",10.0),
(1239, "José da Silva",0.0), (1235, "Alcinda da Silva",7.0);

#7
select * from aluno;
select nome from aluno;

#8
select nome, media from aluno;

#9
select nome, media from aluno where media > 5;

#10
select nome from aluno where matricula > 1234 and matricula < 1237;

#11
select nome, media from aluno where matricula > 1235 and media < 5;

#12
select matricula, nome from aluno where media >= 7;

#13
select * from aluno where matricula = 1236;

#14
select * from aluno where nome = "Maria da Silva" or nome = "Ana da Silva";

#15
select * from aluno where media > 3 and media < 7;

#16
#modificar para alunos que foram reprovados (menor que 3)
select nome, media from aluno where media < 3;

#17
select nome, media from aluno where media >= 7;

#18
select * from aluno;
alter table aluno add column sexo char(1);
update aluno set sexo='M' where 
matricula = 1231 or matricula = 1236 or matricula = 1233 or matricula = 12381 or matricula = 1239;
update aluno set sexo='F' where  sexo is null;
select * from aluno where sexo='M';
