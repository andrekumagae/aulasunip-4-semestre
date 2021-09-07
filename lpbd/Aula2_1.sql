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
select nome from aluno;

#8
select nome, media from aluno;

#9



