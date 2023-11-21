CREATE OR REPLACE TRIGGER triggerdelete
AFTER DELETE ON COULIBALY.NA_FOURNISSEURS
FOR EACH ROW
BEGIN
 --DBMS_OUTPUT.PUT_LINE('Modification en cascade de : ' ||:OLD.nofour);
 --DELETE NA_PRODUITS set nofour='' where nofour=:OLD.nofour;
 INSERT INTO Produit SELECT * FROM COULIBALY.NA_PRODUITS WHERE NOFOUR=:OLD.NOFOUR;
 DELETE FROM COULIBALY.NA_PRODUITS WHERE NOFOUR=:OLD.NOFOUR;
END;
/
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\Sous_Menu_3.sql



