SET SERVEROUTPUT ON
DECLARE
	err_table EXCEPTION;
	PRAGMA EXCEPTION_INIT(err_table,-955);
BEGIN
--Creation de tables  Fournisseurs
--Utilisation de SQL Dynamique EXECUTE IMMEDIATE
	BEGIN
		EXECUTE IMMEDIATE'CREATE TABLE Fournisseur(NOFOUR varchar(10),NOMFOUR varchar(10),NO VARCHAR(10),RUE VARCHAR(15),VILLE VARCHAR(100),CODEPOSTAL VARCHAR(50),TELEPHONE VARCHAR(20))';
--Message de creation de la table
			DBMS_output.put_Line('La table Fournisseur est creee!');
				EXCEPTION
					WHEN err_table THEN
						DBMS_output.put_Line('La table Fournisseur existe deja!');
	END;
	--Creation de tables Produits
--Utilisation de SQL Dynamique EXECUTE IMMEDIATE
DECLARE
	err_table Produits EXCEPTION;
		PRAGMA EXCEPTION_INIT(err_table_Produits,-955);
			BEGIN
				EXECUTE IMMEDIATE'CREATE TABLE Produits(CODE VARCHAR(10) primary key,NOM VARCHAR(50),
				QUANTITESTOCK VARCHAR(50),PRIX NUMBER(20),NOFOUR VARCHAR(10),
				CONSTRAINT fk_NOFOUR FOREIGN KEY(NOFOUR)REFERENCES Fournisseur(NOFOUR) ON DELETE CASCADE)';
--Message de creation de la table
				DBMS_output.put_Line('La table produits est creee!');
					EXCEPTION
						WHEN err_table THEN
							DBMS_output.put_Line('La table produits existe deja!');
			END;
END;	
/