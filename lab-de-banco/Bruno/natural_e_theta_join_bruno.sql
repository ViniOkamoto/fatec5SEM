use ESCOLA_AULA05;

insert into Depto (CodDepto, NomeDepto) value
	('INFOR', 'Tecnologia'),
	('MATEM', 'Matemática');

insert into Disciplina (CodDepto, NumDisc, NomeDisc, CreditoDisc) values 
	('INFOR', 30, 'PowerPoint', 4),
    ('INFOR', 31, 'COBOL', 4),
    ('INFOR', 32, 'PaintBrush', 4),
    ('INFOR', 33, 'Internet', 4);

insert into Predio (CodPred, NomePred) values 
	(420, 'Alan Turing'),
    (666, 'Grace Hooper'),
    (999, 'Informática - aulas');
    
insert into Sala (CodPred, NumSala, DescricaoSala, CapacSala) values
	(420, 11, 'Sala da bagunça', 600),
    (666, 10, 'Sala dos caras chatos', 20),
    (420, 12, 'Sala homogênea', 40),
    (420, 13, 'Sala 13', 50),
    (666, 11, 'Sala Feliz', 30),
    (420, 101, 'Sala dos bolados', 600),
	(999, 11, 'Sala da bagunça', 600),
    (999, 10, 'Sala dos caras chatos', 20),
    (999, 12, 'Sala homogênea', 40),
    (999, 13, 'Sala 13', 50),
    (999, 101, 'Sala dos bolados', 600);
    
insert into Turma (AnoSem, CodDepto, NumDisc, SiglaTur, CapacTur) values
	(20021, 'INFOR', 30, 'BA', 300),
    (20021, 'INFOR', 31, 'XA', 500),
    (20022, 'INFOR', 32, 'RI', 400),
    (20042, 'INFOR', 31, 'AS', 700),
    (20041, 'INFOR', 33, 'LO', 8);

select distinct NomeDepto FROM Depto, (select * from Sala natural join Predio natural join Disciplina natural join Turma where NumSala = 101 and NomePred = "Informática - aulas" and AnoSem = 20021) a;