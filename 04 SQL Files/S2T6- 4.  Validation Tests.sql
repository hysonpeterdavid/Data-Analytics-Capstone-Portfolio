# Validation Queries 
USE StreamFlixDB;
# Validation 01: Table Creation Check
SHOW TABLES;


# Validation 02: Check Foreign Keys
DESCRIBE Users;
DESCRIBE Movies;
DESCRIBE Ratings;


# Validation 03: Check Foreign Keys
SHOW CREATE TABLE Ratings;

# Validation 04: Count records loaded/imported
SELECT 'Users' AS TableName, COUNT(*) AS TotalRows FROM Users
UNION ALL
SELECT 'Movies', COUNT(*) FROM Movies
UNION ALL
SELECT 'Ratings', COUNT(*) FROM Ratings;

# Validation 05: Check orphan ratings
#Ratings must reference valid users.
SELECT *
FROM Ratings r
LEFT JOIN Users u
ON r.UserID = u.UserID
WHERE u.UserID IS NULL;

# Validation 06: Check orphan movies
#Ratings must reference valid movies.
SELECT *
FROM Ratings r
LEFT JOIN Movies m
ON r.MovieID = m.MovieID
WHERE m.MovieID IS NULL;

# Validation 07: Join All Three Tables
# This proves relationships work
SELECT
    r.RatingID,
    u.UserID,
    u.Country,
    m.Title,
    r.Rating
FROM Ratings r
JOIN Users u
ON r.UserID = u.UserID
JOIN Movies m
ON r.MovieID = m.MovieID
LIMIT 20;


# Validation 08: Foreign Key Rejection Test
INSERT INTO Ratings
(
RatingID,
UserID,
MovieID,
Rating,
Timestamp
)
VALUES
(
999999,
'INVALID_USER',
1,
4.5,
NOW()
);

# Validation 09: Valid Insert Test
INSERT INTO Ratings
	(
	RatingID,
	UserID,
	MovieID,
	Rating,
	Timestamp
	)
VALUES
	(
	999998,
	'SF_1',
	1,
	4.5,
	NOW()
	);
    
    
    # Validation 10: Verify Newly Inserted Record
SELECT
r.RatingID,
u.UserID,
m.Title,
r.Rating
FROM Ratings r
JOIN Users u
ON r.UserID=u.UserID
JOIN Movies m
ON r.MovieID=m.MovieID
WHERE r.RatingID=999998;


##DELETE TEST RECORDS

#Delete Only the Test Records
DELETE FROM Ratings
WHERE RatingID IN (999998, 999999);

#VERIFY AND DOUBLE check 
SELECT *
FROM Ratings
WHERE RatingID IN (999998, 999999);


