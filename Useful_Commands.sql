USE DB_Championship;
GO
-- Select the champion --
SELECT TOP(1) [name] as 'Teams', points as 'Points', win as 'Wins',
    draw as 'Drawn', lose as 'Loses', goalFor as 'Goals For', goalAgainst as 'Goals Against',
    (goalFor - goalAgainst) as 'Goals Difference'
    FROM Team
    ORDER BY points desc, win desc, 'Goals difference' desc

-- Select all Teams Standings -- 
SELECT [name] as 'Teams', points as 'Points', win as 'Wins',
    draw as 'Drawn', lose as 'Loses', goalFor as 'Goals For', goalAgainst as 'Goals Against',
    (goalFor - goalAgainst) as 'Goals Difference'
    FROM Team
    ORDER BY points desc, win desc, 'Goals difference' desc
