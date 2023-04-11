USE DB_Championship;
GO

EXEC.InsertTeam 'Time A', '1990-06-17', 'TMA';
EXEC.InsertTeam 'Time B', '2000-04-04', 'TMB';
EXEC.InsertTeam 'Time C', '2003-10-30', 'TMC';
EXEC.InsertTeam 'Time D', '2001-08-25', 'TMD';
EXEC.InsertTeam 'Time E', '1995-12-13', 'TME';

insert into Championship values ('Exercicio Aula', 2023);

EXEC.InsertMatch 2,5,4,3
EXEC.InsertMatch 3,4,2,1
EXEC.InsertMatch 1,5,2,2
EXEC.InsertMatch 2,3,1,0
EXEC.InsertMatch 1,4,0,2
EXEC.InsertMatch 5,3,3,1
EXEC.InsertMatch 1,3,2,1
EXEC.InsertMatch 4,2,3,3
EXEC.InsertMatch 1,2,2,3
EXEC.InsertMatch 4,5,2,1
EXEC.InsertMatch 5,2,0,3
EXEC.InsertMatch 4,3,2,1
EXEC.InsertMatch 5,1,2,3
EXEC.InsertMatch 3,2,2,2
EXEC.InsertMatch 4,1,2,0
EXEC.InsertMatch 3,5,0,0
EXEC.InsertMatch 3,1,1,2
EXEC.InsertMatch 2,4,1,1
EXEC.InsertMatch 2,1,2,0
EXEC.InsertMatch 5,4,2,1

GO
