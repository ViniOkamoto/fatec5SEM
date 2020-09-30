
# 1. Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre 2002/1
SELECT DISTINCT CodDepto FROM TURMA WHERE anosem=20021;

# 2. Obter os códigos dos professores que são do departamento de código 'INF01' e que ministraram ao menos uma turma em 2002/1.
SELECT DISTINCT CodProf FROM profturma WHERE CodDepto = 'INF01' AND AnoSem = 20021;

# 3. Obter os horários de aula (dia da semana,hora inicial e número de horas ministradas) do professor "Antunes" em 20021.
SELECT DISTINCT Horario.DiaSem, Horario.HoraInicio, Horario.NumHoras FROM Professor, ProfTurma, Horario WHERE Professor.NomeProf='Antunes' 
	AND Horario.AnoSem=20021 
    AND Professor.CodProf  = ProfTurma.CodProf 
    AND ProfTurma.AnoSem = Horario.AnoSem 
    AND ProfTurma.CodDepto = Horario.CodDepto 
    AND ProfTurma.NumDisc  = Horario.NumDisc 
    AND ProfTurma.SiglaTur  = Horario.SiglaTur;
                                            
# 4. Obter os nomes dos departamentos que têm turmas que, em 2002/1, têm aulas na sala 101 do prédio denominado 'Informática - aulas'
SELECT Depto.NomeDepto FROM Depto INNER JOIN Turma INNER JOIN sala INNER JOIN predio where AnoSem = 20021 AND NumSala = 101 AND NomePred = 'Informática - aulas';

# 5. Obter os códigos dos professores com título denominado 'Doutor' que não ministraram aulas em 2002/1.
SELECT CodProf FROM professor p, titulacao t WHERE p.CodTit=t.CodTit AND NomeTit='Doutor' AND p.CodTit NOT IN (SELECT CodProf FROM ProfTurma WHERE AnoSem=20021);

# 6. Obter os identificadores das salas (código do prédio e número da sala) que, em 2002/1:
# o nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do departamento 'Informática', e
# o nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma
# ministrada pelo professor denominado 'Antunes'.
SELECT CodPred, NumSala FROM Sala inner join Horario, Depto WHERE Horario.CodDepto = Depto.CodDepto
   AND NomeDepto = 'Informática'
   AND DiaSem = 2 
   AND AnoSem=20021 in (SELECT CodPred, NumSala FROM sala inner join Horario, ProfTurma, Professor 
		WHERE  Professor.CodProf=ProfTurma.CodProf 
		AND ProfTurma.AnoSem=Horario.AnoSem AND ProfTurma.CodDepto=Horario.CodDepto 
		AND ProfTurma.NumDisc=Horario.NumDisc AND ProfTurma.SiglaTur=Horario.SiglaTur 
		AND NomeProf='Antunes'  AND DiaSem=4 AND  Horario.AnoSem=20021);