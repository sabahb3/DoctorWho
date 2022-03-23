USE DoctorWho;

CREATE TABLE tblAuthor
(
    AuthorId INT,
    AuthorName VARCHAR(255)
    CONSTRAINT pk_Author_Id PRIMARY KEY (AuthorId)
);

CREATE TABLE tblEnemy
(
    EnemyId INT, 
    EnemyName VARCHAR(200),
    Description VARCHAR(500)
    CONSTRAINT pk_Enemy_Id PRIMARY KEY (EnemyId)
);

CREATE TABLE tblEpisodeEnemy
(
    EpisodeEnemyId INT,
    EpisodeId INT,
    EnemyId INT, 
    CONSTRAINT pk_Episode_Enemy_Id PRIMARY KEY (EpisodeEnemyId),
    CONSTRAINT FK_Episode_Enemy_Id FOREIGN KEY (EnemyId)
    REFERENCES tblEnemy(EnemyId)
);

CREATE TABLE tblCompanion
(
    CompanionId INT, 
    CompanionName VARCHAR(255),
    WhoPlayed VARCHAR(255)
    CONSTRAINT pk_Companion_Id PRIMARY KEY (CompanionId)
);

CREATE TABLE tblEpisodeCompanion
(
    EpisodeCompanionId INT,
    EpisodeId INT,
    CompanionId INT, 
    CONSTRAINT pk_Episode_Companion_Id PRIMARY KEY (EpisodeCompanionId),
    CONSTRAINT FK_CompanionId_Id FOREIGN KEY (CompanionId)
    REFERENCES tblCompanion(CompanionId)
);

CREATE TABLE tblDoctor
(
    DoctorId INT, 
    DoctorNumber VARCHAR(20),
    DoctorName VARCHAR(255),
    BirthDate DATE,
    FirstEpisodeDate DATETIME,
    LastEpisodeDate DATETIME,
    CONSTRAINT pk_Doctor_Id PRIMARY KEY (DoctorId)
);

CREATE TABLE tblEpisode
(
    EpisodeId INT,
    SeriesNumber INT,
    EpisodeNumber INT,
    EpisodeType VARCHAR(10)
        CHECK(EpisodeType IN('Full','Bonus','Trailer'))
        DEFAULT 'Trailer',
    Title VARCHAR(100),
    EpisodeDate DATETIME,
    AuthorId INT,
    DoctorId INT,
    Notes VARCHAR(500)
    CONSTRAINT pk_Episode_Id PRIMARY KEY (EpisodeId),
);

ALTER Table tblEpisode
ADD CONSTRAINT fk_Author_Id FOREIGN KEY (AuthorId)
REFERENCES tblAuthor(AuthorId), 
CONSTRAINT fk_Doctor_Id FOREIGN KEY (DoctorId)
REFERENCES tblDoctor(DoctorId)

ALTER Table tblEpisodeEnemy
ADD CONSTRAINT fk_Episode_Id FOREIGN KEY (EpisodeId)
REFERENCES tblEpisode(EpisodeId)

ALTER Table tblEpisodeCompanion
ADD CONSTRAINT fk_Episode_Id_And_Companion FOREIGN KEY (EpisodeId)
REFERENCES tblEpisode(EpisodeId)

sp_rename 'fk_Episode_Id' , 'fk_Episode_Id_And_Enemy';


-- Make episode id auto increment
ALTER TABLE tblEpisodeEnemy
DROP CONSTRAINT fk_Episode_Id_And_Enemy;

ALTER TABLE tblEpisodeCompanion
DROP CONSTRAINT fk_Episode_Id_And_Companion;

ALTER TABLE tblEpisode
DROP CONSTRAINT pk_Episode_Id;

ALTER TABLE tblEpisode
DROP COLUMN EpisodeId;

ALTER TABLE tblEpisode
ADD EpisodeId INT NOT NULL IDENTITY(1,1);

ALTER Table tblEpisode
ADD CONSTRAINT pk_Episode_Id PRIMARY KEY (EpisodeId)

ALTER Table tblEpisodeEnemy
ADD CONSTRAINT fk_Episode_Id FOREIGN KEY (EpisodeId)
REFERENCES tblEpisode(EpisodeId)

ALTER Table tblEpisodeCompanion
ADD CONSTRAINT fk_Episode_Id_And_Companion FOREIGN KEY (EpisodeId)
REFERENCES tblEpisode(EpisodeId)

--  make id of EpisodeEnemy auto increment

ALTER TABLE tblEpisodeEnemy
DROP CONSTRAINT pk_Episode_Enemy_Id;

ALTER TABLE tblEpisodeEnemy
DROP COLUMN EpisodeEnemyId;

ALTER TABLE tblEpisodeEnemy
ADD EpisodeEnemyId INT NOT NULL IDENTITY(1,1)
CONSTRAINT pk_Episode_Enemy_Id PRIMARY KEY (EpisodeEnemyId);

--  make id of EpisodeCompanion auto increment

ALTER TABLE tblEpisodeCompanion
DROP CONSTRAINT pk_Episode_Companion_Id;

ALTER TABLE tblEpisodeCompanion
DROP COLUMN EpisodeCompanionId;

ALTER TABLE tblEpisodeCompanion
ADD EpisodeCompanionId INT NOT NULL IDENTITY(1,1)
CONSTRAINT pk_Episode_Companion_Id PRIMARY KEY (EpisodeCompanionId);

-- make id of Enemy auto increment.
ALTER TABLE tblEpisodeEnemy 
DROP CONSTRAINT FK_Episode_Enemy_Id

ALTER TABLE tblEnemy
DROP CONSTRAINT pk_Enemy_Id;

ALTER TABLE tblEnemy
DROP COLUMN EnemyId;

ALTER TABLE tblEnemy
ADD EnemyId INT NOT NULL IDENTITY(1,1)
CONSTRAINT pk_Enemy_Id PRIMARY KEY (EnemyId);

ALTER TABLE tblEpisodeEnemy 
ADD CONSTRAINT FK_Episode_Enemy_Id FOREIGN KEY (EnemyId)
REFERENCES tblEnemy(EnemyId)
