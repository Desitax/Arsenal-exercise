CREATE DATABASE FORMULA1

CREATE TABLE Teams(
team_id INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(255),
country VARCHAR(255),
foundation_year INT
);

CREATE TABLE Drivers(
driver_id INT PRIMARY KEY IDENTITY(1,1),
first_name VARCHAR(100),
last_name VARCHAR(100),
team_id INT FOREIGN KEY REFERENCES Teams(team_id)
);

CREATE TABLE Races(
race_id INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(255),
lication VARCHAR(255),
race_date DATE,
season_year INT
);

CREATE TABLE Races_Results(
result_id INT PRIMARY KEY IDENTITY(1,1),
race_id INT FOREIGN KEY REFERENCES Races(race_id),
driver_id INT FOREIGN KEY REFERENCES Drivers(driver_id),
position INT,
points DECIMAL(5,2),
laps INT,
time TIME
)

