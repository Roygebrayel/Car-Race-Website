-- Active: 1670246167553@@127.0.0.1@3306@carrace

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
