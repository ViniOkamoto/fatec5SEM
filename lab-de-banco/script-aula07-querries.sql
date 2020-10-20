/*8- Um professor pode ministrar turmas de disciplinas pertencentes a outros
departamentos. Para cada professor que já ministrou aulas em disciplinas de
outros departamentos, obter o código do professor, seu nome, o nome de seu
departamento e o nome do departamento no qual ministrou disciplina.*/
SELECT Professor.CodProf, Professor.NomeProf, DeptoProf.NomeDepto AS DeptoProf,
DeptoDisc.NomeDepto AS DeptoDisc
FROM Professor,
ProfTurma,
Depto AS DeptoProf,
Depto as DeptoDisc
WHERE Professor.CodProf=ProfTurma.CodProf
AND Professor.CodDepto<>ProfTurma.CodDepto
AND Professor.CodDepto=DeptoProf.CodDepto
AND ProfTurma.CodDepto=DeptoDisc.CodDepto;

/*9. Obter o nome dos professores que possuem horários conflitantes (possuem
turmas que tenham a mesma hora inicial, no mesmo dia da semana e no mesmo
semestre). Além dos nomes, mostrar as chaves primárias das turmas em conflito.*/
SELECT DISTINCT Professor.NomeProf FROM Horario,
Horario AS HorarioB, ProfTurma AS ProfTurmaB, Professor
WHERE Horario.AnoSem = HorarioB.AnoSem
AND Horario.DiaSem = HorarioB.DiaSem
AND Horario.HoraInicio = HorarioB.HoraInicio
AND Horario.CodDepto = ProfTurma.CodDepto
AND Horario.NumDisc = ProfTurma.NumDisc
AND Horario.AnoSem = ProfTurma.AnoSem
AND Horario.SiglaTur = ProfTurma.SiglaTur

AND HorarioB.CodDepto = ProfTurmaB.CodDepto
AND HorarioB.NumDisc = ProfTurmaB.NumDisc
AND HorarioB.AnoSem = ProfTurmaB.AnoSem
AND HorarioB.SiglaTur = ProfTurmaB.SiglaTur

AND ProfTurma.CodDepto = ProfTurmaB.CodDepto
AND Professor.CodProf = ProfTurmaB.CodDepto ;

/*10. Para cada disciplina que possui pré-requisito, obter o nome da disciplina seguido
do nome da disciplina que é seu pré-requisito.*/
SELECT Disciplina.NomeDisc, DiscPre.NomeDisc FROM Disciplina,
PreReq, Disciplina AS DiscPre
WHERE Disciplina.CodDepto=PreReq.CodDepto
AND Disciplina.NumDisc=PreReq.NumDisc
AND PreReq.CodDeptoPreReq=DiscPre.CodDepto
AND PreReq.NumDiscPreReq=DiscPre.NumDisc;  

/*11. Obter os nomes das disciplinas que não têm pré-requisito.*/
SELECT Nomedisc FROM Disciplina
EXCEPT
SELECT Nomedisc
FROM PreReq,
Disciplina
WHERE Disciplina.CodDepto=PreReq.CodDepto
AND Disciplina.NumDisc=PreReq.NumDisc 

/*12. Obter o nome de cada disciplina que possui ao menos dois pré-requisitos.*/
SELECT DISTINCT NomeDisc
FROM Disciplina,
PreReq AS Pre1,
PreReq AS Pre2
WHERE Disciplina.CodDepto=Pre1.CodDepto
AND Disciplina.NumDisc=Pre1.NumDisc
AND Disciplina.CodDepto=Pre2.CodDepto
AND Disciplina.NumDisc=Pre2.NumDisc
AND (Pre1.CodDeptoPreReq<>Pre2.CodDeptoPreReq;
OR Pre1.NumDiscPreReq<>Pre2.NumDiscPreReq)
