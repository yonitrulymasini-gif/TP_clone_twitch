1er Requete : Afficher les 3 streameurs ayant le plus de viewers.
SELECT c.viewer, r.streameur AS "Streameur"
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
...