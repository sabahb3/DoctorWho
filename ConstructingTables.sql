USE DoctorWho;

CREATE TABLE tblAuthor(
    AuthorId INT,
    AuthorName VARCHAR(255)
    CONSTRAINT pk_Author_Id PRIMARY KEY (AuthorId)
);

CREATE TABLE tblEnemy(
EnemyId INT, 
EnemyName VARCHAR(200),
Description VARCHAR(500)
CONSTRAINT pk_Enemy_Id PRIMARY KEY (EnemyId)
);

CREATE TABLE tblEpisodeEnemy(
EpisodeEnemyId INT,
EpisodeId INT,
EnemyId INT, 
CONSTRAINT pk_Episode_Enemy_Id PRIMARY KEY (EpisodeEnemyId),
CONSTRAINT FK_Episode_Enemy_Id FOREIGN KEY (EnemyId)
REFERENCES tblEnemy(EnemyId)
);

CREATE TABLE tblCompanion(
CompanionId INT, 
CompanionName VARCHAR(255),
WhoPlayed VARCHAR(255)
CONSTRAINT pk_Companion_Id PRIMARY KEY (CompanionId)
);

CREATE TABLE tblEpisodeCompanion(
EpisodeCompanionId INT,
EpisodeId INT,
CompanionId INT, 
CONSTRAINT pk_Episode_Companion_Id PRIMARY KEY (EpisodeCompanionId),
CONSTRAINT FK_CompanionId_Id FOREIGN KEY (CompanionId)
REFERENCES tblCompanion(CompanionId)
);

CREATE TABLE tblDoctor(
DoctorId INT, 
DoctorNumber VARCHAR(20),
DoctorName VARCHAR(255),
BirthDate DATE,
FirstEpisodeDate DATETIME,
LastEpisodeDate DATETIME,
CONSTRAINT pk_Doctor_Id PRIMARY KEY (DoctorId)
);
