Join Queries for relationships

Find all matches for a specific team
SELECT Match.Match_ID, Match.Date, T1.Team_Name AS Home_Team, T2.Team_Name AS Away_Team, Match.Home_Goals, Match.Away_Goals
FROM Match 
JOIN Team T1 ON Match.Home_Team_ID = T1.TeamID 
JOIN Team T2 ON Match.AwayTeam_ID = T2.Team_ID
WHERE T1.Team_ID = 1 OR T2.Team_ID = 1;

Find the match result on whose team won
SELECT Match_ID, Date, Home_TeamID, Away_TeamID, Home_Goals, Away_Goals 
FROM Match 
WHERE (Home_TeamID = 1 AND Home_Goals > Away_Goals) 
OR (AwayTeamID = 1 AND Away_Goals > Home_Goals);
SELECT AVG(Home_Goals + Away_Goals) AS Avg_Goals_PerMatch 
FROM Match;

Player Goals in Matches
SELECT G.MatchID, P.Name, G.MinutesScored
FROM Goals
JOIN Player ON G. PlayerID = P. PlayerID;

Card with Player Info
SELECT P.Name, C. MatchID, C.CardType, C.MinuteIssued
FROM Card
JOIN Player ON C.PlayerID = P.PlayerID;

Match Performance Summary
SELECT M.MatchID, P.Name, G.MinuteScored
FROM Goals G
JOIN Player ON G.PlayerID = P.PlayerID
JOIN Match  ON G.MatchID = M.MatchID;

Player Stats with Team
SELECT P.Name, T.Name AS Team, PS.Goals, PS.Assists
FROM PlayerStats PS
JOIN Player  ON PS.PlayerID = P.PlayerID
JOIN Team  ON P.TeamID = T.TeamID;
