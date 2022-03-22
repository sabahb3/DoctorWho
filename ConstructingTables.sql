USE DoctorWho;

CREATE TABLE tblAuthor(
    AuthorId int,
    AuthorName VARCHAR(255)
    CONSTRAINT pk_Author_Id PRIMARY KEY (AuthorId)
);

CREATE TABLE tblEnemy(
EnemyId int, 
EnemyName VARCHAR(200),
Description VARCHAR(500)
CONSTRAINT pk_Enemy_Id PRIMARY KEY (EnemyId)
);

CREATE TABLE tblEpisodeEnemy(
EpisodeEnemyId int,
EpisodeId int,
EnemyId int, 
CONSTRAINT pk_Episode_Enemy_Id PRIMARY KEY (EpisodeEnemyId),
CONSTRAINT FK_Episode_Enemy_Id FOREIGN KEY (EnemyId)
REFERENCES tblEnemy(EnemyId)
);
