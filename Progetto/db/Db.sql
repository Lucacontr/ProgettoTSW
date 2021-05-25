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
  sconto double default 0,
  prezzo_scontato double default 0,
  NVisualizzazioni int default 0,
  NVendite int default 0,
  descrizioneCompleta text,
  IVA double default 22,
  quantità int default 0
);

CREATE TABLE utente (	
  nome char(25),
  cognome char(25),
  pw char(50),
  indirizzo char(200),
  email varchar(35) primary key,
  telefono char(15),
  numCarta char(16),
  intestatario char(50),
  dataScad char(7),
  CVV char(3)
);

CREATE TABLE guest(
	id int auto_increment primary key,
	nome varchar(35) not null,
    cognome varchar(35) not null,
	email varchar(35) not null,
	telefono varchar(35) not null,
	indirizzo varchar(35) not null,
	data_ora varchar(35) not null
);

CREATE TABLE ordine (
	id int primary key AUTO_INCREMENT,
	data_Effettuazione datetime,
    Prezzo_Totale double,
    Prezzo_Tot_IVA double,
    utente varchar(35),
    guest int ,
    
	FOREIGN KEY (guest) REFERENCES guest(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    FOREIGN KEY (utente) REFERENCES utente(email)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE Dettaglio (
	prezzoUnitario double not null,
    quantità int not null,
    IVA double not null,
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

CREATE TABLE amministratore(
	username varchar(35) primary key,
    password varchar(35) not null
);

INSERT INTO prodotto (nome, descrizione, prezzo, quantità) values
("Samsung F8000", "TV 48 pollici", 550.90, 5),
("Huawei P8", "Smartphone", 390, 13),
("Onkyo SR 646", "Receiver", 510, 4),
("Sony w808c", "TV 43 pollici", 640, 11),
("Dyson 6300", "Aspirapolvere", 329, 3),
("Asus 3200", "Router", 189, 22);

CREATE TRIGGER prezzo_scontato_insert
BEFORE INSERT ON Prodotto
for each row
set new.prezzo_scontato=(new.prezzo-(new.prezzo*new.sconto/100));

CREATE TRIGGER prezzo_scontato_update
BEFORE update ON Prodotto
for each row
set new.prezzo_scontato=(new.prezzo-(new.prezzo*new.sconto/100));

INSERT INTO utente (nome, cognome, email, pw) values 
("Luca", "Contrasto", "lucacontr@gmail.com", "luca1234"),
("Giacomo", "Cubix", "giacubix@gmail.com", "cubix2021"),
("Franco", "Vecchio", "fvecchio@gmail.com", "fravecc12"),
("Luigi", "Lodi", "llodi@gmail.com", "lodi89"),
("Vittorio", "Francia", "vittofran@gmail.com", "francia00");

insert into amministratore(username, password) values ("root", "root");
