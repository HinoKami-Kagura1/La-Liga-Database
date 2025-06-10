CREATE TABLE Team (
    Team_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Stadium VARCHAR(100),
    City VARCHAR(100),
    CONSTRAINT unique_team_name UNIQUE (Name)
);

CREATE TABLE Match (
    Match_ID INT PRIMARY KEY,
    Match_Date DATE NOT NULL,
    Home_TeamID INT NOT NULL,
    Away_TeamID INT NOT NULL,
    Home_Goals INT DEFAULT 0 CHECK (Home_Goals >= 0),
    Away_Goals INT DEFAULT 0 CHECK (Away_Goals >= 0),
    CONSTRAINT fk_home_team FOREIGN KEY (Home_TeamID) REFERENCES Team(Team_ID),
    CONSTRAINT fk_away_team FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID),
    CONSTRAINT no_self_match CHECK (HomeTeamID <> AwayTeamID)
);

CREATE TABLE Team_Stats (
    Team_ID INT PRIMARY KEY,
    Wins INT DEFAULT 0 CHECK (Wins >= 0),
    Draws INT DEFAULT 0 CHECK (Draws >= 0),
    Losses INT DEFAULT 0 CHECK (Losses >= 0),
    Goals_Scored INT DEFAULT 0 CHECK (GoalsScored >= 0),
    Goals_Conceded INT DEFAULT 0 CHECK (GoalsConceded >= 0),
    Points INT DEFAULT 0 CHECK (Points >= 0),
    Position INT DEFAULT NULL CHECK (Rank >= 1),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

    CREATE TABLE Player (
        PlayerID INT PRIMARY KEY,
        Name VARCHAR(100) NOT NULL,
        Position VARCHAR(50) NOT NULL,
        TeamID INT NOT NULL,
        FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
    );

CREATE TABLE Goal (
        GoalID INT PRIMARY KEY,
        MatchID INT NOT NULL,
        PlayerID INT NOT NULL,
        TeamID INT NOT NULL,
        MinuteScored INT NOT NULL,
        FOREIGN KEY (MatchID) REFERENCES Match(MatchID),
        FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
        FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
    );

CREATE TABLE Card (
        CardID INT PRIMARY KEY,
        MatchID INT NOT NULL,
        PlayerID INT NOT NULL,
        CardType ENUM('Yellow', 'Red') NOT NULL,
        MinuteIssued INT NOT NULL,
        FOREIGN KEY (MatchID) REFERENCES Match(MatchID),
        FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
    );




