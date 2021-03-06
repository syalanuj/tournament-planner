-- Table definitions for the tournament project.

-- Create tournament database
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

-- Table 'players
CREATE TABLE players (player_id	SERIAL PRIMARY KEY, name TEXT NOT NULL);

-- Table 'matches'
CREATE TABLE matches (
	match_id	SERIAL PRIMARY KEY,
	winner		INTEGER,
	loser		INTEGER,
	FOREIGN KEY (winner) REFERENCES players (player_id),
	FOREIGN KEY (loser) REFERENCES players (player_id)
	);

-- View: Total player count
CREATE VIEW count_players AS
	SELECT player_id, count (*) as num
	FROM players
	GROUP BY player_id
	;

-- view: Total maches played count
CREATE VIEW matches_played AS
    SELECT players.name, players.player_id, count (matches.match_id) as played
    FROM players LEFT JOIN matches
	ON players.player_id = matches.winner OR players.player_id = matches.loser
    GROUP BY players.player_id
    ;

-- View:Wins counts
CREATE VIEW wins AS
	SELECT winner, count (*) as wins
	FROM matches
	GROUP BY winner
	ORDER BY wins DESC
	;

-- View: Swiss tournament player standings
CREATE VIEW standings AS
	SELECT matches_played.player_id, matches_played.name,
	COALESCE (wins.wins,0) AS wins,
	matches_played.played
	FROM matches_played
	LEFT JOIN wins ON matches_played.player_id = wins.winner
	ORDER BY wins DESC
	;