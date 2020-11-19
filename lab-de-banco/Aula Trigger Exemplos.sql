-- Exemplo MYSQL

DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER nome_do_trigger 
BEFORE INSERT ON nome_da_tabela
 FOR EACH ROW BEGIN
  INSERT INTO nome_da_tabela_2 SET nome = NEW.nome;
 END$$
DELIMITER ;


CREATE TABLE Produtos
(
    Referencia  VARCHAR(3) PRIMARY KEY,
    Descricao   VARCHAR(50) UNIQUE,
    Estoque INT NOT NULL DEFAULT 0
);
 
INSERT INTO Produtos VALUES ('001', 'Feijão', 10);
INSERT INTO Produtos VALUES ('002', 'Arroz', 5);
INSERT INTO Produtos VALUES ('003', 'Farinha', 15);
 
CREATE TABLE ItensVenda
(   
    Venda       INT,
    Produto VARCHAR(3),
    Quantidade  INT
);


DELIMITER $$
CREATE TRIGGER Tgr_ItensVenda_Insert 
AFTER INSERT
ON ItensVenda
FOR EACH ROW
BEGIN
    UPDATE Produtos SET Estoque = Estoque - NEW.Quantidade
			WHERE Referencia = NEW.Produto;
END$$
 
DELIMITER $$
CREATE TRIGGER Tgr_ItensVenda_Delete AFTER DELETE
ON ItensVenda
FOR EACH ROW
BEGIN
    UPDATE Produtos SET Estoque = Estoque + OLD.Quantidade
			WHERE Referencia = OLD.Produto;
END$$
 
DELIMITER ;

--  Inserindo dados na tabela
INSERT INTO ItensVenda VALUES (1, '001',3);
INSERT INTO ItensVenda VALUES (1, '002',1);
INSERT INTO ItensVenda VALUES (1, '003',5);

-- Excluindo dados da tabela ItensVenda1
DELETE FROM ItensVenda WHERE Venda = 1 AND Produto = '001';




--INFORMACOES ADICIONAIS PARA RESOLVER O EXERCICIO DE TRIGGER...

--Pegando usuario corrente no Mysql
SELECT CURRENT_USER();

--Pegando dados da sessao do usuario no ORACLE
         SELECT SYS_CONTEXT('USERENV', 'SERVER_HOST')   "Nome SERVIDOR",
                        SYS_CONTEXT('USERENV', 'INSTANCE_NAME') "Instância",
                        SYS_CONTEXT('USERENV', 'HOST')          "CLIENTE",
                        SYS_CONTEXT('USERENV', 'IP_ADDRESS')    "IP Cliente",
                        SYS_CONTEXT('USERENV', 'OS_USER')       "Usuário SO",
                        SYS_CONTEXT('USERENV', 'SESSION_USER')  "Usuário BD"
          FROM    DUAL;


-- OU SOMENTE
SELECT USER FROM DUAL;

