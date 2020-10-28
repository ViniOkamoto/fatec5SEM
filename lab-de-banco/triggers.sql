/* Criar trigger para registrar um LOG das atualizações das Tabela Professor. No Log deve existir:
           1-  código do usuário que fez a alteração;
           2-  chave primaria do registro alterado;
           3-  Tipo de alteração realizado (INSERT ou UPDATE ou DELETE);
           4-  Data e Hora da alteração.
Entregar a estrutura da Tabela de LOG ( pode ser chamada Tabela_Log_Professor ) ;
e o Código da(s) Trigger(s).**/

use ESCOLA_AULA05;

CREATE TABLE tabela_log_Professor(
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
	INSERT INTO tabela_log_Professor (Usuario, CodProf, TipoAlteracao, DataAlteracao)
    VALUES (CURRENT_USER(), NEW.CodProf, 'INSERT', NOW());
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER professor_update_logs 
AFTER UPDATE ON Professor

FOR EACH ROW
BEGIN
	INSERT INTO tabela_log_Professor (Usuario, CodProf, TipoAlteracao, DataAlteracao)
    VALUES (CURRENT_USER(), NEW.CodProf, 'UPDATE', NOW());
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER professor_delete_logs 
AFTER DELETE ON Professor

FOR EACH ROW
BEGIN
	INSERT INTO tabela_log_Professor (Usuario, CodProf, TipoAlteracao, DataAlteracao)
    VALUES (CURRENT_USER(), OLD.CodProf, 'DELETE', NOW());
END $$
DELIMITER ;

insert into Titulacao (CodTit, NomeTit) values
	('1', 'Mestre'),
    	('2', 'Doutor'),
    	('3', 'Bacharel');

insert into Professor (CodProf, CodDepto, CodTit, NomeProf) values 
    ('9999', 'TI001', '2', 'Guilherme Ribeiro'),
    ('8888', 'TI001', '1', 'Adalberto Jeremias');

UPDATE Professor SET NomeProf = 'Orlando Silva' WHERE CodProf = '9999';
    
DELETE FROM Professor WHERE CodProf = '9999';
DELETE FROM Professor WHERE CodProf = '8888';
    
select * from tabela_log_Professor;
