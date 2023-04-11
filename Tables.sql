CREATE DATABASE DB_Championship;
GO
USE DB_Championship;
GO

CREATE TABLE Team(
    id int IDENTITY(1,1) NOT NULL,
    [name] varchar(50) NOT NULL,
    foundation date NOT NULL,
    nickname varchar(30) NOT NULL,

    points int NOT NULL,
    win int NOT NULL,
    draw int NOT NULL,
    lose int NOT NULL,
    goalFor int NOT NULL,
    goalAgainst int NOT NULL,
    
    constraint PK_Team PRIMARY KEY (id)
);
GO

CREATE TABLE Championship(
    id int identity(1,1) NOT NULL,
    [name] varchar (50) NOT NULL,
    [year]  int NOT NULL,

    constraint PK_Championship PRIMARY KEY (id),
    constraint UN_Championship UNIQUE ([name], [year])
);
GO

CREATE TABLE Match(
    id int IDENTITY(1,1) NOT NULL,
    homeTeam int NOT NULL,
    awayTeam int NOT NULL,
    goalHome int NOT NULL,
    goalAway int NOT NULL,

    constraint UN_Match UNIQUE (homeTeam, awayTeam),
    constraint PK_Match PRIMARY KEY (id),
    constraint FK_HomeTeam FOREIGN KEY (homeTeam) REFERENCES Team(id),
    constraint FK_AwayTeam FOREIGN KEY (awayTeam) REFERENCES Team(id)
);
GO