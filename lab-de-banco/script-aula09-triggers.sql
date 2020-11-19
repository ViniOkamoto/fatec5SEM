#Bruno Bega Harnik - 1110481823052
use ESCOLA_AULA05;

CREATE TABLE Log_Professor(
	Usuario varchar(45) not null,
	CodProf INT4,
	TipoAlteracao varchar(45),
	DataAlteracao datetime
);

DELIMITER $$
CREATE TRIGGER professor_insert_logs 
BEFORE INSERT ON Professor

FOR EACH ROW
BEGIN
	INSERT INTO Log_Professor (Usuario, CodProf, TipoAlteracao, DataAlteracao)
    VALUES (CURRENT_USER(), NEW.CodProf, 'INSERT', NOW());
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER professor_update_logs 
AFTER UPDATE ON Professor

FOR EACH ROW
BEGIN
	INSERT INTO Log_Professor (Usuario, CodProf, TipoAlteracao, DataAlteracao)
    VALUES (CURRENT_USER(), NEW.CodProf, 'UPDATE', NOW());
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER professor_delete_logs 
AFTER DELETE ON Professor

FOR EACH ROW
BEGIN
	INSERT INTO Log_Professor (Usuario, CodProf, TipoAlteracao, DataAlteracao)
    VALUES (CURRENT_USER(), OLD.CodProf, 'DELETE', NOW());
END $$
DELIMITER ;

insert into Titulacao (CodTit, NomeTit) values
	('1', 'Mestre'),
    ('2', 'Doutor');

insert into Professor (CodProf, CodDepto, CodTit, NomeProf) values 
    ('9999', 'TI001', '2', 'Felizberto Pereira'),
    ('8888', 'TI001', '1', 'Adalberto Cardoso');

UPDATE Professor SET NomeProf = 'Felizberto Silva' WHERE CodProf = '9999';
    
DELETE FROM Professor WHERE CodProf = '9999';
DELETE FROM Professor WHERE CodProf = '8888';
    
select * from log_professor;