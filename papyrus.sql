#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
DROP DATABASE papyrus;
CREATE DATABASE papyrus;
USE Papyrus;

#------------------------------------------------------------
# Table: Produit
#------------------------------------------------------------

CREATE TABLE Produit(
        Produit_CODART Char (4) NOT NULL ,
        Produit_LIBART Varchar (30) NOT NULL ,
        Produit_STKPHY Int NOT NULL ,
        Produit_QTEANN Int NOT NULL ,
        Produit_UNIMES Char (5) NOT NULL
	,CONSTRAINT Produit_PK PRIMARY KEY (Produit_CODART)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fournis
#------------------------------------------------------------

CREATE TABLE Fournis(
        Fournis_NUMFOU Varchar (25) NOT NULL ,
        Fournis_NOMFOU Varchar (25) NOT NULL ,
        Fournis_RUEFOU Varchar (50) NOT NULL ,
        Fournis_POSFOU Char (5) NOT NULL ,
        Fournis_VILFOU Varchar (30) NOT NULL ,
        Fournis_CONFOU Varchar (15) NOT NULL ,
        Fournis_SATISF TinyINT NOT NULL
	,CONSTRAINT Fournis_PK PRIMARY KEY (Fournis_NUMFOU)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Entcom
#------------------------------------------------------------

CREATE TABLE Entcom(
        Entcom_NUMCOM  Int NOT NULL ,
        Entcom_OBSCOM  Varchar (50) NOT NULL ,
        Entcom_DATCOM  Date NOT NULL ,
        Fournis_NUMFOU Varchar (25) NOT NULL
	,CONSTRAINT Entcom_PK PRIMARY KEY (Entcom_NUMCOM)

	,CONSTRAINT Entcom_Fournis_FK FOREIGN KEY (Fournis_NUMFOU) REFERENCES Fournis(Fournis_NUMFOU)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ligcom
#------------------------------------------------------------

CREATE TABLE Ligcom(
        Ligcom_NUMLIG  TinyINT NOT NULL ,
        Ligcom_QTECDE  Int NOT NULL ,
        Ligcom_PRIUNI  Varchar (50) NOT NULL ,
        Ligcom_QTELIV  Int NOT NULL ,
        Ligcom_DERLIV  Datetime NOT NULL ,
        Produit_CODART Char (4) NOT NULL ,
        Entcom_NUMCOM  Int NOT NULL
	,CONSTRAINT Ligcom_PK PRIMARY KEY (Ligcom_NUMLIG)

	,CONSTRAINT Ligcom_Produit_FK FOREIGN KEY (Produit_CODART) REFERENCES Produit(Produit_CODART)
	,CONSTRAINT Ligcom_Entcom0_FK FOREIGN KEY (Entcom_NUMCOM) REFERENCES Entcom(Entcom_NUMCOM)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vente
#------------------------------------------------------------

CREATE TABLE Vente(
        Fournis_NUMFOU Varchar (25) NOT NULL ,
        Produit_CODART Char (4) NOT NULL ,
        Vente_DELLIV   Smallint NOT NULL ,
        Vente_QTE1     Int NOT NULL ,
        Vente_PRIX1    Varchar (50) NOT NULL ,
        Vente_QTE2     Int NOT NULL ,
        Vente_PRIX2    Varchar (50) NOT NULL ,
        Vente_QTE3     Int NOT NULL ,
        Vente_PRIX3    Varchar (50) NOT NULL
	,CONSTRAINT Vente_PK PRIMARY KEY (Fournis_NUMFOU,Produit_CODART)

	,CONSTRAINT Vente_Fournis_FK FOREIGN KEY (Fournis_NUMFOU) REFERENCES Fournis(Fournis_NUMFOU)
	,CONSTRAINT Vente_Produit0_FK FOREIGN KEY (Produit_CODART) REFERENCES Produit(Produit_CODART)
)ENGINE=InnoDB;

#------------------------------------------------------------
# ...
#------------------------------------------------------------


