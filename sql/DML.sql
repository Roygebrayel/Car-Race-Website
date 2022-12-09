-- Active: 1670246167553@@127.0.0.1@3306@carrace

--@block
UPDATE racing_driver
SET fullName = 'roy'
where Rd >5;
--@block
UPDATE racing_driver
SET fullName = 'roy'
WHERE RD=5;

--@block
INSERT INTO Racing_Driver (fullName,rk,email,phone,pass)
VALUES ('Abbas','10','abbashamyeh2004@gmail.com','78908353','NEWPASS');

--@block
Select VIN from Racing_Car As Car_Vin
where cartype = 'BMW';

--@block 
SELECT COUNT(VIN)
FROM Racing_Car
WHERE color='RED' and cartype ='AUDI';

--@block
SELECT VIN, RC ,(VIN + RC) AS RC_VIN
FROM Racing_Car
WHERE (VIN + RC)<10;
