DROP DATABASE IF EXISTS cc;
CREATE DATABASE cc;
USE cc;

DROP TABLE IF EXISTS prodotto;

CREATE TABLE prodotto (	
  id int primary key AUTO_INCREMENT not null,
  prezzo double default 0,
  nome varchar(50),
  descrizione varchar(250),
  sconto double default 0,
  prezzo_scontato double default 0,
  NVisualizzazioni int default 0,
  NVendite int default 0,
  IVA double default 22,
  quantità int default 0,
  thumbnail varchar(700)
  
  
);

CREATE TABLE immagine(
	prodotto int,
    immagine varchar(700),
    
     FOREIGN KEY (prodotto) REFERENCES prodotto(id)
     ON DELETE CASCADE
     ON UPDATE CASCADE,
     
     PRIMARY KEY(prodotto, immagine)
);

CREATE TABLE utente (	
  nome varchar(25),
  cognome varchar(25),
  pw char(50),
  indirizzo varchar(200),
  email varchar(35) primary key,
  telefono varchar(15),
  numCarta varchar(16),
  dataScad varchar(7),
  CVV varchar(3)
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
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
    
    FOREIGN KEY (id_Ordine) REFERENCES ordine(id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
    
    PRIMARY KEY(id_prodotto, id_Ordine)
);

CREATE TABLE amministratore(
	username varchar(35) primary key,
    password varchar(35) not null
);

CREATE TABLE categoria(
	nome varchar(35) primary key,
	thumbnail varchar(700)
);

CREATE TABLE Appartenenza(
	categoria varchar(35),
	prodotto int,
	
	PRIMARY KEY(prodotto, categoria),
	
	FOREIGN KEY (prodotto) REFERENCES prodotto(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	
    FOREIGN KEY (categoria) REFERENCES categoria(nome)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

INSERT INTO prodotto (nome, descrizione, prezzo, quantità, thumbnail, sconto) values
("Samsung F8000", "TV 48 Pollici", 550.90, 5, "https://images.samsung.com/is/image/samsung/it_UE75F8000SZXZT_001_Front_black?$LazyLoad_Home_IMG$", 23); /*CATEGORIA TV*/

INSERT INTO prodotto (nome, descrizione, prezzo, quantità, thumbnail) values
("Samsung S21", "Smartphone", 890, 13, "https://asset.mediaw.it/wcsstore/MMCatalogAssetStore/asset/images/14/72/147294.jpg"), /*CATEGORIA SMARTPHONE*/
("XiaoMI Mi11 Ultra", "Smartphone", 800, 4, "https://www.notebookcheck.it/uploads/tx_nbc2/XiaomiMi11Ultra.jpg"), /*CATEGORIA SMARTPHONE*/
("Sony TV LED", "TV 48 pollici", 640, 11, "https://images.eprice.it/nobrand/0/hres/803/209463803/DAM209463803-0-5317d555-3376-4b16-b4f6-14b6943f5896.jpg"), /*CATEGORIA TV*/
("Apple MacBook Pro 16'", "PC - Laptop", 1329, 3, "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/HA244?wid=2234&hei=1983&fmt=jpeg&qlt=95&.v=1596141797000"), /*CATEGORIA INFORMATICA*/
("Apple iPhone XR", "Smartphone", 890, 22, "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-xr-select-2019-family?wid=882&hei=1058&fmt=jpeg&qlt=80&.v=1550795424612"), /*CATEGORIA SMARTPHONE*/
("Acer Monitor Gaming", "Monitor Gaming 49' LED Curvo UltraWide 4ms", "1089.99", "3", "https://images.eprice.it/nobrand/0/Lightbox/188/208070188/DAM208070188-0-e4f02390-ae36-4978-9ba6-aa355c0a4ba7.jpg"), /*CATEGORIA INFORMATICA*/
("LOGITECH G903", "Mouse da Gaming ad alte prestazioni, 11 tasti, Sensore HERO 16K", "145", "6", "https://images.eprice.it/nobrand/0/Lightbox/621/208440621/DAM208440621-8-fd02b056-9234-4211-91bf-b666a68bbca0.jpg"), /*CATEGORIA INFORMATICA*/
("Philips TV LED", "TV LED ULTRA HD 4K 43 Pollici", "400", "3", "https://images.eprice.it/nobrand/0/hres/318/209955318/DAM209955318-0-3e3af515-37c5-4c5e-af0a-2f90585b6fe0.jpg"), /*CATEGORIA TV*/
("Call Of Duty: CW", "Call Of Duty: Black Ops Cold War per PS4", "50", "8", "https://asset.mediaw.it/wcsstore/MMCatalogAssetStore/asset/images/13/89/138976.jpg"),
("Controller PS5", "CONTROLLER SONY DUALSHOCK PS5", "70", "5", "https://www.luemm.it/lm/wp-content/uploads/2020/11/61X9zCbMqML._AC_SL1500__7k0KjE7Cyt7h_large.jpg"),
("Nintendo Switch", "Nintendo Switch con Joy-Con 2019 Rosso e Blu", "250", "3", "https://i.ebayimg.com/images/g/C1YAAOSwep1eNsm7/s-l640.jpg");

insert into immagine(prodotto, immagine) values
(1, "https://images.samsung.com/is/image/samsung/it_UE75F8000SZXZT_001_Front_black?$LazyLoad_Home_IMG$"), /*TV SAMSUNG*/
(2, "https://asset.mediaw.it/wcsstore/MMCatalogAssetStore/asset/images/14/72/147294.jpg"), /*SAMSUNG S21*/
(3, "https://www.notebookcheck.it/uploads/tx_nbc2/XiaomiMi11Ultra.jpg"), /*XIAOMI MI11*/
(4, "https://images.eprice.it/nobrand/0/hres/803/209463803/DAM209463803-0-5317d555-3376-4b16-b4f6-14b6943f5896.jpg"), /*TV SONY*/
(5, "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/HA244?wid=2234&hei=1983&fmt=jpeg&qlt=95&.v=1596141797000"), /*MACBOOK*/
(6, "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-xr-select-2019-family?wid=882&hei=1058&fmt=jpeg&qlt=80&.v=1550795424612"), /*IPHONE XR*/
(7, "https://images.eprice.it/nobrand/0/Lightbox/188/208070188/DAM208070188-0-e4f02390-ae36-4978-9ba6-aa355c0a4ba7.jpg"), /*MONITOR ACER*/
(8, "https://images.eprice.it/nobrand/0/Lightbox/621/208440621/DAM208440621-8-fd02b056-9234-4211-91bf-b666a68bbca0.jpg"), /*MOUSE GAMING*/
(9, "https://images.eprice.it/nobrand/0/hres/318/209955318/DAM209955318-0-3e3af515-37c5-4c5e-af0a-2f90585b6fe0.jpg"), /*TV PHILIPS*/
(10, "https://asset.mediaw.it/wcsstore/MMCatalogAssetStore/asset/images/13/89/138976.jpg"), /*CALL OF DUTY VIDEOGAME*/
(11, "https://www.luemm.it/lm/wp-content/uploads/2020/11/61X9zCbMqML._AC_SL1500__7k0KjE7Cyt7h_large.jpg"), /*PAD PS5*/
(12, "https://i.ebayimg.com/images/g/C1YAAOSwep1eNsm7/s-l640.jpg"); /*NINTENDO SWITCH*/

INSERT INTO categoria(nome, thumbnail) values 
("Informatica", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh9ITOz2fHkyGbPJ4O2FdWW1EmDmsLrckmKQ&usqp=CAU"),
("Smartphone", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmsYUPqsYAEfW_PBiKMNOJUpQ-9kuPNuqUuw&usqp=CAU"),
("TV", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIXcHlcN1z5HJTlI8gYIUjj_29NhWHVIHFMA&usqp=CAU"),
("Videogames", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxDD6RQxJ0swDLjz0aVd2XC41tWKVTfX04BQ&usqp=CAU");

INSERT INTO Appartenenza(categoria, prodotto) values
("TV", 1),
("Smartphone", 2),
("Smartphone", 3),
("TV", 4),
("Informatica", 5),
("Smartphone", 6),
("TV", 7),
("Informatica", 7),
("Videogames", 8),
("Informatica", 8),
("TV", 9),
("Videogames", 10),
("Videogames", 11),
("VIdeogames", 12);

CREATE TRIGGER prezzo_scontato_insert
BEFORE INSERT ON Prodotto
for each row
set new.prezzo_scontato=(new.prezzo-(new.prezzo*new.sconto/100));

CREATE TRIGGER prezzo_scontato_update
BEFORE update ON Prodotto
for each row
set new.prezzo_scontato=(new.prezzo-(new.prezzo*new.sconto/100));

INSERT INTO utente (nome, cognome, email, pw) values 
("Giovanni", "Contrasto", "lucacontr@gmail.com", "luca1234"),
("Giacomo", "Cubix", "giacubix@gmail.com", "cubix2021"),
("Franco", "Vecchio", "fvecchio@gmail.com", "fravecc12"),
("Luigi", "Lodi", "llodi@gmail.com", "lodi89"),
("Vittorio", "Francia", "vittofran@gmail.com", "francia00");

insert into amministratore(username, password) values ("root", "root");


