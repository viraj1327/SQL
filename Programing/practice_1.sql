
create table players(
first_name varchar(20) not null,
last_name varchar(20) not null,
state char(2) not null default 'NH',
birthdate date not null,
gamesplayed int,
Player_id int not null  primary key);


INSERT INTO players VALUES('srikar', 'prabhala', 'CA', '1993-4-26','60', 1);
INSERT INTO players VALUES('tom', 'brady', 'NE', '1991-4-26','70', 2);
INSERT INTO players VALUES('marshwn', 'lynch', 'NH', '1981-7-11','35', 3);
INSERT INTO players VALUES('derek', 'carr', 'AT', '1983-9-15','13', 4);
INSERT INTO players VALUES('smith', 'smith', 'NH', '1963-4-25','73', 5);
INSERT INTO players VALUES('george', 'bailey', 'CA', '1973-4-26','69', 6);
INSERT INTO players VALUES('mark', 'brad', 'CA', '1983-5-26','51', 7);
INSERT INTO players VALUES('shane', 'watson', 'NV', '1993-6-26','36', 8);
INSERT INTO players VALUES('brett', 'lee', 'CA', '1987-9-26','90', 9);
INSERT INTO players VALUES('adam', 'gilly', 'Fl', '1997-6-26','23', 10);

select * from players


create table coach(
c_id int not null primary key,
c_name varchar(20) not null);

insert into coach values('1','pollak');

insert into coach values('2','rick');

insert into coach values('3','jim');
insert into coach values('4','kim');
insert into coach values('5','jose');


select * from coach

create table team(
t_id int not null primary key,
teamname varchar(20) not null,
c_id   int not null FOREIGN  KEY (c_id) REFERENCES coach(c_id));

insert into team values('1','raiders','1');
insert into team values('2','seahawks','2');
insert into team values('3','chargers','3');
insert into team values('4','falcons','4');
insert into team values('5','patriots','5');


create table game(
game_id int not null primary key,
player_id   int not null FOREIGN  KEY (player_id) REFERENCES players(player_id),
t_id   int not null FOREIGN  KEY (t_id) REFERENCES team(t_id));

insert into game values('1','1','5');
insert into game values('2','2','4');
insert into game values('3','3','3');
insert into game values('4','4','2');
insert into game values('5','5','1');
insert into game values('6','6','1');
insert into game values('7','7','2');
insert into game values('8','8','3');
insert into game values('9','9','4');
insert into game values('10','10','5');


/*3)	Write a query to show last name and games played by a player whose last name starts with specific letter and contain atleast 4 letters.*/
select last_name, gamesplayed from players where last_name like 'p%___' 

/*4)	Write a query to display player details born after particular date and born in either of two states.*/
select * from players
where birthdate > '04-04-1991' and
(state = 'NH' or state = 'CA')

/*5)	Display firstname and lastname as fullname and state of players.*/

select   concat (first_name, last_name) as fullname, state  from players 

/*Write a query to display players who played minimum of 30 games and max of 60 games.*/
select last_name , gamesplayed from players
where gamesplayed between 30 and 60




/*7)	Write a query to display first name, team name, and birthdate of players who were born in April */

 select first_name, birthdate, teamname from game
 join team on team.t_id = game.game_id
 join players on players.Player_id = game.game_id
 where datename(month,birthdate) like 'A%'
  
 /*8)	Write a query to display youngest player and his team name.*/
 select top 1 min (birthdate) as young, first_name, teamname from game
  join team on team.t_id = game.t_id
 join players on players.Player_id = game.player_id
group by first_name ,birthdate, teamname
order by birthdate

/*9)	Write a query to display player first name who played more than 50 games with team name and coach name.*/
select players.first_name, team.teamname, coach.c_name, players.gamesplayed from game
  join players on players.Player_id = game.player_id
  join team  on team.t_id = game.t_id
  join coach on coach.c_id = team.c_id
  where gamesplayed > 50
  group by players.first_name, team.teamname,coach.c_name, gamesplayed

  /*10)	Write a query to display team name and sum of gamesplayed by all players playing for one specific team.*/

 select sum(gamesplayed) as total, team.teamname from game
   join team on team.t_id = game.t_id
 join players on players.Player_id = game.player_id
 where team.teamname = 'raiders'
 group by teamname

 	/* 11)use having clause to display average number of gamesplayed by all players for their respective  teams */

 select avg(gamesplayed) as avg, team.teamname from game
   join team on team.t_id = game.t_id
 join players on players.Player_id = game.player_id
 Group by team.teamname
 Having avg(gamesplayed) > 50

