-- Preview the tables
SELECT *
FROM all_defense;

SELECT *
FROM all_offense;

SELECT *
FROM nebraska_defense;

SELECT *
FROM nebraska_offense;

SELECT *
FROM standings;

-- Basic Counts
SELECT COUNT(date) AS games_played
FROM nebraska_offense; -- 287

SELECT COUNT( DISTINCT opponent)
FROM nebraska_offense; -- 79

SELECT COUNT (outcome)
FROM nebraska_offense
WHERE outcome = "W"; --168

SELECT COUNT (outcome)
FROM nebraska_offense
WHERE outcome = "L"; --119

SELECT Min (date), opponent, score
FROM nebraska_offense; -- 2000-09-02 00:00:00	San Jose State	W (49-13)

SELECT Max (date), opponent, score
FROM nebraska_offense; -- 2022-11-25 00:00:00	Iowa	W (24-17)

-----------------------------------
-- Analyis - Nebraska Offense
-----------------------------------
-- Top Performances (Rushing)
SELECT date, opponent, score, rushing_yds, rushing_avg, rushing_td, points_for - points_against AS point_diff
FROM nebraska_offense
ORDER BY rushing_yds DESC
LIMIT 10;

-- Top Performances (Passing)
SELECT date, opponent, score, passing_cmp, passing_att, passing_pct, passing_yds, passing_td, points_for - points_against AS point_diff
FROM nebraska_offense
ORDER BY passing_yds DESC
LIMIT 10;

-- Top Rushing Performances Evaluating Nebraska's Defense
SELECT nebraska_offense.date, nebraska_offense.opponent, nebraska_offense.score, nebraska_offense.rushing_yds, nebraska_defense.total_yds AS opponent_total_yards, nebraska_offense.points_for - nebraska_offense.points_against AS point_diff
FROM nebraska_offense
INNER JOIN nebraska_defense on nebraska_offense.date = nebraska_defense.date
ORDER BY nebraska_offense.rushing_yds DESC
LIMIT 10;

-- Top Passing Performances Evaluating Nebraska's Defense
SELECT nebraska_offense.date, nebraska_offense.opponent, nebraska_offense.score, nebraska_offense.passing_yds, nebraska_defense.total_yds AS opponent_total_yards, nebraska_offense.points_for - nebraska_offense.points_against AS point_diff
FROM nebraska_offense
INNER JOIN nebraska_defense on nebraska_offense.date = nebraska_defense.date
ORDER BY nebraska_offense.passing_yds DESC
LIMIT 10;

-- Top Scoring Performances
SELECT date, opponent, points_for, points_against
FROM nebraska_offense
ORDER BY points_for DESC
LIMIT 10;

-- How has the offense changed 
SELECT strftime('%Y', date) AS year, ROUND(AVG(points_for), 2) AS avg_points
FROM nebraska_offense
GROUP BY strftime('%Y', date)
ORDER BY avg_points DESC;


-----------------------------------
-- Analyis - Nebraska Defense
-----------------------------------
-- Top Performances (Rushing Defense)
SELECT date, opponent, score, rushing_yds, rushing_avg, rushing_td, points_for - points_against AS point_diff
FROM nebraska_defense
ORDER BY rushing_yds ASC
LIMIT 10;

-- Top Performances (Passing Defense)
SELECT date, opponent, score, passing_cmp, passing_att, passing_pct, passing_yds, passing_td, points_for - points_against AS point_diff
FROM nebraska_defense
ORDER BY passing_yds ASC
LIMIT 10;

-- Top Rushing Defense Performances Evaluating Nebraska's Offense
SELECT nd.date, nd.opponent, nd.score, nd.rushing_yds, no.total_yds AS Nebraska_total_yards, (nd.points_for - nd.points_against) AS point_diff
FROM nebraska_defense nd
INNER JOIN nebraska_offense no ON nd.date = no.date
ORDER BY nd.rushing_yds ASC
LIMIT 10;

-- Top Passing Defense Performances Evaluating Nebraska's Offense
SELECT nd.date, nd.opponent, nd.score, nd.passing_yds, no.total_yds AS Nebraska_total_yards, (nd.points_for - nd.points_against) AS point_diff
FROM nebraska_defense nd
INNER JOIN nebraska_offense no ON nd.date = no.date
ORDER BY nd.passing_yds ASC
LIMIT 10;

-- Top Defensive Performances based on Score
SELECT date, opponent, points_for, points_against
FROM nebraska_defense
ORDER BY points_against ASC
LIMIT 10;

-- How has the Defense changed 
SELECT strftime('%Y', date) AS year, ROUND(AVG(points_against), 2) AS avg_points_against
FROM nebraska_defense
GROUP BY strftime('%Y', date)
ORDER BY avg_points_against ASC;


-----------------------------------------------
-- Analyis - Nebraska Penalties and Turnovers
-----------------------------------------------
-- What was the outcome of the 10 worst performances based on turnovers
SELECT date, opponent, score, fumbles, intceptions, turnovers
FROM nebraska_offense
ORDER BY turnovers DESC
LIMIT 10;

-- What the hell happened with that Iowa State game in 2009? 
SELECT *
FROM nebraska_offense
WHERE date = "2009-10-24 00:00:00";
 
SELECT *
FROM nebraska_defense
WHERE date = "2009-10-24 00:00:00";

-- Link this to the Paul Rhodes Clip 
SELECT opponent, passing_cmp, passing_att, passing_yds, passing_td, rushing_att, rushing_yds, rushing_avg, rushing_td, total_yds
FROM nebraska_defense
WHERE date = "2009-10-24 00:00:00";

-- Does ISU have Nebraska's Number?
SELECT *
FROM standings
WHERE year = "2009" AND (school = "Nebraska" OR school = "Iowa State");

-- What was the outcome of the 10 best performances based on turnovers
SELECT date, opponent, score, fumbles, intceptions, turnovers
FROM nebraska_defense
ORDER BY turnovers DESC
LIMIT 10;

-- What the hell happened with that Oklahoma game in 2009? 
SELECT *
FROM nebraska_offense
WHERE date = "2009-11-07 00:00:00";

SELECT *
FROM nebraska_defense
WHERE date = "2009-11-07 00:00:00";

-- How did these teams finish the season?
SELECT *
FROM standings
WHERE year = "2009" AND (school = "Nebraska" OR school = "Oklahoma");

-- What was the outcome of the 10 worst performances based on penalties
SELECT no.date, no.opponent, no.score, no.penalties, no.penalty_yds, nd.penalties, nd.penalty_yds, (no.penalties + nd.penalties) AS total_penalties, (no.penalty_yds + nd.penalty_yds) AS total_penalty_yds
FROM nebraska_offense AS no
INNER JOIN nebraska_defense AS nd ON nd.date = no.date
ORDER BY total_penalty_yds DESC
LIMIT 10;

-----------------------------------------------
-- Analyis - Standings
-----------------------------------------------
-- What is the range for SRS
SELECT year, school, wins, losses, MAX(SRS)
FROM standings; -- 30.26

SELECT year, school, wins, losses, MIN(SRS)
FROM standings; -- (-29.95)

-- What years were we doing well?
SELECT *
FROM standings
WHERE school = "Nebraska"
ORDER BY SRS DESC;

-- What years were we doing poorly?
SELECT *
FROM standings
WHERE school = "Nebraska"
ORDER BY SRS ASC;

-----------------------------------------------
-- Analyis - All Offense
-----------------------------------------------
-- Top Performances (Rushing Yards)
SELECT year, school, rushing_yds, rushing_td
FROM all_offense
ORDER BY rushing_yds DESC
LIMIT 10;

-- Top Performances (Rushing TDs)
SELECT year, school, rushing_yds, rushing_td
FROM all_offense
ORDER BY rushing_td DESC
LIMIT 10;

-- Top Performances (Passing Yards)
SELECT year, school, passing_cmp, passing_att, passing_pct, passing_yds, passing_td
FROM all_offense
ORDER BY passing_yds DESC
LIMIT 10;

-- Top Performances (Passing TDs)
SELECT year, school, passing_cmp, passing_att, passing_pct, passing_yds, passing_td
FROM all_offense
ORDER BY passing_td DESC
LIMIT 10;

-- Top Performances (Passing Efficiency)
SELECT year, school, passing_cmp, passing_att, passing_pct, passing_yds, passing_td
FROM all_offense
ORDER BY passing_pct DESC
LIMIT 10;

-- Top Performances (Total TDs)
SELECT year, school, rushing_td, passing_td, (rushing_td + passing_td) AS total_td
FROM all_offense
ORDER BY total_td DESC
LIMIT 10;

-- Top Performances (Total Yards)
SELECT year, school, total_yds
FROM all_offense
ORDER BY total_yds DESC
LIMIT 10;

-----------------------------------------------
-- Analyis - All defense
-----------------------------------------------
-- Top Performances (Rushing Yards)
SELECT year, school, rushing_yds, rushing_td
FROM all_defense
ORDER BY rushing_yds ASC
LIMIT 10;

-- Top Performances (Rushing TDs)
SELECT year, school, rushing_yds, rushing_td
FROM all_defense
ORDER BY rushing_td ASC
LIMIT 10;

-- Top Performances (Passing Yards)
SELECT year, school, passing_cmp, passing_att, passing_pct, passing_yds, passing_td
FROM all_defense
ORDER BY passing_yds ASC
LIMIT 10;

-- Top Performances (Passing TDs)
SELECT year, school, passing_cmp, passing_att, passing_pct, passing_yds, passing_td
FROM all_defense
ORDER BY passing_td ASC
LIMIT 10;

-- Top Performances (Passing Efficiency)
SELECT year, school, passing_cmp, passing_att, passing_pct, passing_yds, passing_td
FROM all_defense
ORDER BY passing_pct ASC
LIMIT 10;

-- Top Performances (Total TDs)
SELECT year, school, rushing_td, passing_td, (rushing_td + passing_td) AS total_td
FROM all_defense
ORDER BY total_td ASC
LIMIT 10;

-- Top Performances (Total Yards)
SELECT year, school, total_yds
FROM all_defense
ORDER BY total_yds ASC
LIMIT 10;