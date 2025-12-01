1er Requete : Afficher les 3 streameurs ayant le plus de viewers.
SELECT c.viewer, r.streameur AS "Streameur"
FROM chat c
JOIN role r
ON r.id_role = c.id_role
ORDER BY c.viewer DESC
LIMIT 3;

2eme Requete : Afficher le nombre total de points pour chaque utilisateur.
...
