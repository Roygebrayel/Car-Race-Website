-- Active: 1669894427276@@127.0.0.1@3306@carrace



CREATE table Racing_Driver ( 
    RD  INTEGER NOT NULL AUTO_INCREMENT, 
    FN VARCHAR (255),
    rk Integer,
    PRIMARY KEY (RD)

    


);


CREATE TABLE Racing_Team (
    RT INTEGER  NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255 ),
    Number_Of_Members INTEGER,
    PRIMARY KEY (RT)
);

CREATE TABLE RacingCar (
    RC INTEGER AUTO_INCREMENT NOT NULL,
    power INTEGER,
    color VARCHAR (255),
    PRIMARY KEY (RC)
    
);