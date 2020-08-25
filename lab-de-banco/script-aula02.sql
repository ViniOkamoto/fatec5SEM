create database ESCOLA;
use ESCOLA;

/* 1) modelagem das tabelas */

create table TB_ESTADO (
    SIGLA_ESTADO char(2) PRIMARY KEY,
    NOME_ESTADO varchar(40)
);
create table TB_CLASSE (
    ID_CLASSE smallint PRIMARY KEY,
    ID_ANDAR smallint
);

create table TB_PROFESSOR (
    ID_PROFESSOR char(3) PRIMARY KEY,
    NOME_PROFESSOR varchar(25)
);

create table TB_DISCIPLINA (
    ID_DISCIPLINA char(3) PRIMARY KEY,
    NOME_DISCIPLINA varchar(15),
    ID_PROFESSOR_DISCIPLINA char(3),
    NOTA_MINIMA_DISCIPLINA smallint,
    constraint FK_TB_DISCIPLINA_TB_PROFESSOR foreign key (ID_PROFESSOR_DISCIPLINA) references TB_PROFESSOR(ID_PROFESSOR) on delete restrict
);

create table TB_ALUNO (
    COD_ALUNO smallint PRIMARY KEY,
    NOME_ALUNO varchar(45),
    END_ALUNO varchar(100),
    SIGLA_ESTADO char(2),  
    ID_CLASSE smallint,
    constraint FK_TB_ALUNO_TB_ESTADO foreign key (SIGLA_ESTADO) references TB_ESTADO(SIGLA_ESTADO) on delete restrict,
    constraint FK_TB_ALUNO_TB_CLASSE foreign key (ID_CLASSE) references TB_CLASSE(ID_CLASSE) on delete restrict
);

create table TB_ALUNO_DISCIPLINA (
    COD_ALUNO smallint,
    ID_DISCIPLINA char(3),
    NOTA_ALUNO smallint,
    constraint FK_TB_ALUNO_DISCIPLINA_TB_ALUNO foreign key (COD_ALUNO) references TB_ALUNO(COD_ALUNO) on delete restrict,
    constraint FK_TB_ALUNO_DISCIPLINA_TB_DISCIPLINA foreign key (ID_DISCIPLINA) references TB_DISCIPLINA(ID_DISCIPLINA) on delete restrict
);


/* Insert de Estado */
insert into TB_ESTADO(SIGLA_ESTADO, NOME_ESTADO) values ('SP', 'São Paulo');

/* Insert de Classe */
insert into TB_CLASSE(ID_CLASSE, ID_ANDAR) values (1, 1), (2, 2), (3, 3); 

/* 1.2) 1- tabela de professores */

insert into TB_PROFESSOR(ID_PROFESSOR, NOME_PROFESSOR) values 
('JOI', 'JOILSON CARDOSO'),
('OSE', 'OSEAS SANTANA'),
('VIT', 'VITOR VASCONCELOS'),
('FER', 'JOSE ROBERTO FERROLI'),
('LIM', 'VALMIR LIMA'),
('EDS', 'EDSON SILVA'),
('WAG', 'WAGNER OKIDA');

/* 1.2) 2- tabela de alunos */
insert into TB_ALUNO(COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE) values 
(1, 'ANTONIO CARLOS PENTEADO', 'RUA X', 'SP', '1'),
(2, 'AUROMIR DA SILVA VALDEVINO', 'RUA W', 'SP', '1'),
(3, 'ANDRE COSTA', 'RUA T', 'SP', '1'),
(4, 'ROBERTO SOARES DE MENEZES', 'RUA BW', 'SP', '2'),
(5, 'DANIA', 'RUA CCC', 'SP', '2'),
(6, 'CARLOS MAGALHAES', 'AV SP', 'SP', '2'),
(7, 'MARCELO RAUBA', 'AV SAO LUIS', 'SP', '3'),
(8, 'FERNANDO', 'AV COUNTYR', 'SP', '3'),
(9, 'WALMIR BURIN', 'RUA SSISIS', 'SP', '3');

/* 1.2) 3- tabela de disciplinas */
insert into TB_DISCIPLINA 
(ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA) values 
('MAT', 'MATEMATICA', 'JOI', 7),
('POR', 'PORTUGUES', 'VIT', 5),
('FIS', 'FISICA', 'OSE', 3),
('HIS', 'HISTORIA', 'EDS', 2),
('GEO', 'GEOGRAFIA', 'WAG', 4),
('ING', 'INGLES', 'LIM', 2);

/* 1.2) 4- tabela de relacionamento aluno x disciplina */
insert into TB_ALUNO_DISCIPLINA (COD_ALUNO, ID_DISCIPLINA, NOTA_ALUNO) values
(1, 'MAT', 0),
(2, 'MAT', 0),
(3, 'MAT', 1),
(4, 'POR', 2),
(5, 'POR', 2),
(6, 'POR', 2),
(7, 'FIS', 3),
(8, 'FIS', 3),
(9, 'FIS', 3),
(1, 'POR', 2),
(2, 'POR', 2),
(7, 'POR', 2),
(1, 'FIS', 3);