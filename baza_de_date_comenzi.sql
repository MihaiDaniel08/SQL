CREATE TABLE Clienti (
    IDclient INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Prenume VARCHAR(50),
    Nume VARCHAR(50),
    Email VARCHAR(100),
    NumarTelefon VARCHAR(20)
);

CREATE TABLE Produse (
    IDprodus INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NumeProdus VARCHAR(100),
    Categorie VARCHAR(50),
    Pret DECIMAL(10,2),
    Marime VARCHAR(10)
);

CREATE TABLE Comenzi (
    IDcomanda INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDclient INT,
    DataComenzii DATE,
    CONSTRAINT fk_client FOREIGN KEY (IDclient) REFERENCES Clienti(IDclient)
);

CREATE TABLE ProduseleComenzii (
    IDpc INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IDcomanda INT,
    IDprodus INT,
    Cantitate INT,
    CONSTRAINT fk_comanda FOREIGN KEY (IDcomanda) REFERENCES Comenzi(IDcomanda),
    CONSTRAINT fk_produs FOREIGN KEY (IDprodus) REFERENCES Produse(IDprodus)
);



  -- Inserare în tabela Clienti
INSERT INTO Clienti ( Prenume, Nume, Email, NumarTelefon)
SELECT  'Ion', 'Popescu', 'ion.popescu@example.com', '123-456-7890' FROM DUAL UNION ALL
SELECT  'Elena', 'Ionescu', 'elena.ionescu@example.com', '987-654-3210' FROM DUAL UNION ALL
SELECT  'Ana', 'Mihai', 'ana.mihai@example.com', '555-123-4567' FROM DUAL UNION ALL
SELECT  'Mircea', 'Dumitrescu', 'mircea.dumitrescu@example.com', NULL FROM DUAL UNION ALL
SELECT  'Andreea', 'Radu', 'andreea.radu@example.com', '111-222-3333' FROM DUAL UNION ALL
SELECT  'Mihai', 'Georgescu', 'mihai.georgescu@example.com', '444-555-6666' FROM DUAL UNION ALL
SELECT  'Maria', 'Pârvu', 'maria.parvu@example.com', '777-888-9999' FROM DUAL UNION ALL
SELECT  'Cristian', 'Nistor', 'cristian.nistor@example.com', '999-000-1111' FROM DUAL UNION ALL
SELECT  'Diana', 'Voicu', 'diana.voicu@example.com', '222-333-4444' FROM DUAL UNION ALL
SELECT  'Gabriel', 'Dinu', 'gabriel.dinu@example.com', '666-777-8888' FROM DUAL;

-- Inserare în tabela Produse
INSERT INTO Produse ( NumeProdus, Categorie, Pret, Marime)
SELECT  'Tricou negru', 'Tricouri', 45.99, 'M' FROM DUAL UNION ALL
SELECT  'Geaca bomber', 'Geci', 499.99, 'L' FROM DUAL UNION ALL
SELECT  'Lenjerie intima barbati', 'Lenjerii si sosete', 29.99, 'S' FROM DUAL UNION ALL
SELECT  'Sosete albe cu dungi negre', 'Lenjerii si sosete', 19.99, '36-40' FROM DUAL UNION ALL
SELECT  'Tricou alb cu guler in V', 'Tricouri', 99.99, 'S' FROM DUAL UNION ALL
SELECT  'Tricou roz oversize', 'Tricouri', 79.99, 'M' FROM DUAL UNION ALL
SELECT  'Sosete negre', 'Lenjerii si sosete', 9.99, '40-43' FROM DUAL UNION ALL
SELECT  'Bluza oversize', 'Bluze', 129.99, 'XL' FROM DUAL UNION ALL
SELECT  'Pijamale cu imprimeu de Craciun', 'Lenjerii si sosete', 89.99, 'L' FROM DUAL UNION ALL
SELECT  'Geaca pentru sky', 'Geci', 699.99, 'S' FROM DUAL;

-- Inserare în tabela Comenzi
INSERT INTO Comenzi ( IDclient, DataComenzii)
SELECT  1, TO_DATE('2022-01-15', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  2, TO_DATE('2022-02-20', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  3, TO_DATE('2022-03-01', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  4, TO_DATE('2022-04-10', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  5, TO_DATE('2022-05-15', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  6, TO_DATE('2022-06-20', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  7, TO_DATE('2022-07-01', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  8, TO_DATE('2022-08-15', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  9, TO_DATE('2022-09-25', 'YYYY-MM-DD') FROM DUAL UNION ALL
SELECT  10, TO_DATE('2022-10-10', 'YYYY-MM-DD') FROM DUAL;


-- Inserare în tabela ProduseleComenzii
INSERT INTO ProduseleComenzii (IDcomanda, IDprodus, Cantitate)
SELECT 1 AS IDcomanda, 1 AS IDprodus, 2 AS Cantitate FROM DUAL UNION ALL
SELECT 1 AS IDcomanda, 2 AS IDprodus, 1 AS Cantitate FROM DUAL UNION ALL
SELECT 2 AS IDcomanda, 3 AS IDprodus, 3 AS Cantitate FROM DUAL UNION ALL
SELECT 3 AS IDcomanda, 4 AS IDprodus, 1 AS Cantitate FROM DUAL UNION ALL
SELECT 4 AS IDcomanda, 5 AS IDprodus, 2 AS Cantitate FROM DUAL UNION ALL
SELECT 5 AS IDcomanda, 6 AS IDprodus, 1 AS Cantitate FROM DUAL UNION ALL
SELECT 6 AS IDcomanda, 7 AS IDprodus, 3 AS Cantitate FROM DUAL UNION ALL
SELECT 7 AS IDcomanda, 8 AS IDprodus, 2 AS Cantitate FROM DUAL UNION ALL
SELECT 8 AS IDcomanda, 9 AS IDprodus, 1 AS Cantitate FROM DUAL UNION ALL
SELECT 9 AS IDcomanda, 10 AS IDprodus, 2 AS Cantitate FROM DUAL;


--actualizare inregistrari

delete from Comenzi where IDcomanda = 10;

INSERT INTO Comenzi (IDclient,DataComenzii) VALUES (10,TO_DATE('11/11/2011','dd/mm/yyyy'));

UPDATE Clienti
SET Email = 'emailDINupdate@exemplu.ro'
WHERE IDclient = 1;

--actualizare restrictii

ALTER TABLE ProduseleComenzii
DROP CONSTRAINT fk_comanda;

ALTER TABLE ProduseleComenzii
ADD CONSTRAINT fk_comanda
FOREIGN KEY (IDcomanda)
REFERENCES Comenzi (IDcomanda);

ALTER TABLE Produse
ADD CONSTRAINT ck_pret check (Pret>0);

--modificarea structurii tabelului

ALTER TABLE Produse
MODIFY Categorie varchar2(100);

--stergerea si recuperarea unei tabele

drop table ProduseleComenzii;

ROLLBACK;


--INTEROGARI

--1 SELECT simplu
SELECT * FROM Clienti;

--2 Distinct
SELECT DISTINCT Nume FROM Clienti;

--3 Union
SELECT Prenume AS Name, Email
FROM Clienti
UNION SELECT NumeProdus AS Name, NULL AS Email
FROM Produse;

--4 Intersect
SELECT Prenume FROM Clienti INTERSECT SELECT Nume FROM Clienti;

--5 Minus
SELECT Prenume FROM Clienti MINUS SELECT Nume FROM Clienti;

--6 Decode
SELECT NumeProdus, Pret,
DECODE(SIGN(Pret - 99), 1, 'Scump', 'Mi-l permit') AS Categorie_de_pret
FROM Produse;

--7 Cereri imbricate
SELECT * FROM Produse WHERE IDprodus IN (SELECT IDprodus FROM ProduseleComenzii);

--8 Case
SELECT Pret, CASE
         WHEN Pret < 99.99 THEN 'Mi-l permit'
         WHEN Pret >= 99.99 THEN 'Scump'
         ELSE 'Necunoscut'
END AS Tip
FROM Produse;

--9 Single-row
SELECT Nume, LENGTH(Nume) AS LungimeNume
FROM Clienti;

--10 Functii de grup
SELECT Categorie, AVG(Pret) AS PretMediu
FROM Produse
GROUP BY Categorie;

--11 NVL
SELECT Nume, NVL(NumarTelefon, 'N/A') AS Numar_telefon
FROM Clienti;

--12 Jonctiune simpla
SELECT *
FROM Comenzi
JOIN Clienti ON Comenzi.IDclient = Clienti.IDclient;

--13 Joinctiune stanga
SELECT *
FROM Comenzi
LEFT JOIN Clienti ON Comenzi.IDclient = Clienti.IDclient;

--14 Fetch
SELECT *
FROM Comenzi
WHERE IDclient = 4
ORDER BY DataComenzii DESC
FETCH FIRST 1 ROW ONLY;

--15 group by
SELECT IDcomanda, MAX(Cantitate) AS CantitateMaxima
FROM ProduseleComenzii
GROUP BY IDcomanda;

--16 order by
SELECT *
FROM Produse
ORDER BY Pret DESC, NumeProdus ASC;

--17 Pret maxim
SELECT NumeProdus, (SELECT MAX(Pret) FROM Produse) AS PretMaxim
FROM Produse;

--18 Regex like
SELECT *
FROM Produse
WHERE REGEXP_LIKE(NumeProdus, '^Tricou.*');

--19
SELECT C.*, O.*
FROM Clienti C
JOIN Comenzi O ON C.IDclient = O.IDclient
WHERE O.IDcomanda = 2;

--20 Where
SELECT *
FROM Produse
WHERE IDprodus = 3;

--View

CREATE OR REPLACE VIEW Clienti_v
AS SELECT * FROM Clienti
WHERE IDclient=7;

SELECT * FROM Clienti_v;

DROP VIEW Clienti_v;

--Indecsi

CREATE INDEX Produse_idx ON Produse(NumeProdus);
SELECT * FROM USER_INDEXES;
DROP INDEX Produse_idx;

--Secvente

CREATE SEQUENCE cmd_seq 
START WITH 1 INCREMENT BY 5
MAXVALUE 100 NOCYCLE;

ALTER SEQUENCE cmd_seq INCREMENT BY 2;
ALTER SEQUENCE cmd_seq MAXVALUE 50;

DROP SEQUENCE cmd_seq;

--Sinonime

CREATE SYNONYM p FOR Produse;
SELECT * FROM USER_SYNONYMS;
DROP SYNONYM p;