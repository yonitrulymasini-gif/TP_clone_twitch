1er Requete : Afficher les 3 streameurs ayant le plus de viewers.
SELECT c.viewer, nom_role AS "Streameur"
FROM chat c
JOIN role r
ON r.id_role = c.id_role
ORDER BY c.viewer DESC
LIMIT 3;

2eme Requete : Afficher les utilisateurs majeurs (18 ans et plus).
SELECT * FROM user WHERE date_naissance <= DATE_SUB(CURDATE(), INTERVAL 18 YEAR)

3eme Requete : Afficher le nombre de messages postés par chaque utilisateur.
SELECT u.pseudo, COUNT(c.id_chat) AS "Nombre de messages"
FROM user u
JOIN chat c
ON u.id_user = c.id_user
GROUP BY u.pseudo;

4eme Requete : Points par utilisateur + classement
SELECT CONCAT(u.nom, ' ', u.prenom) AS "User", p.nbre_points "Nombre de Points"
FROM user u
JOIN points p
ON p.id_user = u.id_user
ORDER BY p.nbre_points DESC ;

5eme Requte : Vue “profil streamer” : user + chaîne + catégories + monétisation : On rassemble plusieurs tables pour avoir un tableau de bord par user.
SELECT CONCAT(u.nom, ' ', u.prenom) AS "Users", r.nom_role AS "Rôle de streameur", c.profil AS "Profil", c.logo AS "logo", c.biographie AS"Biographie", c.follower AS "Nombre de followers", ca.jeux AS "Jeux", ca.discussion AS "Discussion", ca.programmation AS "Programation", m.publicite AS "Publicité", m.abonnement AS "Abonnement", m.don AS "Don"
FROM user u
JOIN role r
ON r.id_user = u.id_user
JOIN chaine c
ON c.id_user = u.id_user
JOIN categorie ca
ON ca.id_user = u.id_user
JOIN monnetisation m
ON m.id_user = u.id_user
WHERE r.nom_role = 'Streameur';

6eme Requete : “Score streamer” : points + nombre de messages + lignes de monétisation : On combine plusieurs tables pour un “score d’activité”.
SELECT CONCAT(u.nom, ' ', u.prenom) AS "Users", r.nom_role AS "Rôle de streameur", p.nbre_points AS "Nombre de points", m.id_monnetisation AS "Monnétisation ID"
FROM user u
JOIN role r
ON r.id_user = u.id_user
JOIN points p
ON p.id_user = u.id_user
JOIN monnetisation m
ON m.id_user = u.id_user
WHERE r.nom_role = 'Streameur'
ORDER BY CONCAT(u.nom, ' ', u.prenom);