---DATA EXPLORATION
---EPL SEASON 2020/2021

SELECT *
FROM[dbo].[EPL_20_21$]

---Lets get the following summary of the  2020/2021 season
	---the total number of clubs that played
	---the total number of players that participated
	---the total number of countries where the players originated from
SELECT 
	COUNT(DISTINCT(Club)) AS Total_clubs,
	COUNT(DISTINCT(Name)) AS Total_no_of_players,
	COUNT(DISTINCT(Nationality)) AS Player_nationalities
FROM [dbo].[EPL_20_21$]

---Let's get the total number of goals scored in the season
SELECT 
	Club,
	SUM(Goals) AS Total_goals_scored, 
	SUM(Assists) AS Total_assists_provided
FROM [dbo].[EPL_20_21$]
GROUP BY Club
ORDER BY Total_goals_scored DESC

---Get the number of penality goals
SELECT
	Club,
	SUM(Penalty_Goals) AS Penality_goals,
	SUM(Penalty_Attempted) AS Penalty_attempted
FROM [dbo].[EPL_20_21$]
GROUP BY Club
OrDER BY Penalty_attempted DESC

---Lets get the unique positions players played and the number of players per that position
SELECT
	DISTINCT(Position), 
	COUNT(Position) AS No_of_players
FROM [dbo].[EPL_20_21$]
GROUP BY Position

---Lets total number pf players by country
SELECT 
	Nationality, COUNT(Nationality) AS Total_no_players
FROM [dbo].[EPL_20_21$]
GROUP BY Nationality
ORDER BY Total_no_players DESC

---Lets get the total number of players by club
SELECT
	Club, COUNT(Club) AS Total_no_of_players
FROM [dbo].[EPL_20_21$]
GROUP BY Club
ORDER BY Total_no_of_players DESC

--Age groups
SELECT 
	Club,
	ROUND(AVG(Age), 1) AS Average_age,
	MIN(Age) AS Minimum_age,
	MAX(Age) AS Maximum_age
FROM [dbo].[EPL_20_21$]
GROUP BY Club
ORDER BY Average_age 


---Assists by club
SELECT
	Club, 
	SUM(Assists) AS Total_no_assists
FROM [dbo].[EPL_20_21$]
GROUP BY Club
ORDER BY Total_no_assists DESC


---Top scorers
SELECT
	Name,
	Club,
	Goals,
	Matches,
	Mins,
	ROUND(Mins/NULLIF(Goals,0),1) AS Mins_per_goal
FROM [dbo].[EPL_20_21$]
WHERE Goals IS NOT NULL AND Mins IS NOT NULL
ORDER BY Goals DESC


--Top providers
SELECT
	Name,
	Club,
	Assists,
	ROUND(Mins/NULLIF(Assists,0),1) AS Mins_per_assist
FROM [dbo].[EPL_20_21$]
ORDER BY Assists DESC

---YELLOW CARDS, RED CARDS
---Rank the clus by their level of aggression
SELECT
	Club,
	SUM(Yellow_Cards) AS Total_yellow_cards,
	SUM(Red_Cards) AS Total_red_cards
FROM [dbo].[EPL_20_21$]
GROUP BY Club
ORDER BY Total_yellow_cards DESC


---Rank the players by the nuber of yellow cards received
SELECT
	Name,
	Club,
	Position,
	Yellow_Cards
FROM [dbo].[EPL_20_21$]
ORDER BY Yellow_Cards DESC

---Rank the players by the nuber of red cards received
SELECT
	Name,
	Club,
	Position,
	Red_Cards
FROM [dbo].[EPL_20_21$]
ORDER BY Red_Cards DESC



---PASSING
Select *
from EPL_20_21$

SELECT 
	Club,
	ROUND(AVG(Passes_Attempted),0) AS Average_passes,
	ROUND(AVG(Perc_Passes_Completed),0) AS Average_passing_accuracy_perc
FROM [dbo].[EPL_20_21$]
GROUP BY Club
ORDER BY Average_passing_accuracy_perc DESC
