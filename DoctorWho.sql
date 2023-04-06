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
