--DB Creation:
DROP DATABASE COmunnity IF EXISTS;
CREATE DATABASE COmunnity;

DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Admins CASCADE;
DROP TABLE IF EXISTS Questions CASCADE;
DROP TABLE IF EXISTS Categories CASCADE;
DROP TABLE IF EXISTS Organizations CASCADE;
DROP TABLE IF EXISTS Dependents CASCADE;
DROP TABLE IF EXISTS Surveys CASCADE;
DROP TABLE IF EXISTS Events CASCADE;
DROP TABLE IF EXISTS Reviews CASCADE;
DROP TABLE IF EXISTS Favorites CASCADE;
DROP TABLE IF EXISTS Classifications CASCADE;

--Types:
-- Create fixed age range as ENUM
CREATE TYPE Age_Range AS ENUM ("0-18", "19-24", "25-34", "35-70", "70-+");

--Create fixed user types as ENUM
CREATE TYPE User_Type AS ENUM ('REG', 'ORG', 'ADMIN');

--Tables:
CREATE TABLE Users (
    username VARCHAR(15) PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    firstName VARCHAR(150) NOT NULL,
    ageRange VARCHAR(8) NOT NULL,
    hashedPasswd VARCHAR(80) NOT NULL,
    zipCode INTEGER
);

CREATE TABLE Admins(
    username VARCHAR(15) PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    firstName VARCHAR(150) NOT NULL,
    password_digest VARCHAR(80) NOT NULL
);

CREATE TABLE Questions(
    questionID SERIAL PRIMARY KEY,
    question VARCHAR(150) NOT NULL
);

CREATE TABLE Categories(
    abbv VARCHAR(5) PRIMARY KEY,
    cat_name VARCHAR(100) NOT NULL
);

CREATE TABLE Organizations (
    org_name VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    org_state VARCHAR(2) NOT NULL CHECK (org_state = 'CO'),
    zipcode INTEGER NOT NULL,
    email VARCHAR(255) PRIMARY KEY,
    phoneNumber VARCHAR(15),
    webLink VARCHAR(2050),
    servicesSummary TEXT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    avgStarValue DECIMAL(1, 1)
);

CREATE TABLE Dependents (
    dependentId SERIAL PRIMARY KEY,
    userID VARCHAR(15) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    ageRange VARCHAR(8) NOT NULL,
    FOREIGN KEY (userID) REFERENCES Users(username)
);

CREATE TABLE Surveys(
    surveyID SERIAL PRIMARY KEY,
    userID VARCHAR(15) NOT NULL,
    questionID INTEGER NOT NULL,
    answer VARCHAR(255),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(username),
    FOREIGN KEY (questionID) REFERENCES Questions(questionID)
);

CREATE TABLE Events(
    eventid SERIAL PRIMARY KEY,
    organizationID VARCHAR(255),
    userID VARCHAR(15),
    title VARCHAR(150) NOT NULL,
    eventDate DATE NOT NULL,
    eventTime TIME NOT NULL,
    eventDescription text NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    eventState VARCHAR(2) NOT NULL CHECK (eventState = 'CO'),
    zipcode INTEGER NOT NULL,
    isVirtual BOOLEAN NOT NULL,
    meetingLink VARCHAR(2050),
    eventstatus BOOLEAN NOT NULL,
    adminID VARCHAR(15),
    FOREIGN KEY (organizationID) REFERENCES Organizations(email),
    FOREIGN KEY (userID) REFERENCES Users(username),
    FOREIGN KEY (adminID) REFERENCES Admins(username)
);

CREATE TABLE Reviews(
    reviewID SERIAL PRIMARY KEY,
    organizationID VARCHAR(255),
    userID VARCHAR(15),
    title VARCHAR(150),
    comment TEXT,
    starValue DECIMAL(1, 1) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    adminID VARCHAR(15),
    reviewStatus BOOLEAN NOT NULL,
    FOREIGN KEY (organizationID) REFERENCES Organizations(email),
    FOREIGN KEY (userID) REFERENCES Users(username),
    FOREIGN KEY (adminID) REFERENCES Admins(username)
);

--Relation Tables:
CREATE TABLE Favorites(
    favoriteID SERIAL PRIMARY KEY,
    userID VARCHAR(15) NOT NULL,
    organizationID VARCHAR(255) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(username),
    FOREIGN KEY (organizationID) REFERENCES Organizations(email)
);

CREATE TABLE Classifications(
    associationID SERIAL PRIMARY KEY,
    organizationID VARCHAR(255) NOT NULL,
    categoryabbr VARCHAR(5) NOT NULL,
    FOREIGN KEY (organizationID) REFERENCES Organizations(email),
    FOREIGN KEY (categoryabbr) REFERENCES Categories(abbv)
);

--Triggers
-- This is a function to update the updateAt field when a change occurs to Organization table
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updatedAt = NOW();
   RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger for changes to any row of the Organization table
CREATE TRIGGER update_organization_updated_at BEFORE UPDATE
ON Organizations FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();