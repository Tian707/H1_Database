
-- INSERT values
INSERT INTO Directors
VALUES
(1, 'Steven', 'Spielberg', 1946),
(2, 'Rian', 'Johnson', 1973),
(3, 'Anthony', 'Russo', 1970),
(4, 'Joseph', 'Russo', 1971),
(5, 'Ridley', 'Scott', 1937);


INSERT INTO Actors
VALUES
(1, 'Laura', 'Dern', 56),
(2, 'Robert', 'Downey Jr.', 58),
(3, 'Scarlett', 'Johansson', 39),
(4, 'Chris', 'Evans', 42),
(5, 'Dee', 'Wallace', 74);

INSERT INTO Genres
VALUES
(1, 'sci-fi action'),
(2, 'sci-fi'),
(3, 'space opera'),
(4, 'drama and adventure'),
(5, 'drama'),
(6, 'action'),
(7, 'superhero');


INSERT INTO Movies
VALUES
(1, 'Jurassic Park', 127, 1, 1993),
(2, 'E.T.', 114, 2, 1982),
(3, 'Star Wars: The Last Jedi', 152, 3, 2017),
(4, 'Avengers: Infinity War', 149, 7, 2018),
(5, 'Thelma and Louise', 130, 4, 1991);


INSERT INTO Shows
VALUES
(1, 8, 1),
(2, 5, 2),
(3, 5, 3),
(4, 6, 4),
(5, 6, 5);



INSERT INTO Users
VALUES
(1, 'JohnDoe', 'john@example.com', '12445684'),
(2, 'JaneSmith', 'jane@example.com', '12445684'),
(3, 'MikeJohnson', 'mike@example.com', '12445684'),
(4, 'EmilyBrown', 'emily@example.com', '12445684'),
(5, 'DavidLee', 'david@example.com', '12445684');

INSERT INTO Cinemas
VALUES
(1, 'City Cinema', '123 Main St', 5),
(2, 'Luxury Theater', '456 Oak St', 3),
(3, 'Classic Cineplex', '789 Elm St', 4),
(4, 'Star Cinemas', '101 Maple Ave', 6),
(5, 'Mega Movieplex', '555 Pine Rd', 8);

INSERT INTO Halls
VALUES
(1, 50, 1, 1),
(2, 65, 2, 2),
(3, 55, 2, 1),
(4, 70, 5, 3),
(5, 110, 4, 4);

INSERT INTO Seats
VALUES
(1, 5),
(50, 2),
(41, 2),
(60, 4),
(105, 5);

INSERT INTO Tickets
VALUES
(6, 80, 1, 2, 1),
(7, 55, 2, 1, 50),
(8, 95.5, 3, 2, 41),
(9, 105, 5, 5, 60),
(10, 99, 3, 4, 105);



--Joint tables
INSERT INTO MoviesDirectors
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 4 ,3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO MoviesActors
VALUES
(1, 1, 1),
(2, 3, 1),
(3, 4, 2),
(4, 4, 3),
(5, 4, 4);

INSERT INTO ShowsHalls
VALUES
(1, 1, 5),
(2, 2,4 ),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1);

