-- Check the contents of the tables
SELECT * from Boissons;

SELECT * from Factures;


SELECT Nom FROM Boissons
WHERE Nom NOT IN (SELECT Nom
        FROM Boissons JOIN Factures
        ON Boissons.BoissonId = Factures.BoissId);


SELECT BoissId, COUNT(FactureId) * 100.0 / (SELECT COUNT(FactureId) FROM Factures) AS Pcent_sales
FROM Factures
GROUP BY BoissId;


