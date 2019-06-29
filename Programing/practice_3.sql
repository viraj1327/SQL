


#VIRAJ SALVI GR0006341
# 1 Question
CREATE DATABASE Final_Viraj;

USE Final_Viraj;

CREATE TABLE Player(
	Player_ID INT PRIMARY KEY ,
	Firstname VARCHAR(50) NOT NULL,
	Lastname VARCHAR(50) NOT NULL,
	Birthdate DATE NOT NULL,
	State VARCHAR(50) NOT NULL,
	Gamesplayed INT 
);

INSERT INTO Player(Player_ID,Firstname, Lastname, Birthdate, State, Gamesplayed) 
 VALUES (1,'Cristiano', 'Ronaldo', '1985-02-05', 'Madrid', 90),
		(2,'Lionel', 'Messi', '1994-06-24', 'Barcelona', 85),
		(3,'Neymar', 'Jr', '1992-04-05', 'Paris', 70),
		(4,'Marco', 'Reus', '1989-04-30', 'Dortmund', 65),
		(5,'Lebron', 'James', '1984-12-30', 'Clevenland', 90),
		(10,'Russell', 'Westbrook', '1988-11-12', 'Oklohoma', 85),
		(9,'Stephen', 'Curry', '1988-04-14', 'Ohio', 80),
		(6,'Rodriguez', 'James', '1991-07-12', 'Bayern', 60),
		(7,'Sergio', 'Ramos', '1986-04-30', 'Spain', 90),
		(8,'Toni', 'Kroos', '1990-01-04', 'Madrid', 82); 


CREATE TABLE Team(
	Team_ID INT PRIMARY KEY AUTO_INCREMENT, 
    Teamname VARCHAR(50) NOT NULL,
    Coach_ID INT,
    CONSTRAINT FK_Team FOREIGN KEY (Coach_ID) REFERENCES Coach(Coach_ID)
);


INSERT INTO Team(Teamname, Coach_ID)
 VALUES ('Real Madrid',1),
		('Barcelona', 2),
		('PSG',3),
		('Liverpool',4),
		('Basketball', 5);

CREATE TABLE Coach(
	Coach_ID INT PRIMARY KEY AUTO_INCREMENT,
	Coach_name VARCHAR(50) NOT NULL
);

INSERT INTO Coach(Coach_name)
 VALUES ('Zindane'),
		('Jose'),
		('Pep'),
		('Klopp'),
		('Sir Alex');


SELECT * FROM Player;
/*OUTPUT
+-----------+-----------+-----------+------------+------------+-------------+
| Player_ID | Firstname | Lastname  | Birthdate  | State      | Gamesplayed |
+-----------+-----------+-----------+------------+------------+-------------+
|         1 | Cristiano | Ronaldo   | 1985-02-05 | Madrid     |          90 |
|         2 | Lionel    | Messi     | 1994-06-24 | Barcelona  |          85 |
|         3 | Neymar    | Jr        | 1992-04-05 | Paris      |          70 |
|         4 | Marco     | Reus      | 1989-04-30 | Dortmund   |          65 |
|         5 | Lebron    | James     | 1984-12-30 | Clevenland |          90 |
|         6 | Rodriguez | James     | 1991-07-12 | Bayern     |          60 |
|         7 | Sergio    | Ramos     | 1986-04-30 | Spain      |          90 |
|         8 | Toni      | Kroos     | 1990-01-04 | Madrid     |          82 |
|         9 | Stephen   | Curry     | 1988-04-14 | Ohio       |          80 |
|        10 | Russell   | Westbrook | 1988-11-12 | Oklohoma   |          85 |
+-----------+-----------+-----------+------------+------------+-------------+
10 rows in set (0.00 sec)
*/

SELECT * FROM Coach;
/*OUTPUT
+----------+------------+
| Coach_ID | Coach_name |
+----------+------------+
|        1 | Zindane    |
|        2 | Jose       |
|        3 | Pep        |
|        4 | Klopp      |
|        5 | Sir Alex   |
+----------+------------+
5 rows in set (0.00 sec)
*/



SELECT * FROM Team;

/*OUTPUT
+---------+-------------+----------+
| Team_ID | Teamname    | Coach_ID |
+---------+-------------+----------+
|       1 | Real Madrid |        1 |
|       2 | Barcelona   |        2 |
|       3 | PSG         |        3 |
|       4 | Liverpool   |        4 |
|       5 | Basketball  |        5 |
+---------+-------------+----------+
5 rows in set (0.00 sec)
*/


SELECT * FROM Game;

/*OUTPUT
+---------+-----------+---------+
| Game_ID | Player_ID | Team_ID |
+---------+-----------+---------+
|       1 |         1 |       1 |
|       2 |         2 |       2 |
|       3 |         3 |       3 |
|       4 |         4 |       4 |
|       5 |         5 |       5 |
+---------+-----------+---------+
5 rows in set (0.00 sec)
*/

CREATE TABLE Game(
	Game_ID INT PRIMARY KEY AUTO_INCREMENT,
    Player_ID INT,
    Team_ID INT,
    CONSTRAINT FK_Game FOREIGN  KEY (Player_ID) REFERENCES Player(Player_ID),
    CONSTRAINT FK_Game FOREIGN  KEY (Team_ID) REFERENCES Team(Team_ID)
);


INSERT INTO Game (Player_ID, Team_ID)
 VALUES (1,1),
		(2,2),
        (3,3),
		(4,4),
        (5,5);
 
 

#2 ER Diagram


#3 QUESTION
SELECT lastname, gamesplayed 
	FROM player
		WHERE lastname LIKE 'R%_%_%_%';
        
        
/* OUTPUT
+----------+-------------+
| lastname | gamesplayed |
+----------+-------------+
| Ronaldo  |          90 |
| Reus     |          65 |
| Ramos    |          90 |
+----------+-------------+
*/

    
#4 QUESTION
SELECT concat(firstname, ' ', Lastname) AS 'FULL NAME', state
	FROM player;
    
/* OUTPUT    
+-------------------+------------+
| FULL NAME         | state      |
+-------------------+------------+
| Cristiano Ronaldo | Madrid     |
| Lionel Messi      | Barcelona  |
| Neymar Jr         | Paris      |
| Marco Reus        | Dortmund   |
| Lebron James      | Clevenland |
| Rodriguez James   | Bayern     |
| Sergio Ramos      | Spain      |
| Toni Kroos        | Madrid     |
| Stephen Curry     | Ohio       |
| Russell Westbrook | Oklohoma   |
+-------------------+------------+
10 rows in set (0.00 sec)
*/

#5 QUESTION
SELECT *  
	FROM player 
		WHERE birthdate > '1985-01-01' && State = 'Madrid' || state = 'paris';

/* OUTPUT
+-----------+-----------+----------+------------+--------+-------------+
| Player_ID | Firstname | Lastname | Birthdate  | State  | Gamesplayed |
+-----------+-----------+----------+------------+--------+-------------+
|         1 | Cristiano | Ronaldo  | 1985-02-05 | Madrid |          90 |
|         3 | Neymar    | Jr       | 1992-04-05 | Paris  |          70 |
|         8 | Toni      | Kroos    | 1990-01-04 | Madrid |          82 |
+-----------+-----------+----------+------------+--------+-------------+
3 rows in set (0.00 sec)

*/

#6 QUESTION
SELECT *  
	FROM player 
		WHERE gamesplayed BETWEEN '30' AND '60';
        
/*OUTPUT
+-----------+-----------+----------+------------+--------+-------------+
| Player_ID | Firstname | Lastname | Birthdate  | State  | Gamesplayed |
+-----------+-----------+----------+------------+--------+-------------+
|         6 | Rodriguez | James    | 1991-07-12 | Bayern |          60 |
+-----------+-----------+----------+------------+--------+-------------+
1 row in set (0.00 sec)
*/

#7 QUESTION
SELECT firstname, teamname, birthdate 
	FROM player JOIN game ON game.player_ID = player.player_ID 
		JOIN team ON game.team_ID = team.team_ID 
			WHERE monthname(birthdate) = 'April';
/*OUTPUT
+-----------+-----------+------------+
| firstname | teamname  | birthdate  |
+-----------+-----------+------------+
| Neymar    | PSG       | 1992-04-05 |
| Marco     | Liverpool | 1989-04-30 |
+-----------+-----------+------------+
2 rows in set (0.00 sec)
*/


#8 QUESTION
SELECT MIN(birthdate),concat(Firstname,' ',lastname) AS 'YOUNGEST', teamname 
	FROM player JOIN game ON game.player_ID = player.player_ID 
		JOIN team ON team.team_ID = game.team_ID 
			GROUP BY player.firstname, player.lastname, teamname, birthdate
				ORDER BY birthdate
					LIMIT 1;
                    
/*OUTPUT
 +----------------+--------------+------------+
| MIN(birthdate) | YOUNGEST     | teamname   |
+----------------+--------------+------------+
| 1984-12-30     | Lebron James | Basketball |
+----------------+--------------+------------+
1 row in set (0.00 sec)
*/

 #9 QUESTION
SELECT SUM(gamesplayed) AS 'GAMES PLAYED ', teamname FROM game
	JOIN team ON team.team_ID = game.team_ID
		JOIN player ON player.Player_ID = game.player_ID
			WHERE team.teamname = 'Real Madrid'
				GROUP BY teamname;

/*OUTPUT
+---------------+-------------+
| GAMES PLAYED  | teamname    |
+---------------+-------------+
|            90 | Real Madrid |
+---------------+-------------+
1 row in set (0.01 sec)
*/

#11 QUESTION
 SELECT AVG(gamesplayed) AS 'AVERAGE', teamname FROM game
	JOIN team ON team.team_ID = game.team_ID
		JOIN player ON player.Player_ID = game.player_ID
			GROUP BY team.teamname
				HAVING AVG(gamesplayed) > 50;
/*OUTPUT
+---------+-------------+
| AVERAGE | teamname    |
+---------+-------------+
| 85.0000 | Barcelona   |
| 90.0000 | Basketball  |
| 65.0000 | Liverpool   |
| 70.0000 | PSG         |
| 90.0000 | Real Madrid |
+---------+-------------+
5 rows in set (0.00 sec)
*/






 
 
 
 
 
 
 
 
 
 
 
 

