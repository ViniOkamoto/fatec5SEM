DROP PROCEDURE LISTA1EX2_EXPLICITO;
DELIMITER $$
CREATE PROCEDURE `LISTA1EX2_EXPLICITO` ()
BEGIN
	DECLARE vcodProf varchar(40);
    DECLARE done INT default 0;
	DECLARE c1 cursor for SELECT DISTINCT P.CODPROF
  							FROM PROFESSOR P INNER JOIN PROFESSORTURMA  PT 
										    ON (P.CODPROF=PT.CODPROF)
										    WHERE PT.ANOSEM=20121 AND P.CODDEPTO = 'INFO1';
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
    BEGIN
		SET done = 1;
    END;
    OPEN c1;
    fetch c1 INTO vcodProf;
	IF (done like 1) THEN
		SELECT 'Nenhum Professor encontrado' Mengassem;
	ELSE
		select vcodProf;
		WHILE done != 1 DO
			fetch c1 INTO vcodProf;
			select vcodProf;
		END WHILE;
    END IF;
END$$
DELIMITER ;

CALL LISTA1EX2_EXPLICITO();