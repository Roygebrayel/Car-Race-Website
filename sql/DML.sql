-- Active: 1671019824400@@127.0.0.1@3306@car_race

--@block
UPDATE racing_driver
SET fullName = 'roy'
where Rd >5;
--@block
UPDATE racing_driver
SET fullName = 'abbas'
WHERE RD=5;

--@block
UPDATE duration
SET End_Time = 203476
WHERE duration.Start_Time<203476;

--@block
INSERT INTO Racing_Driver (fullName,rk,email,phone,pass)
VALUES ('Abbas','10','abbashamyeh2004@gmail.com','78908353','NEWPASS');

--@block
Select VIN from Racing_Car As Car_Vin
where cartype = 'BMW';

--@block 
SELECT COUNT(VIN)
FROM Racing_Car
WHERE color='RED' OR cartype ='BMW';

--@block
SELECT VIN, RC ,(VIN + RC) AS RC_VIN
FROM Racing_Car
WHERE (VIN + RC)<10;


--@block
SELECT RD,RC FROM Racing_Car
INNER JOIN racing_driver
ON Racing_Car.RC = racing_driver.RD;


--@block

INSERT INTO  engineer(Eng) VALUES (9);
INSERT INTO assembler(Assem) VALUES (6);



INSERT INTO  mechanic (MechName,salary_Per_Hour) VALUES ('roy','20');


--@block
SELECT Start_Time,End_Time FROM duration 
INNER JOIN races
ON duration.Start_Time = races.Duration_Start_Time;

--@block
INSERT INTO car_manufacturar(Manu,Mname,Country) VALUE(9,'abbas','us');

SELECT COUNT(Manu), Country
FROM Car_Manufacturar
GROUP BY Country
HAVING COUNT(Manu)>1
ORDER BY Manu;

--@block
SELECT AVG(Manu), Country
FROM Car_Manufacturar
GROUP BY Country
ORDER BY AVG(Manu) DESC;


--@block

SELECT MIN(carpower) FROM racing_car
WHERE racing_car.carpower < 1600 AND racing_car.carpower>100
ORDER BY racing_car.carpower ASC;

--@block
SELECT MAX(carpower) FROM racing_car
WHERE racing_car.carpower < 1600 AND racing_car.carpower>100
ORDER BY racing_car.carpower DESC;


--@block

-- like idea (wildcard)

SELECT * FROM racing_driver
WHERE racing_driver.fullName LIKE 'a%';


--@block

-- distinct select
SELECT DISTINCT cartype FROM racing_car
WHERE carpower BETWEEN 300 AND 500;




--@block

-- union select

SELECT fullName FROM racing_driver
UNION ALL
SELECT VIN FROM racing_car;

--@block

-- switch case

SELECT RC,carpower,

CASE
    WHEN carpower< 500 THEN 'you go to the race 1'
    WHEN carpower > 500 THEN 'you participate in the  race 2'
    ELSE 'you wait'
END AS raceOrganization
FROM racing_car;

--@block

-- default insertion (2)

INSERT INTO race_court (Capacity) VALUES (20);








