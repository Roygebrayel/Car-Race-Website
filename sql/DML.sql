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
INSERT INTO Racing_Driver (fullName,rk,email,phone,pass)
VALUES ('Abbas','10','abbashamyeh2004@gmail.com','78908353','NEWPASS');

--@block
Select VIN from Racing_Car As Car_Vin
where cartype = 'ih';

--@block 
SELECT COUNT(VIN)
FROM Racing_Car
WHERE color='RED' OR cartype ='ih';

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
INSERT INTO car_manufacturar(Manu,Mname,Country) VALUE(7,'roy','us');

SELECT COUNT(Manu), Country
FROM Car_Manufacturar
GROUP BY Country
ORDER BY Manu;

--@block
SELECT AVG(Manu), Country
FROM Car_Manufacturar
GROUP BY Country
ORDER BY AVG(Manu) DESC;


--@block

SELECT MIN(carpower) FROM racing_car
WHERE racing_car.carpower < 1600 AND racing_car.carpower>100;

--@block
SELECT MAX(carpower) FROM racing_car
WHERE racing_car.carpower < 1600 AND racing_car.carpower>100;


--@block

SELECT * FROM racing_driver
WHERE racing_driver.fullName LIKE 'a%';



