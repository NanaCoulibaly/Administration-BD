--Creation de procedure pour afficher les fournisseurs
CREATE OR  REPLACE PROCEDURE affiche_fournisseur IS 
CURSOR cur_fournisseur IS SELECT NOFOUR,NOMFOUR,NO,RUE,VILLE,CODEPOSTAL,TELEPHONE from COULIBALY.NA_FOURNISSEURS;
le_cur_fournisseur cur_fournisseur%ROWTYPE;
BEGIN
FOR le_cur_fournisseur IN cur_fournisseur LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(le_cur_fournisseur.NOFOUR,10)||RPAD(le_cur_fournisseur.NOMFOUR,10)||RPAD(le_cur_fournisseur.NO,10)||RPAD(le_cur_fournisseur.RUE,10)
||RPAD(le_cur_fournisseur.VILLE,10)||RPAD(le_cur_fournisseur.CODEPOSTAL,10)||le_cur_fournisseur.TELEPHONE);
END LOOP;
END;
/
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\Sous_Menu_2.sql