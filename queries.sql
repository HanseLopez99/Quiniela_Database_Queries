-- Phases view
SELECT description FROM phases;

-- Teams view
SELECT name FROM teams;

-- Games view
SELECT t1.name as "Team 1", t2.name as "Team 2", g.starting_at as "Starting at", p.description as "Phase", g.team1_score as "Score 1", g.team2_score as "Score 2"
FROM games g 
INNER JOIN teams t1 on t1.id = g.team1_id 
INNER JOIN teams t2 on t2.id = g.team2_id 
INNER JOIN phases p on p.id = g.phases_id 
ORDER BY g.created_at ASC;

-- Build title of the game
SELECT concat(t1."name", ' vs ', t2."name") as "Title"
FROM games g 
INNER JOIN teams t1 on t1.id = g.team1_id 
INNER JOIN teams t2 on t2.id = g.team2_id
ORDER BY g.created_at ASC

-- Boards view
SELECT g.title as "Game", u.first_name as "User", b.score1 as "Score 1", b.score2 as "Score 2"
FROM boards b
INNER JOIN games g on b.games_id = g.id
INNER JOIN users u on b.users_id = u.id
ORDER BY b.created_at ASC;

-- Scoreboard
SELECT first_name as "Player", points as "Points" FROM users
ORDER BY points DESC;
