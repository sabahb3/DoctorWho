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