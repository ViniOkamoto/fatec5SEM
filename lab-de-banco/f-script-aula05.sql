<<<<<<< HEAD
#drop database ESCOLA_AULA05;
=======

#Dropo o banco caso exista, crio ele e as tabelas...
drop database ESCOLA_AULA05;
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
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
<<<<<<< HEAD
    primary key (CodDepto, NumDisc), 
    
    constraint FK_Disciplina_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict
=======
    primary key (CodDepto, NumDisc),
    constraint FK_Disciplina_Relation_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
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
<<<<<<< HEAD
    primary key (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio)
=======
	primary key (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio)
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
);

create table Sala (
	CodPred INT,
    NumSala INT,
    DescricaoSala VARCHAR(40),
    CapacSala INT,
<<<<<<< HEAD
    primary key (CodPred, NumSala), 
    
    constraint FK_Sala_Predio foreign key (CodPred) references Predio(CodPred) ON DELETE restrict
=======
    primary key (CodPred, NumSala),
    constraint FK_Sala_Relation_Predio foreign key (CodPred) references Predio(CodPred) ON DELETE restrict
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
);

create table Professor (
	CodProf INT primary key,
    CodDepto CHAR(5),
    CodTit INT,
    NomeProf VARCHAR(40),
<<<<<<< HEAD
    
    constraint FK_Professor_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict,
    constraint FK_Professor_Titulacao foreign key (CodTit) references Titulacao(CodTit) ON DELETE restrict
=======
    constraint FK_Professor_Relation_Depto foreign key (CodDepto) references Depto(CodDepto) ON DELETE restrict,
    constraint FK_Professor_Relation_Titulacao foreign key (CodTit) references Titulacao(CodTit) ON DELETE restrict
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
);

create table ProfTurma (
	AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CodProf INT,
    primary key (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf),
<<<<<<< HEAD
    
    constraint FK_ProfTurma_Professor FOREIGN KEY (CodProf) references Professor(CodProf) ON DELETE restrict
=======
    constraint FK_ProfTurm_Profturma_Professor FOREIGN KEY (CodProf) references Professor(CodProf) ON DELETE restrict
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
);

create table PreReq (
	CodDeptoPreReq CHAR(5),
    NumDiscPreReq INT,
    CodDepto CHAR(5),
    NumDisc INT,
    primary key (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc),
<<<<<<< HEAD
    
=======
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
    constraint FK_PreReq_Tem_Pre_Discipli foreign key (CodDeptoPreReq, NumDiscPreReq) references Disciplina(CodDepto, NumDisc) on delete restrict,
    constraint FK_PreReq_Eh_Pre_Discipli foreign key (CodDepto, NumDisc) references Disciplina(CodDepto, NumDisc) on delete restrict
);

<<<<<<< HEAD
	alter table Turma add constraint FK_Turma_Disciplina FOREIGN KEY (CodDepto, NumDisc) 
references Disciplina(CodDepto, NumDisc);
    
    alter table Horario add constraint FK_Horario_Turma foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) 
references Turma(AnoSem, CodDepto, NumDisc, SiglaTur);

	alter table ProfTurma add constraint foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) references 
Turma(AnoSem, CodDepto, NumDisc, SiglaTur) ON DELETE restrict;

	alter table Horario add constraint FK_Horario_Sala foreign key (NumSala, CodPred) references Sala(CodPred, NumSala) on delete restrict;
=======
#Altero as tabelas com as chaves estrangeiras...
alter table Turma add constraint FK_Turma_Relation_Discipl FOREIGN KEY (CodDepto, NumDisc) references Disciplina(CodDepto, NumDisc) on delete restrict;
alter table Horario add constraint FK_Horario_Relation_Turma foreign key (AnoSem, CodDepto, NumDisc, SiglaTur) references Turma(AnoSem, CodDepto, NumDisc, SiglaTur) on delete restrict;
alter table Horario add constraint FK_Horario_Relation_Sala foreign key (CodPred, NumSala) references Sala(CodPred, NumSala) on delete restrict;
alter table ProfTurma add constraint FK_Profturm_Profturma_Turma foreign key (AnoSem, CodDepto, NumDisc, Siglatur) references Turma(AnoSem, CodDepto, NumDisc, SiglaTur) on delete restrict;
>>>>>>> 1131e8da65bbada0564d76ef1865d026b9deb8c5
