CREATE DATABASE locovelo;

USE locovelo;

CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(100) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    date_inscription DATE NOT NULL
);

CREATE TABLE velo (
    id_velo INT AUTO_INCREMENT PRIMARY KEY,
    marque VARCHAR(100) NOT NULL,
    type ENUM('ville', 'route', 'éléctrique', 'VTT', 'VTC', 'pliable') NOT NULL,
    taille VARCHAR(10) NOT NULL,
    tarif_horaire DECIMAL(5,2) NOT NULL CHECK (tarif_horaire >= 0),
    etat ENUM('bon', 'usé', 'endommagé') NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE location (
    id_location INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,
    id_velo INT NOT NULL,
    date_heure_debut DATETIME NOT NULL,
    date_heure_fin DATETIME,
    montant_total DECIMAL(10,2) CHECK (montant_total >= 0),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_velo) REFERENCES velo(id_velo)
);

