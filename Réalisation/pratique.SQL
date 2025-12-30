-- Création de la base de données
CREATE DATABASE gestion_commandes;
USE gestion_commandes;

-- Table client
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telephone VARCHAR(20)
);

-- Table produit
CREATE TABLE produit (
    id_produit INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(150) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- Table commande
CREATE TABLE commande (
    id_commande INT AUTO_INCREMENT PRIMARY KEY,
    date_commande DATE,
    statut VARCHAR(50),
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES client(id_client)
);

-- Table ligne_commande
CREATE TABLE ligne_commande (
    id_ligne INT AUTO_INCREMENT PRIMARY KEY,
    quantite INT NOT NULL,
    id_commande INT,
    id_produit INT,
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande),
    FOREIGN KEY (id_produit) REFERENCES produit(id_produit)
);