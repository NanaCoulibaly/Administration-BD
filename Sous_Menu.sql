CLEAR SCREEN
PROMPT ************ SOUS-MENU ******************
PROMPT 1: INSERTION DE FOURNISSEURS
PROMPT 2: INSERTION DE PRODUITS
PROMPT 3: Quitter  
ACCEPT selection PROMPT " Entrer option 1-3: " 
SET TERM OFF
COLUMN script NEW_VALUE v_script 
SELECT CASE '&selection'
WHEN '1' THEN 'Insert_Fournisseurs.sql'
WHEN '2' THEN 'Insert_Produits.sql'
WHEN '3' THEN 'Quitter.sql'
ELSE 'Sous_Menu.sql' 
END AS script 
FROM dual; 
SET TERM ON 
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\&v_script
@C:\Users\Nana\ProjetMABD\Menu.sql