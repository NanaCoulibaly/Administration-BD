--Creation de procedure pour afficher lesproduits
CREATE OR REPLACE PROCEDURE affiche_produit IS
CURSOR cur_produit IS SELECT CODE,NOM,QUANTITESTOCK,PRIX,NOFOUR from COULIBALY.NA_PRODUITS;
le_cur_produit cur_produit%ROWTYPE;
BEGIN
FOR le_cur_produit IN cur_produit LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(le_cur_produit.CODE,10)||RPAD(le_cur_produit.NOM,10)||RPAD(le_cur_produit.QUANTITESTOCK,6)||RPAD(le_cur_produit.PRIX,6)||le_cur_produit.NOFOUR);
END LOOP;
END;
/
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\Sous_Menu_2.sql