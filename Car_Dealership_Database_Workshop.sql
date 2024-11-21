# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          Car Dealership Database                             
# ---------------------------------------------------------------------- #

#-- Step 1 Create the database
DROP DATABASE IF EXISTS carDealership;
CREATE DATABASE IF NOT EXISTS carDealership;
USE carDealership;

#-- Step 2
-- Table 1: dealerships 
CREATE TABLE dealerships (
    dealership_ID INTEGER NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL, -- not accept null values 
    Address VARCHAR(50),
    Phone VARCHAR(12),
    PRIMARY KEY (dealership_id) -- primary key is a unique identification for records in the table 
);

-- Table 2: vehicles
CREATE TABLE vehicles (
    vin VARCHAR(17) NOT NULL,    -- VIN number is always 17 characters long
	make VARCHAR(50),
    model VARCHAR(50),
    mileage INTEGER,
    model_year INTEGER,
	PRIMARY KEY (vin)
    );
    
    -- Table 3: Inventory 
    CREATE TABLE Inventory (
     dealership_id INTEGER NOT NULL,
     vin VARCHAR(17) NOT NULL
);

-- Table 4: Sales_contracts 
CREATE TABLE sales_contracts (
    sales_contract_id INTEGER NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(100),
    vin VARCHAR(17) NOT NULL,
    PRIMARY KEY (sales_contract_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);
-- Table 5: lease_contracts
CREATE TABLE lease_contracts (
    lease_contract_id INTEGER NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(100),
    vin VARCHAR(17) NOT NULL,
    PRIMARY KEY (lease_contract_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Step 3
-- Populate dealership table with sample data
-- Don't need to provide dealership_id because it is set to auto increment. 
INSERT INTO dealerships (name,address,phone) VALUES ("Auto Sales","789 Pine Street, Sunnyvale, TX 54321", "510517-6765");
INSERT INTO dealerships (name,address,phone) VALUES ("Pink Car","101 Cedar Road, Brooktown, FL 98765","510517-6655"); 
INSERT INTO dealerships (name,address,phone) VALUES ("NextGen Motors","123 Maple Drive, River City, NY 12345","510518-6662");
INSERT INTO dealerships (name,address,phone) VALUES ("Driveway Motors","456 Oak Lane, Greenfield, CA 67890","510518-6662");

-- Populate vehicles table with sample data
INSERT INTO vehicles (vin, make, model, mileage, model_year) VALUES ("3GNFK16318G269795", "Honda","Civic", 10000, 2020);
INSERT INTO vehicles (vin, make, model, mileage, model_year) VALUES ("1HGCM82633A123456", "Toyota", "Corolla", 12000, 2019);
INSERT INTO vehicles (vin, make, model, mileage, model_year) VALUES ("2T2BZMCA6KC123456", "Ford", "Focus", 9500, 2021);
INSERT INTO vehicles (vin, make, model, mileage, model_year) VALUES ("3VWFE21C04M123456", "Chevrolet", "Malibu", 11000, 2022);

-- Populate inventory table with sample data
INSERT INTO inventory (Dealership_id, vin) VALUES(1,"3GNFK16318G269795");
INSERT INTO inventory (Dealership_id, vin) VALUES(2,"1HGCM82633A123456");
INSERT INTO inventory (Dealership_id, vin) VALUES(3,"2T2BZMCA6KC123456");
INSERT INTO inventory (Dealership_id, vin) VALUES(4,"3VWFE21C04M123456");

-- Populate sales_contracts table with sample data
INSERT INTO sales_contracts (customer_name, vin) VALUES ('Fran Santos','3GNFK16318G269795');
INSERT INTO sales_contracts (customer_name, vin) VALUES ('Elon Musk','1HGCM82633A123456');

-- Populate lease_contracts 
INSERT INTO lease_contracts (customer_name, vin) VALUES ('Taylor Swift','2T2BZMCA6KC123456');
INSERT INTO lease_contracts (customer_name, vin) VALUES ('Neymar Junior','3VWFE21C04M123456');
    