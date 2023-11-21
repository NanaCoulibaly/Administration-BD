--Supression de fournisseur
SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT NOFOUR PROMPT "Entrer le numero de fournisseur: "
DECLARE
    var_NOFOUR COULIBALY.NA_PRODUITS.NOFOUR%TYPE:='&NOFOUR';
BEGIN
-- Mise a jour du telephone
    DELETE FROM COULIBALY.NA_PRODUITS WHERE NOFOUR = var_NOFOUR;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('le fournisseur a ete supprime');
    
END;
/

SET VERIFY ON
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\Sous_Menu_3.sql