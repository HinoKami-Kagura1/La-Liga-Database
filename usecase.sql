SQL Use Cases for Soccer Match System
  
 1. Entity: Team
 Actor: Admin
 Insert a Team
 INSERT INTO Team (Team_ID, Team_Name, Stadium, City, Manager)
 VALUES (10001, 'Alaves', 'Estadio de Mendizorrotza', 'Victoria-Gasteiz', 'Eduardo Coudet');
 Delete a Team
 DELETE FROM Team
 WHERE Team_ID = 10001;
 Update Stadium
 UPDATE Team
 SET Stadium = 'Camp Nou'
 WHERE Team_ID = 10004;
 Count Total Teams
 SELECT COUNT(*) AS TotalTeams
 FROM Team;

 2. Entity: TeamStats
 Actor: Admin / Analyst
 Insert Team Stats
 INSERT INTO TeamStats (TeamID, Wins, Draws, Losses, GoalsScored, GoalsConceded, Points,
Rank)
 VALUES (1, 5, 3, 2, 15, 10, 18, 2);
 Delete Team Stats
 DELETE FROM TeamStats
 WHERE TeamID = 1;
 Update Rank
 UPDATE TeamStats
 SET Rank = 1
 WHERE TeamID = 1;
 Average Goals Scored
 SELECT AVG(GoalsScored) AS AvgGoals
 FROM TeamStats;

 3. Entity: Player
 Actor: Admin / Coach / Analyst
 Insert Player
 INSERT INTO Player (PlayerID, Name, Position, TeamID)
 VALUES (101, 'Lionel Messi', 'Right Winger', 10);
 Delete Player
 DELETE FROM Player
 WHERE PlayerID = 101;
 Update Position
 UPDATE Player
 SET Position = 'Central Forward'
 WHERE PlayerID = 101;
 Count Players per Team
 SELECT TeamID, COUNT(*) AS PlayerCount
 FROM Player
 GROUP BY TeamID;

 4. Entity: PlayerStats
 Actor: Admin / Coach / Analyst
 Insert Player Stats
 INSERT INTO PlayerStats (PlayerID, Goals, Assists, MinutesPlayed)
 VALUES (101, 8, 4, 900);
 Delete Player Stats
 DELETE FROM PlayerStats
 WHERE PlayerID = 101;
 Update Minutes Played
 UPDATE PlayerStats
 SET MinutesPlayed = 960
 WHERE PlayerID = 101;
 Top Scorers
SELECT PlayerID, Goals
 FROM PlayerStats
 ORDER BY Goals DESC
 LIMIT 5;

 5. Entity: Match
 Actor: Admin / Analyst
 Insert Match
 INSERT INTO Match (MatchID, Date, HomeTeamID, AwayTeamID, HomeGoals, AwayGoals)
 VALUES (101, '2025-04-01', 1, 2, 3, 1);
 Delete Match
 DELETE FROM Match
 WHERE MatchID = 101;
 Update Match Score
 UPDATE Match
 SET HomeGoals = 4, AwayGoals = 2
 WHERE MatchID = 101;
 Count Total Matches
 SELECT COUNT(*) AS TotalMatches
 FROM Match;

 6. Entity: Goals
 Actor: Referee / Analyst
 Insert Goal
 INSERT INTO Goals (GoalID, MatchID, PlayerID, TeamID, MinutesScored)
 VALUES (2001, 1001, 101, 1, 45);
 Delete Goal
 DELETE FROM Goals
 WHERE GoalID = 2001;
 Update Goal Minute
 UPDATE Goals
 SET MinutesScored = 44
 WHERE GoalID = 2001;
 Total Goals per Player
 SELECT PlayerID, COUNT(*) AS GoalCount
 FROM Goals
 GROUP BY PlayerID;

 7. Entity: Card
 Actor: Referee / Analyst
 Insert Card
 INSERT INTO Card (CardID, MatchID, PlayerID, CardType, MinuteIssued)
 VALUES (3001, 1001, 101, 'Yellow', 60);
 Delete Card
 DELETE FROM Card
WHERE CardID = 3001;
 Update Card Type
 UPDATE Card
 SET CardType = 'Red'
 WHERE CardID = 3001;
 Most Penalized Players
 SELECT PlayerID, COUNT(*) AS TotalCards
 FROM Card
 GROUP BY PlayerID
 ORDER BY TotalCards DESC;
