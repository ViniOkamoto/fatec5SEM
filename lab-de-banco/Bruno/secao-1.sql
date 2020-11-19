SET AUTOCOMMIT = 0;
use ESCOLA_AULA05;

drop table vitamina;
drop table alimento;


/*seção 1*/

create table Alimento (
	cod Int primary key,
    nome varchar(30)
);
insert into Alimento (cod, nome) values
	(1, 'Batata'),
    (2, 'Arroz'),
    (3, 'Feijão'),
    (4, 'Soja'),
    (5, 'Cenoura'),
    (6, 'Beterraba'),
	(7, 'Pepino'),
    (8, 'Cebola'),
    (9, 'Rabanete'),
    (10, 'Nabo'),
    (11, 'Berinjela'),
    (12, 'Aipo')
;
select * from Alimento;

create table vitamina (
	cod Int primary key,
    nomeVitamina varchar(30),
    codAlimento Int,
    foreign key (codAlimento) references Alimento(cod)
);

insert into vitamina (cod, nomeVitamina, codAlimento) values
	(1, 'Fósforo', 7),
    (2, 'Ferro', 3),
    (3, 'Vitamaina A', 4),
    (4, 'Vitamina B', 6),
    (5, 'Vitamaina C', 8);
select * from vitamina;

start transaction;
select * from vitamina where cod = 3;
update alimento set nome = "Super Feijão" where cod = 3;
select * from vitamina where codAlimento = 3;
update vitamina set nomeVitamina = 'Ferro do feijão' where codAlimento = 3;