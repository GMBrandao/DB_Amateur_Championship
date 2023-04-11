USE DB_Championship;
GO
-- Select the champion --
SELECT TOP(1) t.name as 'Teams', t.points as 'Points', t.win as 'Wins',
    t.draw as 'Drawn', t.lose as 'Loses', (t.goalFor - t.goalAgainst) as 'Goals Difference'
    FROM Team t
    ORDER BY t.points, t.win, 'Goals difference'

-- Select all Teams Standings -- 
select * FROM Championship;
select * FROM Match;
select * FROM Team;
GO
