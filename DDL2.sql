-- Active: 1669894427276@@127.0.0.1@3306@carrace
CREATE TABLE Races (
    R INTEGER AUTO_INCREMENT UNIQUE,
    Country VARCHAR(3),
    Duration_Start_Time INTEGER,
    Duration_End_time INTEGER,
    PRIMARY KEY (R)

);

CREATE TABLE Race_court (
    Rc INTEGER AUTO_INCREMENT UNIQUE,
    Distance INTEGER,
    capacity INTEGER,
    PRIMARY KEY (Rc)
);

CREATE TABLE Duration (
    Start_Time INTEGER,
    End_Time INTEGER,
    PRIMARY KEY (Start_Time,End_Time)
);

-- altering the table race to have two PF columns

ALTER TABLE Races
ADD FOREIGN key (Duration_Start_Time,Duration_End_time) REFERENCES Duration (Start_Time,End_Time);

--altering the race table to add a new race court rc column

ALTER TABLE Races
ADD Race_Court_RC INTEGER;

--altering the race table to add a new foreign key in the race court rc column


ALTER Table Races
ADD FOREIGN KEY (Race_Court_RC) REFERENCES Race_court (Rc);

--creating the registration table

CREATE TABLE Registration (
    R INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    email VARCHAR (255) AUTO_INCREMENT UNIQUE NOT NULL,
    RegName VARCHAR (255),
    PRIMARY KEY Registration_PK(R,email)

);

--altering the table registration and adding the column Races_R

ALTER TABLE Registration
ADD Races_R INTEGER;

--Altering the table registration and adding a foreign key into the Races_R column

ALTER TABLE Registration
ADD FOREIGN KEY (Races_R) REFERENCES Races(R);

--Altering the table registration and adding the Races_Duration_Start_Time column

Alter Table Registration 
ADD Races_Duration_Start_Time INTEGER;

--Altering the table registration and adding the Races_Duration_End_time column

Alter Table Registration 
ADD Races_Duration_End_time INTEGER;

--Altering the table registration and adding a composite foreign key 


ALTER TABLE Registration
ADD FOREIGN KEY (Races_Duration_Start_Time,Races_Duration_End_time) REFERENCES Races(Duration_Start_Time,Duration_End_time);

--creating the Period_Table
create table Period_Table(
    Period_ID INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Period_Date VARCHAR(255),
    PRIMARY KEY (Period_ID)

);

--Creating the participate table (the mokhtar one)



CREATE TABLE Participate(
    Racing_driver_RD INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Races_R INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Period_Period INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Races_Duration_Start_Time INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Races_Duration_End_time INTEGER AUTO_INCREMENT UNIQUE NOT NULL,

    PRIMARY KEY (Racing_driver_RD ,
    Races_R ,
    Period_Period ,
    Races_Duration_Start_Time ,
    Races_Duration_End_time
    )

);

-- adding the Participate_Races_FK from the PK in Races

ALTER TABLE Participate
ADD Participate_Races_FK INTEGER;


ALTER TABLE Participate
 ADD FOREIGN KEY (Participate_Races_FK) REFERENCES Races(R);


--adding the Participate_Racing_driver_FK of the pk in the racing driver table
 ALTER TABLE Participate
ADD Participate_Racing_driver_FK INTEGER;


ALTER TABLE Participate
 ADD FOREIGN KEY (Participate_Racing_driver_FK) REFERENCES Racing_driver(RD);

 --adding the Participate_Period_FK of the pk in the racing driver table

 ALTER TABLE Participate
ADD Participate_Period_FK INTEGER;


ALTER TABLE Participate
 ADD FOREIGN KEY (Participate_Period_FK) REFERENCES Period_Table(Period_ID);

 --creating the Race_Manager table

 CREATE table Race_Manager(
    Mgmt INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Manager_Name INTEGER,
    PRIMARY KEY (Mgmt)
 );

 --creating the Tv_Broadcaster table

 CREATE TABLE Tv_Broadcaster(
    TV_ID INTEGER NOT NULL UNIQUE AUTO_INCREMENT,
    TV_Network VARCHAR(255),

    PRIMARY key (TV_ID)

 );

 --create the Organization TABLE
 create Table organization(
    Races_R INTEGER,
    Race_Manager_Mgmt INTEGER,
    Tv_Broadcaster_TV INTEGER,
    Races_Duration_Start_Time INTEGER,
    Races_Duration_End_time INTEGER,
 );



