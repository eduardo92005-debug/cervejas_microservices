use beer_api;


CREATE TABLE BestTemperatureBeers (
  id_best_beer_temperature INT AUTO_INCREMENT PRIMARY KEY,
  style_beer VARCHAR(30) NULL,
  min_best_temperature INT NULL,
  max_best_temperature INT NULL,
  created_at DATETIME NULL,
  updated_at DATE NULL,
  UNIQUE (id_best_beer_temperature)
);

CREATE TABLE Beers (
  id_beer INT AUTO_INCREMENT PRIMARY KEY,
  style_beer VARCHAR(30) NULL,
  id_best_beer_temperature INT NULL,
  created_at DATETIME NULL,
  updated_at DATE NULL,
  FOREIGN KEY (id_best_beer_temperature) REFERENCES BestTemperatureBeers (id_best_beer_temperature) ON DELETE CASCADE,
  UNIQUE (id_beer)
);

INSERT INTO BestTemperatureBeers (id_best_beer_temperature, style_beer, min_best_temperature, max_best_temperature)
VALUES (1, 'IPA', -7, 10),
       (2, 'Stout', -10, 13),
       (3, 'Pilsner', -2, 4),
       (4, 'Wheat beer', 4, 6),
       (5, 'Pale Ale', -6, 7)
       (6, 'Avendave Ale', -6, 7);


INSERT INTO Beers (style_beer, id_best_beer_temperature, created_at, updated_at)
VALUES ('IPA', 1, CURRENT_TIMESTAMP, CURDATE()),
       ('Stout', 2, CURRENT_TIMESTAMP, CURDATE()),
       ('Pilsner', 3, CURRENT_TIMESTAMP, CURDATE()),
       ('Wheat beer', 4, CURRENT_TIMESTAMP, CURDATE()),
       ('Pale Ale', 5, CURRENT_TIMESTAMP, CURDATE())
       ('Avendave Ale', 6, CURRENT_TIMESTAMP, CURDATE());


CREATE VIEW avg_temp_beers AS
SELECT * FROM (SELECT *, (sum(min_best_temperature+max_best_temperature))/2 AS average
from BestTemperatureBeers btb group by id_best_beer_temperature) t order by style_beer desc;
