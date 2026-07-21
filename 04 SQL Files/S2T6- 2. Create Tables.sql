USE StreamFlixDB;

/*
#CREATE users TABLE >>> Remove masking, if creating table for 1st time
CREATE TABLE Users (
	UserID VARCHAR(20) PRIMARY KEY,
	Age INT,
	Gender VARCHAR(20),
	Country VARCHAR(100),
	SubscriptionStatus VARCHAR(50),
	TotalWatchTime INT, 
	Device VARCHAR(30)
);
*/


  /*
  
 #CREATE movies TABLE >>> Remove masking, if creating table for 1st time
 CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    Year INT,
    Genres VARCHAR(255),
    Language VARCHAR(100),
    Country VARCHAR(100),
    TotalViews INT
);
 */
 
 /*
  #CREATE ratings TABLE >>> Remove masking, if creating table for 1st time
 CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY,
    UserID VARCHAR(20),
    MovieID INT,
    Rating DECIMAL(2,1),
    Timestamp DATETIME,

    FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    FOREIGN KEY (MovieID)
        REFERENCES Movies(MovieID)
);
*/

SHOW tables; #View all tables inside the selected database
DESCRIBE users; #See the structure of a table
DESCRIBE movies; #See the structure of a table
DESCRIBE ratings; #See the structure of a table

#SHOW COLUMNS FROM users; #See the structure of a table (other way)