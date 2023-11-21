SET SERVEROUTPUT ON 
--Creation de procedure pour afficher lesproduits
CREATE OR REPLACE PROCEDURE affiche_Rabais IS
CURSOR cur_produit IS SELECT CODE,NOM,QUANTITESTOCK,PRIX,NOFOUR from COULIBALY.NA_PRODUITS;
le_cur_produit cur_produit%ROWTYPE;
DECLARE
	--1. Declaration
	CURSOR Cur_produit IS 
	SELECT CODE, NOM, PRIX,NOFOUR,QUANTITESTOCK FROM COULIBALY.NA_PRODUITS
	FOR UPDATE OF PRIX;
BEGIN
FOR le_cur_produit IN cur_produit LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(le_cur_produit.CODE,10)||RPAD(le_cur_produit.NOM,10)||RPAD(le_cur_produit.PRIX,10)||RPAD(le_cur_produit.NOFOUR,10)
||le_cur_produit.QUANTITESTOCK);
END LOOP;
--2. Ouverture du curseur
IF NOT Cur_produit%ISOPEN THEN
	OPEN Cur_produit;
END IF;
--3. Traitement du curseur
	FETCH Cur_produit INTO Le_curseur_produit;
WHILE Cur_produit%FOUND LOOP
	UPDATE produits
	SET PRIX = 
		CASE QUANTITESTOCK*PRIX
		WHEN'QUANTITESTOCK*PRIX<=100'THEN 
		 Le_curseur_produit.PRIX * 0.05
		WHEN'QUANTITESTOCK*PRIX>100 & QUANTITESTOCK*PRIX<=50'THEN 
		 Le_curseur_produit.PRIX * 0.075
		WHEN'QUANTITESTOCK*PRIX>500'THEN 
		Le_curseur_produit.PRIX *0.1
		ELSE
		Le_curseur_produit.PRIX *1.1
		END
	
	WHERE CURRENT OF Cur_produit;
	FETCH Cur_produit INTO Le_curseur_produit;
	END LOOP;
	COMMIT;
--4. Fermeture du curseur
	CLOSE Cur_produit;
END;
/
	