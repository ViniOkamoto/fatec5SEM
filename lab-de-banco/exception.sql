#Exercicio - cursor tratamento de excecoes
DELIMITER $$
CREATE PROCEDURE encontraDoutor (in semestre int)
BEGIN
    DECLARE pCodProf varchar(40);
    DECLARE fim INT default 0;
    DECLARE c1 cursor for SELECT CodProf  FROM Professor p, Titulacao t 
        WHERE p.CodTit=t.CodTit AND NomeTit='Doutor' 
         AND p.CodTit NOT IN (SELECT CodProf FROM ProfTurma WHERE AnoSem=semestre );
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
    BEGIN
        SET fim = 1;
    END;
    OPEN c1;
    fetch c1 INTO pCodProf;
    IF (fim like 1) THEN
        SELECT 'No professor found' Mensagem;
    ELSE
        select pCodProf;
        WHILE fim != 1 DO
            fetch c1 INTO pCodProf;
            select pCodProf;
        END WHILE;
    END IF;
END$$
DELIMITER ;

CALL encontraDoutor(20191);