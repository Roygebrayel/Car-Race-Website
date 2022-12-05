-- Active: 1669894427276@@127.0.0.1@3306@carrace



CREATE table Racing_Driver ( 
    RD  INTEGER AUTO_INCREMENT, 
    FN VARCHAR (255),
    rk Integer,
    PRIMARY KEY (RD)
    
);



CREATE TABLE Racing_Team (
    RT INTEGER   AUTO_INCREMENT,
    NAME VARCHAR(255 ),
    Number_Of_Members INTEGER,
    PRIMARY KEY (RT)
);

ALTER TABLE Racing_Driver 
ADD Racing_Team_RT INTEGER;

ALTER TABLE Racing_Driver 
ADD FOREIGN KEY (Racing_Team_RT) REFERENCES Racing_Team(RT);




CREATE TABLE Racing_Car(
    RC INTEGER AUTO_INCREMENT ,
    power INTEGER,
    color VARCHAR (255),
    PRIMARY KEY (RC)
    
);
ALTER TABLE Racing_Car 
ADD Racing_Team_RT INTEGER;

ALTER TABLE Racing_Car 
ADD FOREIGN KEY(Racing_Team_RT) REFERENCES Racing_Team(RT);

ALTER TABLE Racing_Driver
ADD Racing_Car_RC INTEGER NOT NULL;

ALTER TABLE Racing_Driver
ADD FOREIGN KEY (Racing_Car_RC) REFERENCES Racing_Car(RC);
 -- no errors till this line
CREATE TABLE Car_Manufacturar(
    Manu Integer  ,
    Mname VARCHAR(255)  ,
    Country VARCHAR(3) ,
    PRIMARY KEY (Manu,Mname)
  );


  ALTER TABLE Racing_Car 
ADD car_manufacturar_Manu INTEGER;

 ALTER TABLE Racing_Car
ADD FOREIGN KEY (car_manufacturar_Manu) REFERENCES Car_Manufacturar(Manu);

CREATE Table Mechanic (
    Mech INTEGER AUTO_INCREMENT ,
    MechName VARCHAR (255),
    salary_Per_Hour INTEGER,
    PRIMARY KEY (Mech) 

);

ALTER TABLE Mechanic 
ADD Racing_Team_RT INTEGER;

ALTER TABLE Mechanic
ADD FOREIGN KEY (Racing_Team_RT) REFERENCES Racing_Team(RT);


-- no error till this line
-- create Assembler table
create table Assembler (
Assem Integer PRIMARY key,
Mechanic_Mech Integer
);
--adding foreign key to Assembler table
ALTER table Assembler
Add FOREIGN key (Mechanic_Mech) REFERENCES Mechanic(Mech);

--create chassis Assembler table
CREATE TABLE Chassis_Assembler(
Chass Integer PRIMARY KEY,
Assembler_Assem Integer
);
--adding foreign key to Assembler table
ALTER TABLE Chassis_Assembler
Add FOREIGN key (Assembler_Assem) REFERENCES Assembler(Assem);

--create Wheel Assembler table
CREATE TABLE Wheel_Assembler(
Wheel Integer PRIMARY KEY,
Assembler_Assem Integer
);

--adding foreign key to Wheel_Assembler table
ALTER TABLE Wheel_Assembler
Add FOREIGN key (Assembler_Assem) REFERENCES Assembler(Assem);

--create Break Assembler table
CREATE TABLE Break_Assembler(
ABreak Integer PRIMARY KEY,
Assembler_Assem Integer
);

--adding foreign key to Chassis_Assembler table
ALTER TABLE Break_Assembler
Add FOREIGN key (Assembler_Assem) REFERENCES Assembler(Assem);

--create Engineer table
CREATE TABLE Engineer (
Eng INTEGER PRIMARY KEY,
Mechanic_Mech INTEGER
);
--adding foreign key to Engineer table
ALTER TABLE Engineer 
Add FOREIGN key(Mechanic_Mech) REFERENCES Mechanic(Mech);

--create Gear_Specialist table
CREATE TABLE Gear_Specialist(
Gear INTEGER PRIMARY KEY,
Engineer_Eng Integer
);

--adding foreign key to Gear_Specialist table
ALTER TABLE Gear_Specialist
ADD FOREIGN KEY(Engineer_Eng) REFERENCES Engineer(Eng);

--create Electronic table
CREATE TABLE Electronic (
Elec INTEGER PRIMARY KEY,
Engineer_Eng Integer
);

--adding foreign key to Electronic table
ALTER TABLE Electronic 
ADD FOREIGN KEY(Engineer_Eng) REFERENCES Engineer(Eng);

CREATE TABLE Engine (
Engine_Specialist INTEGER PRIMARY KEY,
Engineer_Eng Integer,
car_manufacturar_Manu INTEGER,
car_manufacturar_Mname VARCHAR(255)
);

--adding foreign keys to Engine table
ALTER TABLE Engine
ADD FOREIGN KEY(Engineer_Eng) REFERENCES Engineer(Eng);

ALTER table Engine 
ADD FOREIGN KEY (car_manufacturar_Manu) REFERENCES Car_Manufacturar(Manu);
-- no error till this line
--create Car_Tuners table
CREATE TABLE Car_Tuners(
Tun INTEGER PRIMARY key
);

--create Modify table
CREATE TABLE Modify(
Car_Tuners_Tun INTEGER,
Racing_Car_RC Integer,
PRIMARY key (Car_Tuners_Tun,Racing_Car_RC)
);

--adding foreign keys to Modify table
ALTER TABLE Modify 
Add FOREIGN key (Car_Tuners_Tun) REFERENCES Car_Tuners(Tun);

ALTER TABLE Modify
Add FOREIGN KEY (Racing_Car_RC) REFERENCES Racing_Car (RC);

--create adjust table
CREATE TABLE Adjust(
Racing_Driver_Rd INTEGER,
Racing_Car_RC INTEGER,
Mechanic_Mech Integer

);
-- method to add all primary keys in one key 
ALTER TABLE Adjust
 ADD CONSTRAINT Adjust_pk PRIMARY KEY (Racing_Driver_Rd,
Racing_Car_RC,
Mechanic_Mech );

--adding foreign keys Adjust table
ALTER TABLE Adjust
Add FOREIGN KEY (Racing_Driver_Rd) REFERENCES Racing_Driver(RD);

ALTER TABLE Adjust
Add FOREIGN KEY (Racing_Car_RC) REFERENCES Racing_Car(RC);

ALTER TABLE Adjust
Add FOREIGN KEY (Mechanic_Mech) REFERENCES Mechanic(Mech);
-- no errors till this line

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
    Start_Time INTEGER NOT NULL,
    End_Time INTEGER NOT NULL,
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
    email VARCHAR (255),
    RegName VARCHAR (255),
    PRIMARY KEY (R,email)

);
-- no error till this line
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
-- no error till this line
--creating the Period_Table
create table Period_Table(
    Period_ID INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Period_Date VARCHAR(255),
    PRIMARY KEY (Period_ID)

);

--Creating the participate table (the mokhtar one)



CREATE TABLE Participate(
    Racing_driver_RD INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    Races_R INTEGER ,
    Period_Period INTEGER  ,
    Races_Duration_Start_Time INTEGER ,
    Races_Duration_End_time INTEGER,

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
    Races_R INTEGER NOT NULL,
    Race_Manager_Mgmt INTEGER NOT NULL,
    Tv_Broadcaster_TV INTEGER NOT NULL,
    Races_Duration_Start_Time INTEGER not NULL,
    Races_Duration_End_time INTEGER not null,

    Primary KEY (Races_R,
    Race_Manager_Mgmt,
    Tv_Broadcaster_TV ,
    Races_Duration_Start_Time,
    Races_Duration_End_time)
 );
-- no error till this line


--altering the table organization and adding organization_Races_FK
ALTER TABLE organization 
    ADD organization_Races_FK INTEGER;

    ALTER TABLE organization
 ADD FOREIGN KEY (organization_Races_FK) REFERENCES Races(R);

 --altering the table organization and adding organization_Tv_Broadcaster_FK 

 ALTER TABLE organization 
    ADD organization_Tv_Broadcaster_FK INTEGER;

 ALTER TABLE organization
 ADD FOREIGN KEY (organization_Tv_Broadcaster_FK) REFERENCES Tv_Broadcaster(TV_ID);

 --altering the table organization and adding organization_Race_Manager_FK


 ALTER TABLE organization 
    ADD organization_Race_Manager_FK INTEGER;

     ALTER TABLE organization
 ADD FOREIGN KEY (organization_Race_Manager_FK) REFERENCES Race_Manager(Mgmt);


create table Manager(
Mng Integer,
NAME VARCHAR(255), 
Racing_Team_RT Integer,
Primary key (Mng),
FOREIGN key (Racing_Team_RT) REFERENCES Racing_Team (RT)
);

CREATE TABLE Repair(
Mechanic_Mech Integer,
Racing_Car_RC Integer,
primary key (Mechanic_Mech,Racing_Car_RC)
);

ALTER TABLE Repair
Add FOREIGN key(Mechanic_Mech) REFERENCES Mechanic(Mech);

ALTER TABLE Repair
ADD FOREIGN key (Racing_Car_RC) REFERENCES Racing_Car(Rc);
 -- no errors