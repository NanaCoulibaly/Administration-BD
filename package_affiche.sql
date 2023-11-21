
--creation de l'entete du PACKAGE Package_affiche
CREATE OR REPLACE PACKAGE package_affiche AS
/*****************************************************************************************
Description :Affiche les fournisseurs
Date de cretion:23_12-2022
Date(s) de modification:23-12-2022
Auteur(s) :NANA
************************************************************************************************/
    PROCEDURE affiche_fournisseur_PK;
/*****************************************************************************************
Description :Affiche les produits
Arguments:Aucun
Date de cretion:23_12-2022
Date(s) de modification:23-12-2022
Auteur(s) :NANA
************************************************************************************************/
    PROCEDURE affiche_produit_PK;
END package_affiche;
/
--creation du corps du PACKAGE Package_affiche
CREATE OR REPLACE PACKAGE BODY package_affiche AS
    PROCEDURE affiche_fournisseur_PK IS 
        CURSOR cur_fournisseur IS select NOFOUR,NOMFOUR,NO,RUE,VILLE,CODEPOSTAL,TELEPHONE from COULIBALY.NA_FOURNISSEURS;
        le_cur_fournisseur cur_fournisseur%ROWTYPE;
 
BEGIN
    FOR le_cur_fournisseur IN cur_fournisseur LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(le_cur_fournisseur.NOFOUR,10)||RPAD(le_cur_fournisseur.NOMFOUR,10)||RPAD(le_cur_fournisseur.NO,10)||RPAD(le_cur_fournisseur.RUE,10)
||RPAD(le_cur_fournisseur.VILLE,10)||RPAD(le_cur_fournisseur.CODEPOSTAL,10)||le_cur_fournisseur.TELEPHONE);
    END LOOP;
END affiche_fournisseur_PK;
 
    PROCEDURE affiche_produit_PK IS 
        CURSOR cur_produit IS select CODE,NOM,QUANTITESTOCK,PRIX,NOFOUR from COULIBALY.NA_PRODUITS;
        le_cur_produit cur_produit%ROWTYPE;
 
BEGIN
    FOR le_cur_produit IN cur_produit LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(le_cur_produit.CODE,10)||RPAD(le_cur_produit.NOM,10)||RPAD(le_cur_produit.QUANTITESTOCK,6)||RPAD(le_cur_produit.PRIX,6)||le_cur_produit.NOFOUR);
    END LOOP;
  END affiche_produit_PK;
 
END package_affiche;
/
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\Sous_Menu_2.sql



