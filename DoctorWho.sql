USE master;
DROP DATABASE DoctorWho;
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DoctorWho')
BEGIN
  CREATE DATABASE DoctorWho;
END;

use DoctorWho;

CREATE TABLE tblEnemy (
    EnemyId int primary key,
    EnemyName varchar(255),
    Description varchar(1000),
);

CREATE TABLE tblAuthor (
    AuthorId  int primary key,
    AuthorName varchar(255),
);

CREATE TABLE tblDoctor (
    DoctorId  int primary key,
    DoctorNumber int,
    DoctorName varchar(255),
	BirthDate Date,
	FirstEpisodDate Date,
	LastEpisodDate Date,
);

CREATE TABLE tblEpisod(
    EpisodId  int primary key,
    SeriesNumber int,	
	EpisodNumber  int,
	EpisodType varchar(255),
	Title varchar(255),
	EpisodDate Date,
	Notes varchar(500),
	AuthorId int  FOREIGN KEY REFERENCES tblAuthor(AuthorId),
	DoctorId int  FOREIGN KEY REFERENCES tblDoctor(DoctorId),
);

CREATE TABLE tblEpisodEnemy(
    EpisodEnemyId  int primary key,
	EpisodId int FOREIGN KEY REFERENCES tblEpisod(EpisodId),
	EnemyId  int FOREIGN KEY REFERENCES tblEnemy(EnemyId),
);

CREATE TABLE tblCompanion (
    CompanionId  int primary key ,
    CompanionName varchar(255),	
	WhoPlayed varchar(255),	
);

CREATE TABLE tblEpisodCompanion(
    EpisodCompanionId  int primary key,
	EpisodId int FOREIGN KEY REFERENCES tblEpisod(EpisodId),
	CompanionId int FOREIGN KEY REFERENCES tblCompanion(CompanionId),
);

///////////////

insert into tblEnemy(EnemyId,EnemyName,Description)values(1,'pain','destroy the word');
insert into tblEnemy(EnemyId,EnemyName,Description)values(2,'obito','waking madara up');
insert into tblEnemy(EnemyId,EnemyName,Description)values(3,'Madara','tsokoyome');
insert into tblEnemy(EnemyId,EnemyName,Description)values(4,'Kaguya','eat the forbidden fruit');
insert into tblEnemy(EnemyId,EnemyName,Description)values(5,'Boruto','destroy Naruto anime');

insert into tblAuthor (AuthorId,AuthorName) Values(1,'Minato');
insert into tblAuthor (AuthorId,AuthorName) Values(2,'Kakashi');
insert into tblAuthor (AuthorId,AuthorName) Values(3,'Naruto');
insert into tblAuthor (AuthorId,AuthorName) Values(4,'Jiraya');
insert into tblAuthor (AuthorId,AuthorName) Values(5,'Tsunadi');

insert into tblDoctor(DoctorId,DoctorName,DoctorNumber,BirthDate,FirstEpisodDate,LastEpisodDate)
values(1,'Minato',564841,'2000-2-2','2011-1-12','2020-11-10');
insert into tblDoctor(DoctorId,DoctorName,DoctorNumber,BirthDate,FirstEpisodDate,LastEpisodDate)
values(2,'demon',51654,'2002-3-3','2021-1-1','2022-12-10');
insert into tblDoctor(DoctorId,DoctorName,DoctorNumber,BirthDate,FirstEpisodDate,LastEpisodDate)
values(3,'pain',5154,'2005-4-3','2014-1-12','2020-11-11');
insert into tblDoctor(DoctorId,DoctorName,DoctorNumber,BirthDate,FirstEpisodDate,LastEpisodDate)
values(4,'kakashi',2,'2006-5-5','2013-1-12','2020-2-6');
insert into tblDoctor(DoctorId,DoctorName,DoctorNumber,BirthDate,FirstEpisodDate,LastEpisodDate)
values(5,'shikamaro',3,'2008-6-7','2012-1-12','2022-2-10');

insert into tblEpisod(EpisodId,AuthorId,DoctorId,EpisodDate,EpisodNumber,EpisodType,Notes,SeriesNumber,Title
)values(1,1,1,'2020-1-1',1,'a','ddd',2,'vv');

insert into tblEpisod(EpisodId,AuthorId,DoctorId,EpisodDate,EpisodNumber,EpisodType,Notes,SeriesNumber,Title
)values(2,3,2,'2030-1-1',2,'b','aaaa',1,'vva');

insert into tblEpisod(EpisodId,AuthorId,DoctorId,EpisodDate,EpisodNumber,EpisodType,Notes,SeriesNumber,Title
)values(3,2,5,'2000-1-1',3,'c','fdsfds',3,'va');

insert into tblEpisod(EpisodId,AuthorId,DoctorId,EpisodDate,EpisodNumber,EpisodType,Notes,SeriesNumber,Title
)values(4,5,3,'2020-1-1',4,'d',' ',4,'aavv');

insert into tblEpisod(EpisodId,AuthorId,DoctorId,EpisodDate,EpisodNumber,EpisodType,Notes,SeriesNumber,Title
)values(5,4,4,'2005-10-1',5,'f','dsfdsf',5,'ddas');


insert into tblEpisodEnemy(EpisodEnemyId,EnemyId,EpisodId)values(1,1,2);
insert into tblEpisodEnemy(EpisodEnemyId,EnemyId,EpisodId)values(2,3,3);
insert into tblEpisodEnemy(EpisodEnemyId,EnemyId,EpisodId)values(3,2,4);
insert into tblEpisodEnemy(EpisodEnemyId,EnemyId,EpisodId)values(4,4,1);
insert into tblEpisodEnemy(EpisodEnemyId,EnemyId,EpisodId)values(5,5,5);

insert into tblCompanion(CompanionId,CompanionName,WhoPlayed) Values(1,'c1','p1');
insert into tblCompanion(CompanionId,CompanionName,WhoPlayed) Values(2,'c2','p2');
insert into tblCompanion(CompanionId,CompanionName,WhoPlayed) Values(3,'c3','p3');
insert into tblCompanion(CompanionId,CompanionName,WhoPlayed) Values(4,'c4','p4');
insert into tblCompanion(CompanionId,CompanionName,WhoPlayed) Values(5,'c5','p5');

insert into tblEpisodCompanion(EpisodCompanionId,CompanionId,EpisodId)values(1,1,4);
insert into tblEpisodCompanion(EpisodCompanionId,CompanionId,EpisodId)values(2,2,5);
insert into tblEpisodCompanion(EpisodCompanionId,CompanionId,EpisodId)values(3,3,3);
insert into tblEpisodCompanion(EpisodCompanionId,CompanionId,EpisodId)values(4,4,1);
insert into tblEpisodCompanion(EpisodCompanionId,CompanionId,EpisodId)values(5,5,2);


update tblEpisod set DoctorId=NULL
where EpisodId=5;
update tblEpisod set Title=concat(Title,'_Cancled')
where DoctorId IS NULL;

DELETE FROM  tblEpisodCompanion WHERE EpisodCompanionId=5;
DELETE FROM tblCompanion WHERE CompanionId NOT IN (
SELECT CompanionId from tblEpisodCompanion)

