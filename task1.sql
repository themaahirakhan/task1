DROP DATABASE IF EXISTS video_games;
CREATE DATABASE video_games;
USE video_games;


DROP TABLE IF EXISTS video_games.genre;

CREATE TABLE video_games.genre (
  id INT NOT NULL AUTO_INCREMENT,
  genre_name VARCHAR(50) DEFAULT NULL,
  CONSTRAINT pk_genre PRIMARY KEY (id)
);


INSERT INTO video_games.genre (id, genre_name) VALUES
(1,'Action'),
(2,'Adventure'),
(3,'Fighting'),
(4,'Misc'),
(5,'Platform'),
(6,'Puzzle'),
(7,'Racing'),
(8,'Role-Playing'),
(9,'Shooter'),
(10,'Simulation'),
(11,'Sports'),
(12,'Strategy');

DROP TABLE IF EXISTS video_games.publisher;

CREATE TABLE video_games.publisher (
  id  INT NOT NULL AUTO_INCREMENT,
  publisher_name VARCHAR(100) DEFAULT NULL,
  CONSTRAINT pk_publisher PRIMARY KEY (id)
);



INSERT INTO video_games.publisher (id, publisher_name) VALUES
(1,'10TACLE Studios'),
(2,'1C Company'),
(3,'20th Century Fox Video Games'),
(4,'2D Boy'),
(5,'3DO'),
(6,'49Games'),
(7,'505 Games'),
(8,'5pb'),
(9,'7G//AMES'),
(10,'989 Sports'),
(11,'989 Studios'),
(12,'Abylight');

DROP TABLE IF EXISTS video_games.region;

CREATE TABLE video_games.region (
  id INT NOT NULL AUTO_INCREMENT,
  region_name VARCHAR(50) DEFAULT NULL,
  CONSTRAINT pk_region PRIMARY KEY (id)
);

INSERT INTO video_games.region (id, region_name) VALUES
(1,'North America'),
(2,'Europe'),
(3,'Japan'),
(4,'Other');


DROP TABLE IF EXISTS video_games.platform;

CREATE TABLE video_games.platform (
  id INT NOT NULL AUTO_INCREMENT,
  platform_name VARCHAR(50) DEFAULT NULL,
  CONSTRAINT pk_platform PRIMARY KEY (id)
);


INSERT INTO video_games.platform (id, platform_name) VALUES
(1,'Wii'),
(2,'NES'),
(3,'GB'),
(4,'DS'),
(5,'X360'),
(6,'PS3'),
(7,'PS2'),
(8,'SNES'),
(9,'GBA'),
(10,'3DS'),
(11,'PS4'),
(12,'N64');

DROP TABLE IF EXISTS video_games.game;

CREATE TABLE video_games.game (
  id INT NOT NULL AUTO_INCREMENT,
  genre_id INT DEFAULT NULL,
  game_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_game PRIMARY KEY (id),
  CONSTRAINT fk_gm_gen FOREIGN KEY (genre_id) REFERENCES video_games.genre (id)
);




INSERT INTO video_games.game VALUES (1,11,'\'98 Koshien'),
(2,8,'.hack//G.U. Vol.1//Rebirth'),
(3,8,'.hack//G.U. Vol.2//Reminisce'),
(4,8,'.hack//G.U. Vol.2//Reminisce (jp sales)'),
(5,8,'.hack//G.U. Vol.3//Redemption'),
(6,8,'.hack//Infection Part 1'),
(7,8,'.hack//Link'),
(8,8,'.hack//Mutation Part 2'),
(9,8,'.hack//Outbreak Part 3'),
(10,8,'.hack//Quarantine Part 4: The Final Chapter'),
(11,1,'.hack: Sekai no Mukou ni + Versus'),
(12,7,'007 Racing'),
(13,1,'007: Quantum of Solace'),
(14,1,'007: The World is not Enough'),
(15,9,'007: Tomorrow Never Dies'),
(16,4,'1 vs. 100'),
(17,2,'1/2 Summer +'),
(18,11,'10 Minute Solution');

DROP TABLE IF EXISTS video_games.game_publisher;

CREATE TABLE video_games.game_publisher (
  id INT NOT NULL AUTO_INCREMENT,
  game_id INT DEFAULT NULL,
  publisher_id INT DEFAULT NULL,
  CONSTRAINT pk_gamepub PRIMARY KEY (id),
  CONSTRAINT fk_gpu_gam FOREIGN KEY (game_id) REFERENCES video_games.game (id),
  CONSTRAINT fk_gpu_pub FOREIGN KEY (publisher_id) REFERENCES video_games.publisher (id)
);


DROP TABLE IF EXISTS video_games.game_platform;

CREATE TABLE video_games.game_platform (
  id INT NOT NULL AUTO_INCREMENT,
  game_publisher_id INT DEFAULT NULL,
  platform_id INT DEFAULT NULL,
  release_year INT DEFAULT NULL,
  CONSTRAINT pk_gameplat PRIMARY KEY (id),
  CONSTRAINT fk_gpl_gp FOREIGN KEY (game_publisher_id) REFERENCES video_games.game_publisher (id),
  CONSTRAINT fk_gpl_pla FOREIGN KEY (platform_id) REFERENCES video_games.platform (id)
);


INSERT INTO video_games.game_publisher (id, game_id, publisher_id) VALUES
(1,10,9),
(2,9,6),
(3,4,3),
(4,8,2),
(5,2,1),
(6,3,8),
(7,3,7),
(8,4,10),
(9,1,2),
(10,5,3),
(11,7,9),
(12,8,7);

INSERT INTO video_games.game_platform (id, game_publisher_id, platform_id, release_year) VALUES
(1,4,4,2007),
(2,2,4,2007),
(3,3,7,2006),
(4,5,1,2011),
(5,4,5,2011),
(6,3,5,2009),
(7,7,6,1981),
(8,8,9,1981),
(9,8,6,1982),
(10,5,6,1982),
(11,5,4,1981),
(12,2,3,2008);

DROP TABLE IF EXISTS video_games.region_sales;

CREATE TABLE video_games.region_sales (
  region_id INT DEFAULT NULL,
  game_platform_id INT DEFAULT NULL,
  num_sales decimal(5,2) DEFAULT NULL,
  CONSTRAINT fk_rs_gp FOREIGN KEY (game_platform_id) REFERENCES video_games.game_platform (id),
  CONSTRAINT fk_rs_reg FOREIGN KEY (region_id) REFERENCES video_games.region (id)
);


INSERT INTO video_games.region_sales (region_id, game_platform_id, num_sales) VALUES
(1,5,3.50),
(2,2,1.43),
(2,2,0.51),
(4,3,0.27),
(3,4,0.48),
(1,5,0.34),
(3,6,0.36),
(2,7,0.36),
(4,8,0.17),
(3,9,0.04),
(2,6,0.21),
(1,1,0.11);
