USE StreamFlixDB;

#IMPORT CSV FILE- user_cleaned.csv
/*
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/user_cleaned.csv'
INTO TABLE Users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
*/


#IMPORT CSV FILE- movies_refined.csv
/*
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies_refined.csv'
INTO TABLE Movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
*/

#IMPORT CSV FILE- ratings_cleaned.csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ratings_cleaned.csv'
INTO TABLE Ratings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
 RatingID,
 UserID,
 MovieID,
 Rating,
 @Timestamp
)
SET Timestamp =
STR_TO_DATE(@Timestamp,'%d/%m/%Y %H:%i');

