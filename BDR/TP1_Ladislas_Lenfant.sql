--3
SHOW DATABASES;
CREATE DATABASE TP1;
USE TP1;

--4
CREATE TABLE `Personne` ( 
    `id` INT AUTO_INCREMENT, 
    `nom` VARCHAR(50) NOT NULL, 
    `prenom` VARCHAR(50) NOT NULL, 
    `profession` VARCHAR(50), 
    `date_naissance` DATE, 
    PRIMARY KEY (`id`) 
);

--5
SHOW TABLES;
DESCRIBE Personne;

--6
INSERT INTO Personne (prenom, nom, profession, date_naissance) 
VALUES 
('Gérard', 'Manvusa', 'Ophtamologiste', '1975-08-30'), 
('Louis', 'Fine', 'Orl', '1994-03-12');

--7
CREATE TABLE `Reception` (
    `date`DATE,
    `lieu` VARCHAR(50),
    PRIMARY KEY(`date`,`lieu`)
);

--8
INSERT INTO Reception 
VALUES 
('2020-12-14','Valenciennes'), 
('2020-12-24','Champs-Elysées, Paris');

--9
CREATE TABLE `Est_Invite` ( 
    `id` INT, 
    `date` DATE, 
    `lieu` VARCHAR(50), 
    PRIMARY KEY(`id`,`date`,`lieu`), 
    FOREIGN KEY(`id`) REFERENCES Personne(`id`), 
    FOREIGN KEY(`date`,`lieu`) REFERENCES Reception(`date`,`lieu`) 
);

--10
/*
INSERT INTO Est_Invite 
VALUES 
(3, '2020-12-24','Champs-Elysées, Paris');
-- l'index 3 n'existe pas dans la table Personne
*/ 
INSERT INTO Personne (prenom, nom, profession, date_naissance) 
VALUES 
('Claire', 'Obscur', 'Psychologue', '1982-12-24');

--11

INSERT INTO Personne (prenom, nom, profession, date_naissance) 
VALUES 
('Maxime', 'Lenfant', 'Boulanger', '2004-01-03');

INSERT INTO Personne (prenom, nom, profession, date_naissance) 
VALUES 
('Félix', 'Ladislas', 'Enquêteur', '2004-04-14');

INSERT INTO Personne (prenom, nom, profession, date_naissance) 
VALUES 
('Maurice', 'Ramenot', 'Psychologue', '1975-08-16');

INSERT INTO Est_Invite 
VALUES 
(1, '2020-12-24','Champs-Elysées, Paris');

--12
/*
DROP TABLE;
-- Une autre table dépend de celle-ci donc elle ne peut être supprimée
*/

--13
--a)
SELECT * FROM Personne;
--b)
SELECT nom, prenom FROM Personne WHERE date_naissance < '1993-09-28';
--c)
SELECT nom, prenom
FROM Personne
INNER JOIN Est_Invite
ON Personne.id = Est_Invite.id;

--14
CREATE TABLE `Plat` ( 
    `nom` VARCHAR(50), 
    `nature` VARCHAR(50), 
    PRIMARY KEY(`nom`)
);

INSERT INTO Plat (nom, nature)
VALUES
('salade_cesar', 'entrée');

INSERT INTO Plat (nom, nature)
VALUES
('pizza', 'plat');

INSERT INTO Plat (nom, nature)
VALUES
('bavette', 'plat');

INSERT INTO Plat (nom, nature)
VALUES
('forêt_noire', 'dessert');

INSERT INTO Plat (nom, nature)
VALUES
('crêpe', 'dessert');

--15
CREATE TABLE `Apprecie` ( 
    `id` INT, 
    `plat` VARCHAR(50), 
    PRIMARY KEY(`id`,`plat`), 
    FOREIGN KEY(`id`) REFERENCES Personne(`id`), 
    FOREIGN KEY(`plat`) REFERENCES Plat(`nom`) 
);

CREATE TABLE `Deteste` ( 
    `id` INT, 
    `plat` VARCHAR(50), 
    PRIMARY KEY(`id`,`plat`), 
    FOREIGN KEY(`id`) REFERENCES Personne(`id`), 
    FOREIGN KEY(`plat`) REFERENCES Plat(`nom`) 
);

INSERT INTO Apprecie (id, plat)
VALUES
(0, 'pizza');

INSERT INTO Deteste (id, plat)
VALUES
(0, 'salade_cesar');

INSERT INTO Apprecie (id, plat)
VALUES
(1, 'forêt_noire');

INSERT INTO Deteste (id, plat)
VALUES
(1, 'bavette');

INSERT INTO Apprecie (id, plat)
VALUES
(2, 'bavette');

INSERT INTO Deteste (id, plat)
VALUES
(2, 'pizza');

INSERT INTO Apprecie (id, plat)
VALUES
(3, 'salade_cesar');

INSERT INTO Deteste (id, plat)
VALUES
(3, 'pizza');

INSERT INTO Apprecie (id, plat)
VALUES
(4, 'pizza');

INSERT INTO Deteste (id, plat)
VALUES
(4, 'bavette');

INSERT INTO Apprecie (id, plat)
VALUES
(5, 'salade_cesar');

INSERT INTO Deteste (id, plat)
VALUES
(5, 'forêt_noire');


--16
--a)
SELECT * FROM Plat;
--b)
SELECT nom
FROM (((Plat
INNER JOIN Apprecie ON Apprecie.plat = Plat.nom)
INNER JOIN Personne ON Personne.id = Apprecie.id)
INNER JOIN Personne WHERE profession = 'Psychologue');