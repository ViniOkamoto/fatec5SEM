#Descomente se precisar apagar e testar novamente.
DROP PROCEDURE EX_CURSOR_EXPLICITO;
DELIMITER $$
CREATE PROCEDURE EX_CURSOR_EXPLICITO()
BEGIN
#Variável booleana para demarcar o fim da leitura
DECLARE finalizado INT default 0;
DECLARE antDiaSem INT;
DECLARE antHoraInicio INT;
DECLARE antNumHoras INT;

#Cursor para o select subsequente
DECLARE c CURSOR FOR
	SELECT DiaSem, HoraInicio, NumHoras
	FROM Professor, ProfTurma, Horario
	WHERE Professor.CodProf=ProfTurma.CodProf
	AND ProfTurma.AnoSem=Horario.AnoSem
	AND ProfTurma.CodDepto=Horario.CodDepto
	AND ProfTurma.NumDisc=Horario.NumDisc
	AND ProfTurma.SiglaTur=Horario.SiglaTur
	AND NumSala=101
	AND ProfTurma.AnoSem=20021
	AND NomeProf='Antunes'
	AND CodPred=43423;
	
#Há uma variável de sistema que fica lendo os registros e
#quando termina deixa o finalizado = 1.
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finalizado = 1;

#Abre o cursor
OPEN c;
FETCH c INTO antDiaSem, antHoraInicio, antNumHoras;
IF finalizado THEN
	SELECT 'Nenhum registro encontrado';
ELSE
	SELECT antDiaSem, antHoraInicio, antNumHoras;
	WHILE finalizado != 1 DO
		FETCH c INTO antDiaSem, antHoraInicio, antNumHoras;
        SELECT antDiaSem, antHoraInicio, antNumHoras;
	END WHILE;
END IF;

CLOSE c;
END$$
DELIMITER ;

CALL EX_CURSOR_EXPLICITO();
