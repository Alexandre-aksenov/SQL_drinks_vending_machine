-- Check the contents of the tables
SELECT * from Boissons;

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
