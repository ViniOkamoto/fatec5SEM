DELIMITER //
CREATE PROCEDURE InserirPeca (IN inCodPeca CHAR(7), IN inNomePeca VARCHAR(10), IN inCorPeca VARCHAR(10), IN inPesoPeca INT, IN inCidadePeca VARCHAR(10))
BEGIN
	INSERT INTO Peca(CodPeca, NomePeca, CorPeca, PesoPeca, CidadePeca) VALUES (inCodPeca, inNomePeca, inCorPeca, inPesoPeca, inCidadePeca);
END //
DELIMITER ;

CALL InserirPeca('P4', 'Rebimboca', 'Rosa', 51, 'Juquitiba');


SELECT * FROM Peca;

DELIMITER //
CREATE PROCEDURE InserirPecasAleatorias (IN qtdRegistros INT)
BEGIN
	
    DECLARE indice INT;
	DECLARE codAleatorio CHAR(6);
    DECLARE nomeAleatorio VARCHAR(10);
    DECLARE corAleatoria VARCHAR(10);
    DECLARE pesoAleatorio INT;
    DECLARE cidadeAleatoria VARCHAR(10);

    SET indice = 0;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS cores(nomeCor VARCHAR(10));
    INSERT INTO cores(nomeCor) VALUES ('Amarelo'), ('Azul'), ('Beje'), ('Branco'), ('Carmim'), ('Ciano'), ('Cinza'), ('Esmeralda'), ('Fúcsia'), ('Gelo'), ('Herbal'), ('Índigo'), ('Jambo'), ('Laranja'), ('Marrom'), ('Neve'), ('Ocre'), ('Preto'), ('Rosa'), ('Roxo'), ('Salmão'), ('Sépia'), ('Terracota'), ('Turquesa'), ('Urucum'), ('Verde'), ('Vermelho'), ('Xanadu'), ('Zaffre');
    
    CREATE TEMPORARY TABLE IF NOT EXISTS cidades(nomeCidade VARCHAR(10));
    INSERT INTO cidades(nomeCidade) VALUES ('São Paulo'), ('Rio'), ('Poá'), ('Juquitiba'), ('Mogi Mirim'), ('Birigui');
    
    LoopInserir: LOOP
    
		IF indice = qtdRegistros THEN 
			LEAVE LoopInserir;
        END IF;
        
        SET codAleatorio = CONCAT('S', indice);
		SET nomeAleatorio = CONCAT(
			CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97),
            CHAR(ROUND(RAND()*25)+97)
		);
        SET corAleatoria = (SELECT nomeCor FROM cores ORDER BY RAND() LIMIT 1);
        SET pesoAleatorio = FLOOR(RAND()*(100-1+1)+1);
        SET cidadeAleatoria = (SELECT nomeCidade FROM cidades ORDER BY RAND() LIMIT 1);
        
        CALL InserirPeca(codAleatorio, nomeAleatorio, corAleatoria, pesoAleatorio, cidadeAleatoria);
        
        SET indice = indice + 1;
        
	END LOOP;
END //
DELIMITER ;

ALTER TABLE Embarq DROP CONSTRAINT FK_Embarq_Peca;
ALTER TABLE Embarq MODIFY COLUMN CodPeca CHAR(7);
ALTER TABLE Peca MODIFY COLUMN CodPeca CHAR(7);
ALTER TABLE Embarq ADD CONSTRAINT FK_Embarq_Peca FOREIGN KEY (CodPeca) REFERENCES Peca(CodPeca) ON DELETE restrict;

drop procedure InserirPeca;
drop procedure InserirPecasAleatorias;

CALL InserirPecasAleatorias(5000);

select * from peca;


