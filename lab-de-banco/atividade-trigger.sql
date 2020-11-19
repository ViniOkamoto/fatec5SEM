drop trigger prof_doutor;
DELIMITER $$
CREATE TRIGGER prof_doutor
BEFORE INSERT ON Professor

FOR EACH ROW
BEGIN
declare depto varchar(40);
select NomeTit into depto from Titulacao where CodTit = NEW.CodTit;
	IF (depto <> 'Doutor')
    THEN
	SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'Professor nao inserido pois nao e doutor.';
	INSERT INTO tab_log_Professor (CodProf, CodDepto, CodTit, NomeProf, operacao, insercao)
    VALUES (NEW.CodProf, NEW.CodDepto,NEW.CodTit, NEW.NomeProf, 'INSERT', NOW());
    END if;
END $$
DELIMITER ;