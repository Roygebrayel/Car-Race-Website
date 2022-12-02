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

ALTER TABLE Racing_Driver 
ADD Racing_Team_RT INTEGER;

ALTER TABLE Racing_Driver 
ADD FOREIGN KEY (Racing_Team_RT) REFERENCES Racing_Team(RT);




CREATE TABLE Racing_Car(
    RC INTEGER AUTO_INCREMENT NOT NULL,
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
    Manu Integer UNIQUE AUTO_INCREMENT NOT NULL ,
    Mname VARCHAR(255) NOT NULL ,
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

CREATE Table mechanic (
    Mech INTEGER AUTO_INCREMENT UNIQUE NOT NULL,
    MechName VARCHAR (255),
    salary_Per_Hour INTEGER,
    PRIMARY KEY (Mech) 

);

ALTER TABLE mechanic 
ADD Racing_Team_RT INTEGER;

ALTER TABLE mechanic
ADD FOREIGN KEY (Racing_Team_RT) REFERENCES Racing_Team(RT);

CREATE TABLE Engineer(
    
    Eng INTEGER AUTO_INCREMENT NOT NULL UNIQUE COMMENT "TEST",
    PRIMARY KEY (Eng)
);











