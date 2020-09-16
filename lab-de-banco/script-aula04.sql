/* 1 - CRIAÇÃO DA BASE DE DADOS E INSERÇÃO DE DADOS */
CREATE DATABASE VendaAutoPecas;
USE VendaAutoPecas;

CREATE TABLE Peca (
    CodPeca CHAR(2) PRIMARY KEY NOT NULL,
    NomePeca VARCHAR(10) NOT NULL,
    CorPeca VARCHAR(10) NOT NULL,
    PesoPeca INT NOT NULL,
    CidadePeca VARCHAR(10) NOT NULL
);

ALTER TABLE Embarq DROP CONSTRAINT FK_Embarq_Peca;
ALTER TABLE Embarq MODIFY COLUMN CodPeca CHAR(6);
ALTER TABLE Peca MODIFY COLUMN CodPeca CHAR(6);
ALTER TABLE Embarq ADD CONSTRAINT FK_Embarq_Peca FOREIGN KEY (CodPeca) REFERENCES Peca(CodPeca) ON DELETE restrict;


CREATE TABLE Fornec (
    CodFornec CHAR(2) PRIMARY KEY NOT NULL,
    NomeFornec VARCHAR(10) NOT NULL,
    StatusFornec INT NOT NULL,
    CidadeFornec VARCHAR(10) NOT NULL
);

CREATE TABLE Embarq (
    CodPeca CHAR(2),
    CodFornec CHAR(2),
    QtdeEmbarq INT NOT NULL,
    CONSTRAINT FK_Embarq_Peca FOREIGN KEY (CodPeca) REFERENCES Peca(CodPeca) ON DELETE restrict,
    CONSTRAINT FK_Embarq_Fornec FOREIGN KEY (CodFornec) REFERENCES Fornec(CodFornec) ON DELETE restrict
);

INSERT INTO Peca(CodPeca, NomePeca, CorPeca, PesoPeca, CidadePeca) VALUES 
    ('P1', 'Eixo', 'Cinza', 10, 'Poa'),
    ('P2', 'Rolamento', 'Preto', 16, 'Rio'),
    ('P3', 'Mancal', 'Verde', 30, 'São Paulo');

INSERT INTO Fornec(CodFornec, NomeFornec, StatusFornec, CidadeFornec) VALUES 
    ('F1', 'Silva', 5, 'São Paulo'),
    ('F2', 'Souza', 10, 'Rio'),
    ('F3', 'Alvares', 5, 'São Paulo'),
    ('F4', 'Tavares', 8, 'Rio');

INSERT INTO Embarq(CodPeca, CodFornec, QtdeEmbarq) VALUES
    ('P1', 'F1', 300),
    ('P1', 'F2', 400),
    ('P1', 'F3', 200),
    ('P2', 'F1', 300),
    ('P2', 'F4', 350);
    
/* 2 - Exercícios */
SELECT COUNT(CodFornec) FROM Fornec;

SELECT COUNT(DISTINCT CidadeFornec) FROM Fornec;

SELECT COUNT(CodFornec) FROM Fornec WHERE CidadeFornec IS NOT NULL;

SELECT MAX(QtdeEmbarq) FROM Embarq;

SELECT CodFornec, count(QtdeEmbarc) FROM tb_embarq GROUP BY CodFornec;

SELECT NomeFornec, COUNT(QtdeEmbarq) FROM Fornec INNER JOIN Embarq ON Fornec.CodFornec = Embarq.CodFornec WHERE Embarq.QtdeEmbarq > 300 GROUP BY Fornec.CodFornec;

SELECT NomeFornec, SUM(QtdeEmbarq) FROM Fornec INNER JOIN Embarq ON Fornec.CodFornec = Embarq.CodFornec INNER JOIN Peca ON Embarq.CodPeca = Peca.CodPeca WHERE CorPeca = 'Cinza' GROUP BY Fornec.CodFornec;

SELECT NomeFornec, SUM(QtdeEmbarq) FROM Fornec INNER JOIN Embarq ON Fornec.CodFornec = Embarq.CodFornec INNER JOIN Peca ON Embarq.CodPeca = Peca.CodPeca GROUP BY Fornec.CodFornec ORDER BY SUM(QtdeEmbarq) DESC;

SELECT Fornec.CodFornec, SUM(QtdeEmbarq) FROM Fornec INNER JOIN Embarq ON Fornec.CodFornec = Embarq.CodFornec INNER JOIN Peca ON Embarq.CodPeca = Peca.CodPeca  WHERE CorPeca = 'Cinza' GROUP BY Fornec.CodFornec HAVING SUM(QtdeEmbarq) > 500;