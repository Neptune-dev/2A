--3
SHOW DATABASES
CREATE DATABASE TP1
USE TP1

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
SHOW TABLES
DESCRIBE Personne

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
*/ 
INSERT INTO Personne (prenom, nom, profession, date_naissance) 
VALUES 
('Claire', 'Obscur', 'Psychologue', '1982-12-24');

--11

-- TO DO : ajouter des personnes

INSERT INTO Est_Invite 
VALUES 
(1, '2020-12-24','Champs-Elysées, Paris');

--12
/*
DROP TABLE;
*/

--13
--a)
SELECT * FROM Personne;
--b)
SELECT nom, prenom FROM Personne WHERE date_naissance > `1993-09-28`;
--c)