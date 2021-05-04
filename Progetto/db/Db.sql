DROP DATABASE IF EXISTS cc;
CREATE DATABASE cc;
USE cc;

DROP TABLE IF EXISTS prodotto;

CREATE TABLE prodotto (	
  id int primary key AUTO_INCREMENT,
  nome char(20) not null,
  descrizione char(100),
  prezzo int default 0,
  quantità int default 0
);

INSERT INTO prodotto values (1,"Samsung F8000","TV 48 pollici",550,5);
INSERT INTO prodotto values (2,"Huawei P8","Smartphone",390,13);
INSERT INTO prodotto values (3,"Onkyo SR 646","Receiver",510,4);
INSERT INTO prodotto values (4,"Sony w808c","TV 43 pollici",640,11);
INSERT INTO prodotto values (5,"Dyson 6300","Aspirapolvere",329,3);
INSERT INTO prodotto values (6,"Asus 3200","Router",189,22);
