#drop database ESCOLA_AULA05;
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