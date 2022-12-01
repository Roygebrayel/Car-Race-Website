-- Active: 1669894427276@@127.0.0.1@3306@carrace

CREATE TABLE RacingCar (
    RC INTEGER AUTO_INCREMENT NOT NULL,
    power INTEGER,
    color VARCHAR (255),
    PRIMARY KEY (RC)
    
);

CREATE TABLE Racing_Driver(
    RD INTEger NOT NULL AUTO_INCREMENT,
    FN varchar(255),
    Rank integer,
     PRIMARY KEY (RD)
);
CREATE TABLE Racing_Team (
    RT INTEGER  NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255 ),
    Number_Of_Members INTEGER,
    PRIMARY KEY (RT)
);

