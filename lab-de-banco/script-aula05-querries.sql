/*1 - Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre 2002/1 */
select distinct CodDepto FROM Turma WHERE AnoSem=20021;


    
/*2 - Obter os códigos dos professores que são do departamento de código 'INF01' e
que ministraram ao menos uma turma em 2002/1. */
select distinct CodProf from ProfTurma 
where CodDepto = 'INF01' and AnoSem = 20021;

/*3 - Obter os horários de aula (dia da semana,hora inicial e número de horas
ministradas) do professor "Antunes" em 20021. */
select distinct Horario.DiaSem, Horario.HoraInicio, Horario.NumHoras 
from  Professor, ProfTurma, Horario where   Professor.NomeProf='Antunes' 
    and Horario.AnoSem=20021 and Professor.CodProf  = ProfTurma.CodProf 
    and ProfTurma.AnoSem = Horario.AnoSem and ProfTurma.CodDepto = Horario.CodDepto 
    and ProfTurma.NumDisc  = Horario.NumDisc and ProfTurma.SiglaTur  = Horario.SiglaTur;
    
/*4. Obter os nomes dos departamentos que têm turmas que, em 2002/1, têm aulas na
sala 101 do prédio denominado 'Informática - aulas'.*/
SELECT Depto.NomeDepto from Depto 
inner join Turma, Sala, Predio 
where AnoSem = 20021 and NumSala = 101 and NomePred = 'Informática - aulas';

/*5. Obter os códigos dos professores com título denominado 'Doutor' que não
ministraram aulas em 2002/1. */
select CodProf FROM Professor, Titulacao 
	where Professor.CodTit = Titulacao.CodTit 
	and NomeTit='Doutor'
	and p.CodTit not in (select CodProf from ProfTurma where AnoSem=20021);

/* 6. Obter os identificadores das salas (código do prédio e número da sala) que, em
2002/1:
	- nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do
departamento 'Informática', e
	- nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma
ministrada pelo professor denominado 'Antunes'.*/

select CodPred, NumSala from Horario, Depto where  Horario.CodDepto = Depto.CodDepto 
   and NomeDepto='Informática' and DiaSem=2 
   and AnoSem=20021 in (select CodPred, NumSala from Horario, ProfTurma, Professor 
		where   Professor.CodProf=ProfTurma.CodProf 
		and ProfTurma.AnoSem=Horario.AnoSem and ProfTurma.CodDepto=Horario.CodDepto 
		and ProfTurma.NumDisc=Horario.NumDisc and ProfTurma.SiglaTur=Horario.SiglaTur 
		and NomeProf='Antunes'  and DiaSem=4 and  Horario.AnoSem=20021); 