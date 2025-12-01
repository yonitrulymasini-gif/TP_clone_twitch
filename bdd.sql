/* TP CLONE TWITCH */

CREATE TABLE `user` (
						id_user INT AUTO_INCREMENT PRIMARY KEY,			
  						nom VARCHAR (50) NOT NULL,
						prenom VARCHAR (50) NOT NULL,
  						pseudo VARCHAR (50) NOT NULL,
						email VARCHAR (100) NOT NULL UNIQUE,
  						date_naissance DATE NOT NULL,
  						adresse VARCHAR (120) NOT NULL,
  						code_postal INT NOT NULL,
  						ville VARCHAR (120) NOT NULL,
						telephone INT NOT NULL
);

INSERT INTO `user` (id_user, nom, prenom, pseudo, email, date_naissance, adresse, code_postal, ville, telephone) VALUES
(1, 'DUPONT', 'Paul', 'dupaul_Warrior','paul@yahoo.fr', '2015-12-20', '12 rue de Lyon', 62000, 'Arras', 0321247809),
(2, 'DURAND', 'Jérémie', 'jerem_cesi','jeremie@yahoo.fr', '2001-11-02', '18 rue de Paris', 59000, 'Lille', 0321247812),
(3, 'MARCHAND', 'Pauline', 'pauline_championne','pauline@google.fr', '1999-10-21', '20 avenue du Paradis', 59000, 'Lille', 0321247890),
(4, 'CESI', 'Alberto', 'alberto_champion','alberto@google.fr', '1998-10-21', '8 avenue du chti', 59500, 'Douai', 0321247811),
(5, 'DUCOIN', 'Charles', 'charly','charles@google.fr', '1999-07-12', '20 avenue informatique', 59200, 'Touroing', 0321260800
);

--
CREATE TABLE `role` (
						id_role INT AUTO_INCREMENT PRIMARY KEY,			
  						streameur VARCHAR (150),
						moderateur VARCHAR (150),
  						simple_user VARCHAR (150),
  						id_user INT NOT NULL,
  						 CONSTRAINT fk_role_user
                                 FOREIGN KEY (id_user)
                                     REFERENCES `user`(id_user)
                                     ON DELETE RESTRICT
);

INSERT INTO `role` (id_role, streameur, moderateur, simple_user, id_user) VALUES
(1, '', 'Modérateur', '', 1),
(2, 'Streameur', ' ', '',2),
(3, ' ', ' ', 'Simple User', 1),
(4, ' ', ' ', 'Simple user',4),
(5, ' ', ' ', 'Simple user',5);

CREATE TABLE `chat` (
						id_chat INT AUTO_INCREMENT PRIMARY KEY,			
  						conversation_publique VARCHAR (150),
						id_user INT NOT NULL,
  						id_role INT NOT NULL,
  						viewer INT NOT NULL,
  						 CONSTRAINT fk_role_chat
                                 FOREIGN KEY (id_role)
                                     REFERENCES `role`(id_role)
                                     ON DELETE RESTRICT,
                                     
                         CONSTRAINT fk_user_chat
                                     FOREIGN KEY (id_user)
                                     REFERENCES `user`(id_user)
                                     ON DELETE RESTRICT);
                         

INSERT INTO `chat` (id_chat, conversation_publique, id_user, id_role,viewer) VALUES
(1, 'Bonjour Maître Yoni', 2, 1,300),
(2, 'Bonjour Maître KASPAROV', 3, 1,10),
(3, 'Bienvenue dans le chat du CESI', 2, 1,3),
(4, 'Bonjour Julien', 3, 4,100),
(5, 'Bonjour Monsieur le Président', 3, 1,650)
;
 
CREATE TABLE `points` (
						id_points INT AUTO_INCREMENT PRIMARY KEY,			
  						nbre_points FLOAT (5, 2),
						id_user INT NOT NULL,
  						 CONSTRAINT fk_points_user
                                     FOREIGN KEY (id_user)
                                     REFERENCES `user`(id_user)
                                     ON DELETE RESTRICT);

INSERT INTO `points` (id_points, nbre_points, id_user) VALUES
(1, 200, 1),
(2, 300, 2),
(3, 500, 3),
(4, 340, 4),
(5, 350, 5);

CREATE TABLE `monnetisation` (
						id_monnetisation INT AUTO_INCREMENT PRIMARY KEY,			
  						publicite VARCHAR (150),
  						abonnement VARCHAR (150),
  						don VARCHAR (150),
						id_user INT NOT NULL,
  						id_role INT NOT NULL,
  						 CONSTRAINT fk_monnetisation_user
                                     FOREIGN KEY (id_user)
                                     REFERENCES `user`(id_user)
                                     ON DELETE RESTRICT,
                                     
                          CONSTRAINT fk_monnetisation_role
                                     FOREIGN KEY (id_role)
                                     REFERENCES `role`(id_role)
                                     ON DELETE RESTRICT);

INSERT INTO `monnetisation` (id_monnetisation, publicite, abonnement, don, id_user, id_role) VALUES
(1, 'Pub AUCHAN', 'sans abonnement', 'Sans don', 2, 1),
(2, 'Pub LECLERC', 'Sans abonnement ', 'Avec don', 3, 1),
(3, 'Sans pub', 'Abo PREMIMUM', 'Avec don', 2, 1),
(4, 'Pub CAREFOUR', 'Sans abonnement', 'Sans don', 1, 4),
(5, 'Pub AUCHAN', 'Sans abonnement','Avec don', 3, 1);


CREATE TABLE `categorie` (
						id_categorie INT AUTO_INCREMENT PRIMARY KEY,			
  						jeux VARCHAR (150),
  						discussion VARCHAR (150),
  						programmation VARCHAR (150),
						id_user INT NOT NULL,
  						id_role INT NOT NULL,
  						 CONSTRAINT fk_categorie_user
                                     FOREIGN KEY (id_user)
                                     REFERENCES `user`(id_user)
                                     ON DELETE RESTRICT,
                                     
                          CONSTRAINT fk_categorie_role
                                     FOREIGN KEY (id_role)
                                     REFERENCES `role`(id_role)
                                     ON DELETE RESTRICT);
                                     
INSERT INTO `categorie` (id_categorie, jeux, discussion, programmation, id_user, id_role) VALUES
(1, 'Poker', 'Libre', 'SQL COURS', 2, 1),
(2, 'Belote', 'Libre', 'GOLANG', 3, 1),
(3, 'Jeux Vidéo 1', ' ', 'PYTHON', 2, 1),
(4, 'Jeux Vidéo 2', ' ', 'C SHARP', 1, 4),
(5, 'Jeux vidéo 3', ' ','C SHARP', 3, 1);

                          
CREATE TABLE `chaine` (
						id_chaine INT AUTO_INCREMENT PRIMARY KEY,			
  						profil VARCHAR (150),
  						logo VARCHAR (150),
  						biographie VARCHAR (150),
  						follower VARCHAR (150),
						id_user INT NOT NULL,
  						id_role INT NOT NULL,
  						 CONSTRAINT fk_chaine_user
                                     FOREIGN KEY (id_user)
                                     REFERENCES `user`(id_user)
                                     ON DELETE RESTRICT,
                                     
                          CONSTRAINT fk_chaine_role
                                     FOREIGN KEY (id_role)
                                     REFERENCES `role`(id_role)
                                     ON DELETE RESTRICT);
                                     
INSERT INTO `chaine` (id_chaine, profil, logo, biographie, follower, id_user, id_role) VALUES
(1, 'Profil 1', 'logo_Chien', 'Biographie 1', ' ', 2, 1),
(2, 'Profil 2', 'logo_Chat', 'Biographie 2', ' ', 2, 1),
(3, 'Profil 3', 'logo_Lion', 'Biographie 3', ' ', 2, 1),
(4, 'Profil 4', 'logo_ballon', 'Biographie 4', ' ', 2, 1),
(5, 'Profil 5', 'logo_papillon', 'Biographie 5', ' ', 2, 1);