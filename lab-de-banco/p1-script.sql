/* 
Nome: Fernanda Pinheiro Reis			RA: 1110481823022

Com base no Modelo de Dados estudado nas ultimas Aulas, Criar uma Stored Procedure usando CURSOR IMPLICITO para:  

1- Obter, para cada departamento, seu nome e o número de disciplinas do departamento. Obter o resultado em ordem descendente de número de disciplinas. 

OBS: O Arquivo ".SQL" da resposta de conter o script da criação das tabelas envolvidas, seus INSERTS e o código da procedure no final.
(Integridade referencial não é necessário)

ATENÇAO - Coloque seu RA e NOME COMPLETO no INICIO DO SCRIPT.
DURAÇÃO DA PROVA - 1 HORA. Entrega após esse período implica em nota máxima igual a 7 (sete).

NO FINAL DO ARQUIVO, COLOQUE SUA AVALIAÇÃO CONFORME UMA DAS OPÇOES ABAIXO:

A - FUNCIONOU
ou
B - COMPILOU MAS NAO FUNCIONOU
ou
C - NEM COMPILOU

#drop database ESCOLA_P1;
*/

#Create...
create database ESCOLA_P1;
use ESCOLA_P1;

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
    NomeDisc VARCHAR(40),
    CreditoDisc INT,

    primary key (CodDepto, NumDisc), 
    
    constraint FK_Disciplina_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict
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
    
    constraint FK_Sala_Predio foreign key (CodPred) references Predio(CodPred) ON DELETE restrict

);

create table Professor (
	CodProf INT primary key,
    CodDepto CHAR(5),
    CodTit INT,
    NomeProf VARCHAR(40),
    
    constraint FK_Professor_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict,
    constraint FK_Professor_Titulacao foreign key (CodTit) references Titulacao(CodTit) ON DELETE restrict
    
);

create table ProfTurma (
	AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CodProf INT,
    primary key (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf),
    
    constraint FK_ProfTurma_Professor FOREIGN KEY (CodProf) references Professor(CodProf) ON DELETE restrict

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
	alter table Turma add constraint FK_Turma_Disciplina FOREIGN KEY (CodDepto, NumDisc) 
	references Disciplina(CodDepto, NumDisc);
    
    alter table Horario add constraint FK_Horario_Turma foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) 
	references Turma(AnoSem, CodDepto, NumDisc, SiglaTur);

	alter table ProfTurma add constraint foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) references 
	Turma(AnoSem, CodDepto, NumDisc, SiglaTur) ON DELETE restrict;

	alter table Horario add constraint FK_Horario_Sala foreign key (NumSala, CodPred) references Sala(CodPred, NumSala) on delete restrict;

#Insert...
insert into Depto (CodDepto, NomeDepto) values 
    ('TI001', 'Informatica'),
    ('TI002', 'Logica'),
    ('TI003', 'Matematica')
;

insert into Disciplina (CodDepto, NumDisc, NomeDisc, CreditoDisc) values 
    ('TI001', 0001, 'Excel', 0004),
    ('TI001', 0002, 'Seguranca', 0002),
	('TI002', 0003, 'Engenharia', 0004),
	('TI002', 0004, 'Java', 0004),
    ('TI003', 0005, 'Calculo', 0004),
    ('TI003', 0006, 'Estatistica', 0004),
    ('TI003', 0007, 'Programacao', 0004)
;

#Exercicio - cursor implicito
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

# A - FUNCIONOU