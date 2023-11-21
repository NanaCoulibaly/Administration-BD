--insertion de produits*******************
--Section SQLPLUS
SET VERIFY OFF 
PROMPT*************Insertion de produits*******************
ACCEPT CODE CHAR PROMPT "Entrer le CODE du produit :"
ACCEPT NOM CHAR PROMPT "Entrer le NOMdu produit :"
ACCEPT QUANTITESTOCK NUMBER  PROMPT "Entrer le QUANTITESTOCK du produit :"
ACCEPT PRIX NUMBER PROMPT "Entrer le PRIX du produit :"
ACCEPT NOFOUR NUMBER PROMPT "Entrer le NOFOUR du fournisseur:"
DECLARE 
err_integre EXCEPTION;
PRAGMA EXCEPTION_INIT(err_integre,-2291);
--Variable PL/SQL initialiser a la variable SQL/PLUS
--Affectation en PL/SQL(:=
	var_CODE COULIBALY.NA_PRODUITS.CODE%TYPE :='&CODE';
	var_NOM COULIBALY.NA_PRODUITS.NOM%TYPE :='&NOM';
	var_QUANTITESTOCK COULIBALY.NA_PRODUITS.QUANTITESTOCK%TYPE :='&QUANTITESTOCK';
	var_PRIX COULIBALY.NA_PRODUITS.PRIX%TYPE :='&PRIX';
	var_NOFOUR COULIBALY.NA_PRODUITS.NOFOUR%TYPE :='&NOFOUR';
--Section SQL
BEGIN
	INSERT INTO COULIBALY.NA_PRODUITS(CODE,NOM,QUANTITESTOCK,PRIX,NOFOUR)VALUES(var_CODE,var_NOM,var_QUANTITESTOCK,var_PRIX,var_NOFOUR);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('Insertion de nouveau produits reussi');
	--Afficher le nouveau produit ajoute
	DBMS_OUTPUT.PUT_LINE(RPAD('CODE',10)||RPAD('NOM',10)||RPAD('QUANTITESTOCK',10)||RPAD('PRIX',10)||'NOFOUR');
	DBMS_OUTPUT.PUT_LINE(RPAD('=====',10)||RPAD('=====',10)||RPAD('=====',10)||RPAD('=====',10)||RPAD('=====',10)||'======');
	FOR maliste IN(SELECT * FROM COULIBALY.NA_PRODUITS where NOFOUR=var_NOFOUR)LOOP
	DBMS_OUTPUT.PUT_LINE(RPAD(maliste.CODE,10)||RPAD(maliste.NOM,10)||RPAD(maliste.QUANTITESTOCK,10)||RPAD(maliste.PRIX,10)||maliste.NOFOUR);
	END LOOP;
EXCEPTION
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE('Le produit existe deja!');
		WHEN err_integre THEN
		DBMS_OUTPUT.PUT_LINE('Le NOFOUR n''existe pas!');
END;
/
--Section SQLPLUS
SET VERIFY ON
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\Sous_Menu.sql