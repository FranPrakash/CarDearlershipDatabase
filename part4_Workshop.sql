-- Step 4
-- 1. Get all dealerships
SELECT *
FROM dealerships;

-- 2 
-- Find all vehicles for a specific dealership 
-- Getting all vehicles from vehicles in inventory from Pink Car dealership 
SELECT V.* -- vehicles table 
FROM cardealership.vehicles V
INNER JOIN cardealership.inventory I ON V.vin = I.vin -- Matching with Vin 
INNER JOIN cardealership.dealerships D ON I.dealership_id = D.dealership_id -- Matching with ID 
AND D.name = 'Pink Car';

-- 3 Fin a Car by Vin
SELECT *
FROM vehicles 
WHERE vin = '1HGCM82633A123456';

-- 4 Find the dealership where a certain car is located by VIN 
-- Getting infomation about dealership and inventory 
SELECT D.name
FROM dealerships D -- Name column 
INNER JOIN inventory I ON D.dealership_id = I.dealership_id -- Matching dealership_ID
WHERE I.vin = '3GNFK16318G269795'; -- Vin 

-- 5 Find all Dealership that have a certain car type 
-- Joining dealership, inventory and vehicles 
SELECT D.name
FROM dealerships D -- Name column
INNER JOIN inventory I ON D.dealership_id = I.dealership_id -- Joining dealership with inventory 
INNER JOIN vehicles V ON I.vin = V.vin
WHERE V.make='Honda' AND V.model = 'Civic'; -- filter result 

-- 6 Get all sales information for a specific dealer for a specific date range 
SELECT SC.*
FROM sales_contracts SC
INNER JOIN inventory I ON I.vin = SC.vin
INNER JOIN dealerships D ON I.dealership_ID = D.dealership_ID
WHERE name = 'Pink Car' 
AND sales_date BETWEEN "2020-01-01" AND "2021-12-01";