USE DB_Championship;
GO

-- Select the champion --
SELECT TOP(1) [name] as 'Teams', points as 'Points', win as 'Wins',
    draw as 'Drawn', lose as 'Loses', goalFor as 'Goals For', goalAgainst as 'Goals Against',
    (goalFor - goalAgainst) as 'Goals Difference'
    FROM Team
    ORDER BY points desc, win desc, 'Goals difference' desc;
GO

-- Select all Teams Standings -- 
SELECT [name] as 'Teams', points as 'Points', win as 'Wins',
    draw as 'Drawn', lose as 'Loses', goalFor as 'Goals For', goalAgainst as 'Goals Against',
    (goalFor - goalAgainst) as 'Goals Difference'
    FROM Team
    ORDER BY points desc, win desc, 'Goals difference' desc;
GO

-- Team that has made the most goals --
SELECT TOP(1) [name] as 'Team', goalFor as 'Goals Made' FROM Team ORDER BY goalFor DESC;
GO

-- Teams selected by most goals made --
SELECT [name] as 'Team', goalFor as 'Goals Made' FROM Team ORDER BY goalFor DESC;
GO

-- Team that has taken the most goals --
SELECT TOP(1) [name] as 'Team', goalAgainst as 'Goals Taken' FROM Team ORDER BY goalAgainst DESC;
GO

-- Teams selected by most goals taken --
SELECT [name] as 'Team', goalAgainst as 'Goals Taken' FROM Team ORDER BY goalAgainst DESC;
GO

-- Match with the most goals --
SELECT TOP(1) m.id as 'Match', (SELECT t.[name] FROM Team t WHERE t.id = m.homeTeam) as 'Home Team', m.goalHome,
    (SELECT t.[name] FROM Team t WHERE t.id =  m.awayTeam) as 'Away Team', m.goalAway,
    (m.goalHome + m.goalAway) as 'Goals in the match'  
FROM Match m
ORDER BY 'Goals in the match' DESC
GO
