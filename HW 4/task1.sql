
CREATE DATABASE IF NOT EXISTS pet_database;
USE pet_database;

CREATE TABLE petPet (
    petname VARCHAR(20) PRIMARY KEY,
    owner VARCHAR(45),
    species ENUM('M', 'F'),
    gender CHAR(1),
    birth DATE,
    death DATE
);


CREATE TABLE petEvent (
    petname VARCHAR(20),
    eventdate DATE,
    eventtype VARCHAR(15),
    remark VARCHAR(255),
    PRIMARY KEY (petname, eventdate),
    FOREIGN KEY (petname) REFERENCES petPet(petname)
);
