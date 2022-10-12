--                                         QUINIELA QUERIES

-- Phases view
SELECT p.description FROM phases p;

-- Teams view
SELECT t."name" FROM teams t;

-- Games view
SELECT t1."name" as "Team 1", t2."name" as "Team 2", g.starting_at as "Starting at", p.description as "Phase", g.team1_score as "Score 1", g.team2_score as "Score 2"
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
ORDER BY g.created_at ASC;

-- Boards view
SELECT g.title as "Game", u.first_name as "User", b.score1 as "Score 1", b.score2 as "Score 2"
FROM boards b
INNER JOIN games g on b.games_id = g.id
INNER JOIN users u on b.users_id = u.id
ORDER BY b.created_at ASC;

-- Scoreboard
SELECT first_name as "Player", points as "Points" FROM users
ORDER BY points DESC;

--                                         EXTRA QUERIES

-- Get amount of games per phase
SELECT p.description as "Phase", COUNT(g.id) as "Cantidad de juegos"
FROM games g 
INNER JOIN phases p on p.id = g.phases_id 
GROUP BY p.description
ORDER BY COUNT(g.id) DESC;

-- Get amount of games per team
SELECT t."name" as "Team", COUNT(g.id) as "Cantidad de juegos"
FROM games g
INNER JOIN teams t on t.id = g.team1_id OR t.id = g.team2_id
GROUP BY t."name"
ORDER BY COUNT(g.id) DESC;

-- Get amount of bets per user
SELECT u.first_name as "User", COUNT(b.id) as "Cantidad de apuestas"
FROM boards b
INNER JOIN users u on b.users_id = u.id
GROUP BY u.first_name
ORDER BY COUNT(b.id) DESC;

-- Get amount of bets per game
SELECT g.title as "Game", COUNT(b.id) as "Cantidad de apuestas"
FROM boards b
INNER JOIN games g on b.games_id = g.id
GROUP BY g.title
ORDER BY COUNT(b.id) DESC;

-- Get amount of bets per phase
SELECT p.description as "Phase", COUNT(b.id) as "Cantidad de apuestas"
FROM boards b
INNER JOIN games g on b.games_id = g.id
INNER JOIN phases p on p.id = g.phases_id
GROUP BY p.description
ORDER BY COUNT(b.id) DESC;

-- Show the users who have more than 100 points
SELECT first_name as "User", points as "Points" FROM users
WHERE points > 100
ORDER BY points DESC;

-- Show the top 5 users with more points
SELECT first_name as "User", points as "Points" FROM users
ORDER BY points DESC
LIMIT 5;
