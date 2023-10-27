CREATE DATABASE TP34;
USE TP34;

CREATE TABLE `entreprise` (
    `idEntreprise` INT NOT NULL AUTO_INCREMENT,
    `Sujet` VARCHAR(50) NOT NULL,
    `Nom` VARCHAR(50) NOT NULL,
    `Localisation` VARCHAR(50) NOT NULL,
    `Contact` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`idEntreprise`)
);


CREATE TABLE `formation` (
    `idFormation` INT NOT NULL AUTO_INCREMENT,
    `date_de_soutenance` DATE NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `spé` VARCHAR(50) NOT NULL,
    `Promo` INT NOT NULL,
    `Condition_stage` VARCHAR(50),
    PRIMARY KEY (`idFormation`),
    UNIQUE KEY (`idFormation`),
    UNIQUE KEY (`Promo`)
);


CREATE TABLE `resp_Universitaire` (
    `id_Respo_Univ` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    `Prénom` VARCHAR(50) NOT NULL,
    `idEntreprise` INT NOT NULL,
    PRIMARY KEY (`id_Respo_Univ`),
    FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise`(`idEntreprise`)
);


CREATE TABLE `resp_industriel` (
    `id_Respo_Indus` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    `Prénom` VARCHAR(50) NOT NULL,
    `idEntreprise` INT NOT NULL,
    PRIMARY KEY (`id_Respo_Indus`),
    FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise`(`idEntreprise`)
);


CREATE TABLE `Etudiant` (
    `idEtu` INT AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    `prénom` VARCHAR(50) NOT NULL,
    `Anniversaire` DATE NOT NULL,
    `Promo` INT NOT NULL,
    `idFormation` INT NOT NULL,
    `id_RI` INT,
    `id_RU` INT,
    `idEntreprise` INT,
    PRIMARY KEY (`idEtu`),
    FOREIGN KEY (`idFormation`) REFERENCES `formation`(`idFormation`),
    FOREIGN KEY (`Promo`) REFERENCES `formation`(`Promo`),
    FOREIGN KEY (`id_RI`) REFERENCES `resp_industriel`(`id_Respo_Indus`),
    FOREIGN KEY (`id_RU`) REFERENCES `resp_Universitaire`(`id_Respo_Univ`),
    FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise`(`idEntreprise`)
);

CREATE TABLE `stage` (
    `idStage` INT AUTO_INCREMENT,
    `sujet` VARCHAR(50) NOT NULL,
    `lieu` VARCHAR(50) NOT NULL,
    `durée` INT NOT NULL,
    `Montant indemnité` INT,
    `idEtu` INT NOT NULL,
    `idEntreprise` INT,
    PRIMARY KEY (`idStage`),
    FOREIGN KEY (`idEtu`) REFERENCES `Etudiant`(`idEtu`),
    FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise`(`idEntreprise`)
);


#Questions
#a.
SELECT * FROM Etudiant,Entreprise
INNER JOIN Etudiant.idEntreprise = Entreprise.idEntreprise
WHERE Entreprise.nom = 'ATOS Worldline' AND Promo = 2021;