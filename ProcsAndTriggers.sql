USE DB_Championship;
GO

CREATE OR ALTER PROCEDURE InsertTeam
    @name varchar(50),
    @foundation date,
    @nickname varchar(30)
AS
BEGIN
    INSERT INTO Team
        ([name], foundation, nickname, points, win, draw, lose, goalFor, goalAgainst)
    values(@name, @foundation, @nickname, 0, 0, 0, 0, 0, 0)
END;
GO

CREATE OR ALTER PROCEDURE InsertMatch
    @home int,
    @away int,
    @goalHome int,
    @goalAway int
AS
BEGIN
    IF(@home != @away)
        INSERT INTO Match
        (homeTeam, awayTeam, goalHome, goalAway)
    values
        ( @home, @away, @goalHome, @goalAway)
    ELSE
        PRINT('Home team and Away team must have different ID')
END;
GO

CREATE OR ALTER TRIGGER TGR_UpdateTeamsPerMatch ON Match AFTER INSERT
AS
BEGIN
    DECLARE @home int, @away int, @goalHome int, @goalAway int, @pointsH int, @pointsA int,
        @goalForH int, @goalForA int, @goalAgainstH int, @goalAgainstA int,
        @winH int, @winA int, @drawH int, @drawA int, @loseH int, @loseA int

    SELECT @home = homeTeam, @away = awayTeam, @goalHome = goalHome, @goalAway  = goalAway
    FROM inserted

    SELECT @pointsH = t.points, @goalForH = t.goalFor, @goalAgainstH = t.goalAgainst,
        @winH = t.win, @drawH = t.draw, @loseH = t.lose
    FROM Team t
    WHERE @home = t.id

    SELECT @pointsA = t.points, @goalForA = t.goalFor, @goalAgainstA = t.goalAgainst,
        @winA = t.win, @drawA = t.draw, @loseA = t.lose
    FROM Team t
    WHERE @away = t.id

    IF(@goalHome > @goalAway)
    BEGIN
        SET @winH += 1
        SET @loseA += 1
        SET @pointsH += 3
        SET @goalForH += @goalHome
        SET @goalAgainstA += @goalHome
        SET @goalForA += @goalAway
        SET @goalAgainstH += @goalAway
    END
    ELSE
        IF(@goalAway >  @goalHome)
        BEGIN
            SET @winA += 1
            SET @loseH += 1
            SET @pointsA += 5
            SET @goalForH += @goalHome
            SET @goalAgainstA += @goalHome
            SET @goalForA += @goalAway
            SET @goalAgainstH += @goalAway
        END
        ELSE
            IF(@goalHome = @goalAway)
            BEGIN
                SET @drawH += 1
                SET @drawA += 1
                SET @pointsH += 1
                SET @pointsA += 1
                SET @goalForH += @goalHome
                SET @goalAgainstA += @goalHome
                SET @goalForA += @goalAway
                SET @goalAgainstH += @goalAway
            END

    UPDATE Team SET points = @pointsH, win = @winH, draw = @drawH, lose = @loseH,
        goalFor = @goalForH, goalAgainst = @goalAgainstH
    WHERE @home = Team.id

    UPDATE Team SET points = @pointsA, win = @winA, draw = @drawA, lose = @loseA,
        goalFor = @goalForA, goalAgainst = @goalAgainstA
    WHERE @away = Team.id
END;
GO