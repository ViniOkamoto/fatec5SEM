#RA: 1110481823052 - Bruno Bega Harnik
#MySQL

drop database ESCOLA_AULA05;
create database ESCOLA_AULA05;
use ESCOLA_AULA05;

create table Predio (
	CodPred INT primary key,
    NomePred VARCHAR(40)
);

create table Depto (
	CodDepto CHAR(5) primary key,
    NomeDepto VARCHAR(40)
);

create table Titulacao (
	CodTit INT primary key,
    NomeTit VARCHAR(40)
);

create table Disciplina (
	CodDepto CHAR(5),
    NumDisc INT,
    NomeDisc VARCHAR(10),
    CreditoDisc INT,
    primary key (CodDepto, NumDisc),
    constraint FK_Disciplina_Relation_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict
);

create table Turma (
	AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CapacTur INT,
    primary key (AnoSem, CodDepto, NumDisc, SiglaTur)
);

create table Horario (
	AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    DiaSem INT,
    HoraInicio INT,
    NumSala INT,
    CodPred INT,
    NumHoras INT,
	primary key (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio)
);

create table Sala (
	CodPred INT,
    NumSala INT,
    DescricaoSala VARCHAR(40),
    CapacSala INT,
    primary key (CodPred, NumSala),
    constraint FK_Sala_Relation_Predio foreign key (CodPred) references Predio(CodPred) ON DELETE restrict
);

create table Professor (
	CodProf INT primary key,
    CodDepto CHAR(5),
    CodTit INT,
    NomeProf VARCHAR(40),
    constraint FK_Professor_Relation_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict,
    constraint FK_Professor_Relation_Titulacao foreign key (CodTit) references Titulacao(CodTit) ON DELETE restrict
);

create table ProfTurma (
	AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CodProf INT,
    primary key (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf),
    constraint FK_ProfTurm_Profturma_Professor FOREIGN KEY (CodProf) references Professor(CodProf) ON DELETE restrict
);

create table PreReq (
	CodDeptoPreReq CHAR(5),
    NumDiscPreReq INT,
    CodDepto CHAR(5),
    NumDisc INT,
    primary key (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc),
    constraint FK_PreReq_Tem_Pre_Discipli foreign key (CodDeptoPreReq, NumDiscPreReq) references Disciplina(CodDepto, NumDisc) on delete restrict,
    constraint FK_PreReq_Eh_Pre_Discipli foreign key (CodDepto, NumDisc) references Disciplina(CodDepto, NumDisc) on delete restrict
);

#Altero as tabelas com as chaves estrangeiras...
alter table Turma add constraint FK_Turma_Relation_Discipl FOREIGN KEY (CodDepto, NumDisc) references Disciplina(CodDepto, NumDisc) on delete restrict;
alter table Horario add constraint FK_Horario_Relation_Turma foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) references Turma(AnoSem, CodDepto, NumDisc, SiglaTur) on delete restrict;
alter table Horario add constraint FK_Horario_Relation_Sala foreign key (CodPred, NumSala) references Sala(CodPred, NumSala) on delete restrict;
alter table ProfTurma add constraint FK_Profturm_Profturma_Turma foreign key (AnoSem, CodDepto, NumDisc, Siglatur) references Turma(AnoSem, CodDepto, NumDisc, SiglaTur) on delete restrict;

insert into Depto (CodDepto, NomeDepto) values 
    ('TI001', 'Informatica'),
    ('TI002', 'Logica'),
    ('TI003', 'Matematica')
;

insert into Disciplina (CodDepto, NumDisc, NomeDisc, CreditoDisc) values 
    ('TI001', 0001, 'Excel', 0004),
    ('TI001', 0002, 'Seguranca', 0002),
	('TI002', 0003, 'BD', 0004),
	('TI002', 0004, 'Java', 0004),
    ('TI003', 0005, 'Calculo', 0004),
    ('TI003', 0006, 'Estat', 0004),
    ('TI003', 0007, 'Prog Lin', 0004)
;

DELIMITER $$
CREATE PROCEDURE PROVA_PAR_DEP_DISC_COUNT()
BEGIN
	DECLARE finalizado INT default 0;
	DECLARE cNomeDepto VARCHAR(40);
	DECLARE cCountDisc INT;
    DECLARE c CURSOR FOR select d.NomeDepto, (select count(dis.NumDisc) from DISCIPLINA dis where dis.CodDepto = d.CodDepto) CountDisc from Depto d order by CountDisc desc;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finalizado = 1;
    
OPEN c;

CREATE TEMPORARY TABLE cTotal(
	 tNomeDepto VARCHAR(40),
     tCountDisc INT
);

getTotal: loop
	FETCH c INTO cNomeDepto, cCountDisc;
    IF finalizado THEN
		SELECT * from CTotal;
		LEAVE getTotal;
	END IF;
    INSERT INTO CTotal (tNomeDepto, tCountDisc) values (cNomeDepto, cCountDisc);
end loop getTotal;

DROP TEMPORARY TABLE CTotal;
CLOSE c;

END$$
DELIMITER ;

CALL PROVA_PAR_DEP_DISC_COUNT();

#A - FUNCIONOU