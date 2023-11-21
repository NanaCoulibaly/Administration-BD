CLEAR SCREEN
PROMPT ************ SOUS-MENU_3 ******************
PROMPT 1: TRIGGER FOURNISSEURS
PROMPT 2: TRIGGER PRODUITS
PROMPT 3: DELETE
PROMPT 4: Quitter  
ACCEPT selection PROMPT " Entrer option 1-4: " 
SET TERM OFF
COLUMN script NEW_VALUE v_script 
SELECT CASE '&selection'
WHEN '1' THEN 'triggerFour.sql'
WHEN '2' THEN 'triggerProd.sql'
WHEN '3' THEN 'delete.sql'
WHEN '4' THEN 'Quitter.sql'
ELSE 'Sous_Menu_3.sql' 
END AS script 
FROM dual; 
SET TERM ON 
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\&v_script
@C:\Users\Nana\ProjetMABD\Menu.sql