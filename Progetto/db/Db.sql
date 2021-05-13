DROP DATABASE IF EXISTS cc;
CREATE DATABASE cc;
USE cc;

DROP TABLE IF EXISTS prodotto;

CREATE TABLE prodotto (	
  id int primary key AUTO_INCREMENT not null,
  prezzo double default 0,
  nome char(20),
  specifiche char(200),
  descrizione char(250),
  sconto int,
  numVisualizzazioni int,
  numVendite int,
  descrizioneCompleta text,
  IVA int,
  quantità int default 0
);

DROP TABLE IF EXISTS utente;

CREATE TABLE utente (	
  nome char(25),
  cognome char(25),
  pw char(50),
  indirizzo char(200),
  email varchar(35) primary key not null,
  telefono char(15),
  numCarta char(16),
  intestatario char(50),
  dataScad char(7),
  CVV char(3)
);

DROP TABLE IF EXISTS ordine;

CREATE TABLE ordine (
	id int primary key AUTO_INCREMENT,
	data_Effettuazione datetime,
    Prezzo_Totale double,
    Prezzo_Tot_IVA double,
    utente varchar(35) not null,
    
    FOREIGN KEY (utente) REFERENCES utente(email)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dettaglio; 

CREATE TABLE Dettaglio (
	prezzoUnitario double,
    quantità int,
    IVA int,
    id_Prodotto int,
    id_Ordine int,
    
    FOREIGN KEY (id_Prodotto) REFERENCES prodotto(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    
    FOREIGN KEY (id_Ordine) REFERENCES ordine(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    
    PRIMARY KEY(id_prodotto, id_Ordine)
);

INSERT INTO prodotto (nome, descrizione, prezzo, quantità) values
("Samsung F8000", "TV 48 pollici", 550, 5),
("Huawei P8", "Smartphone", 390, 13),
("Onkyo SR 646", "Receiver", 510, 4),
("Sony w808c", "TV 43 pollici", 640, 11),
("Dyson 6300", "Aspirapolvere", 329, 3),
("Asus 3200", "Router", 189, 22);

INSERT INTO utente (nome, cognome, email, pw) values 
("Luca", "Contrasto", "lucacontr@gmail.com", "luca1234"),
("Giacomo", "Cubix", "giacubix@gmail.com", "cubix2021"),
("Franco", "Vecchio", "fvecchio@gmail.com", "fravecc12"),
("Luigi", "Lodi", "llodi@gmail.com", "lodi89"),
("Vittorio", "Francia", "vittofran@gmail.com", "francia00");


