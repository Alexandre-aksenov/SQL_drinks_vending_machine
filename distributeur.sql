CREATE TABLE Boissons (
    BoissonId INTEGER NOT NULL,
    Nom VARCHAR,
    Contenance INTEGER,
    PRIX FLOAT,
    PRIMARY KEY (BoissonId));

INSERT INTO Boissons (BoissonId, Nom, Contenance, PRIX)
VALUES
    (1, 'Coca', 33, 0.99),
    (2, 'Perrier', 100, 2),
    (3, 'Perrier', 33, 1),
    (4, 'Vittel', 150, 1.50),
    (5, 'Badoit', 50, 2);

SELECT * from Boissons;

CREATE TABLE Factures (
    FactureId INTEGER NOT NULL,
    BoissId INTEGER NOT NULL,
    Heure DATETIME,
    PRIMARY KEY (FactureId),
    FOREIGN KEY (BoissId) REFERENCES Boissons (BoissonId)
    );

INSERT INTO Factures
VALUES
    (1,1,7),
    (2,1,8),
    (3, 4, 12);

SELECT * from Factures;

-- Unsold drinks in the order of table "Boissons"
SELECT Nom FROM Boissons
WHERE Nom NOT IN (SELECT Nom
        FROM Boissons JOIN Factures
        ON Boissons.BoissonId = Factures.BoissId);

-- id & percentage of sold drinks
SELECT BoissId, COUNT(FactureId) * 100.0 / (SELECT COUNT(FactureId) FROM Factures) AS Pcent_sales
FROM Factures
GROUP BY BoissId;

DROP TABLE IF EXISTS Boissons;
DROP TABLE IF EXISTS Factures;
