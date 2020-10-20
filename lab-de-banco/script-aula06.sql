DELIMITER $$
CREATE PROCEDURE CURSOR_EXPLICITO()
BEGIN

declare fim INT default 0;
declare antDiaSem INT;
declare antHoraInicio INT;
declare antNumHoras INT;

declare cursor CURSOR for
	select DiaSem, HoraInicio, NumHoras from Professor, ProfTurma, Horario
	where Professor.CodProf=ProfTurma.CodProf
	and ProfTurma.AnoSem=Horario.AnoSem
	and ProfTurma.CodDepto=Horario.CodDepto
	and ProfTurma.NumDisc=Horario.NumDisc
	and ProfTurma.SiglaTur=Horario.SiglaTur
	and NumSala=101
	and ProfTurma.AnoSem=20021
	and NomeProf='Antunes'
	and CodPred=43423;
	
declare CONTINUE HANDLER for not FOUND set finalizado = 1;

OPEN cursor;
FETCH cursor into antDiaSem, antHoraInicio, antNumHoras;
IF finalizado then
	select 'Nenhum registro encontrado';
else
	select antDiaSem, antHoraInicio, antNumHoras;
	WHILE finalizado != 1 DO
		FETCH cursor into antDiaSem, antHoraInicio, antNumHoras;
        select antDiaSem, antHoraInicio, antNumHoras;
	end WHILE;
end IF;

CLOSE cursor;
end$$
DELIMITER ;
CALL EX_CURSOR_EXPLICITO();
