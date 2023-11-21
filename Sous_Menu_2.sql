CLEAR SCREEN
PROMPT ************ SOUS-MENU_2 ******************
PROMPT 1: PROCEDURE DE FOURNISSEURS
PROMPT 2: LISTE DES FOURNISSEURS
PROMPT 3: PROCEDURE DE PRODUITS
PROMPT 4: LISTE DES PRODUITS
PROMPT 5: APPEL PACKAGE
PROMPT 6: Quitter  
ACCEPT selection PROMPT " Entrer option 1-6: " 
SET TERM OFF
COLUMN script NEW_VALUE v_script 
SELECT CASE '&selection'
WHEN '1' THEN 'proc_fournisseurs.sql'
WHEN '2' THEN 'listefour.sql'
WHEN '3' THEN 'proc_produit.sql'
WHEN '4' THEN 'listeproduits.sql'
WHEN '5' THEN 'package_affiche.sql'
WHEN '6' THEN 'appelPackageAffiche.sql'
WHEN '7' THEN 'Quitter.sql'
ELSE 'Sous_Menu_2.sql' 
END AS script 
FROM dual; 
SET TERM ON 
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\&v_script
@C:\Users\Nana\ProjetMABD\Menu.sql