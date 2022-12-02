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

ALTER TABLE Racing_Car
ADD car_manufacturar_Mname INTEGER;


-- bug problem

 ALTER TABLE Racing_Car
ADD FOREIGN KEY (car_manufacturar_Mname) REFERENCES Car_Manufacturar(Mname);

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

CREATE TABLE Engineer(
    
    Eng INTEGER AUTO_INCREMENT NOT NULL UNIQUE COMMENT "TEST",
    PRIMARY KEY (Eng)
);

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

ALTER TABLE Engine 
ADD FOREIGN key (car_manufacturar_Mname) REFERENCES Car_Manufacturar(Mname);


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
Mechanic_Mech Integer,
PRIMARY KEY (Racing_Driver_Rd,Racing_Car_RC,Mechanic_Mech)
);
--adding foreign keys Adjust table
ALTER TABLE Adjust
Add FOREIGN KEY (Racing_Driver_Rd) REFERENCES Racing_Driver(RD);

ALTER TABLE Adjust
Add FOREIGN KEY (Racing_Car_RC) REFERENCES Racing_Car(RC);

ALTER TABLE Adjust
Add FOREIGN KEY (Mechanic_Mech) REFERENCES Mechanic(Mech);


