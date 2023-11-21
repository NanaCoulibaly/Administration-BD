CLEAR SCREEN
PROMPT ************ MENU ******************
PROMPT 1: INSERTIONS
PROMPT 2: AFFICHAGE
PROMPT 3: FACTURATION
PROMPT 4: RABAIS
PROMPT 5: LES TRIGGERS
PROMPT 6: QUITTER 
ACCEPT selection PROMPT " Entrer option 1-6: " 
SET TERM OFF
COLUMN script NEW_VALUE v_script 
SELECT CASE '&selection'
WHEN '1' THEN 'Sous_Menu.sql'
WHEN '2' THEN 'Sous_Menu_2.sql'
WHEN '3' THEN ''
WHEN '4' THEN ''
WHEN '5' THEN 'Sous_Menu_3.sql'
ELSE 'Menu.sql' 
END AS script 
FROM dual; 
SET TERM ON 
PAUSE "Appuyez sur une touche pour continuer..."
@C:\Users\Nana\ProjetMABD\&v_script