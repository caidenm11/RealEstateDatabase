/*use red_gorillas;
SELECT DHI.NAME DependentsName, C.FirstName RentersFirstName, C.LastName RentersLastName
FROM dependent_hasinfo DHI,
     consumer C,
FULL JOIN  DHI;*/
-- NATURAL JOINS DO NOT WORK IN SQL SERVER.
/*Join 1 */
/*This will find and join the tables of the tables that have a type and a price*/
SELECT P.PRICE PropertyPrice, PT.PropertyType PropertyType
FROM PROPERTY P,
     property_has_propertytype PT
         NATURAL JOIN property;
-- THIS DOES NOT WORK IN SERVER
/*UPDATE QUERY*/
UPDATE realtycompany
SET PhoneNumber = '6666556655'
WHERE realtycompany.CompanyName = 'Bobs Overpriced Homes';

/*DELETE QUERY*/
/*THIS WILL DELETE DEPENDENT 2
  FROM THE renter has dependent table,
  can be used if dependent dies*/
/*DEPENDENT INFO*/
INSERT INTO dependent_hasinfo
VALUES (2, 'John F. Kennedy', 'Male', '1933-07-06');


/*RENTER DEPENDENT*/
INSERT INTO renter_has_dependent
VALUES (1, 2, 'Son');


DELETE Renter_has_Dependent, DEPENDENT_HASINFO
FROM renter_has_dependent RHD,
     dependent_hasinfo D
WHERE rhd.DependentID = 2;
-- THIS SHOWS A SYNTAX ERROR IN MS SQL
/*AGGREGATE FUNCTIONS*/
SELECT AVG(p.Price)
FROM property P;
-- number 5
/*NESTED QUERIES*/
/*THIS WILL FIND ALL OF THE PRICES, AND PROPERTY DESCRIPTIONS WHERE THE FEES ARE LESS THAN AVERAGE,
  SHOULD RESULT WITH HOUSE, 55,000 AND 3BDRM 5 CAR GARAGE*/
SELECT P.PRICE, P.DESCRIPTION, PT.PropertyType
FROM property P,
     property_has_propertytype PT
WHERE P.PROPERTYID = PT.PROPERTYID
  AND PT.PropertyFees < (SELECT AVG(PropertyFees) FROM property_has_propertytype);

/*USING A VIEW*/
/*THIS WILL COMBINE THE CONSUMERS FIRST AND LAST NAME INTO A VIEW*/
CREATE VIEW ConsumerFullName
AS
SELECT CONCAT(C.FirstName, ' ', C.LastName) AS "Consumer's Full Name"
FROM CONSUMER C;
-- NUMBER 6
/*UPDATES EVERYONE WITH THE SAME LAST NAME TO A CERTAIN POSITION*/

UPDATE consumer
SET OCCUPATION = 'Engineer'
WHERE CONSUMER.LASTNAME = 'Jacobs';
-- NUMBER 7

/*ADDS 1 YEAR OF EXPERIENCE FOR THE REALTORS*/
UPDATE realtor_works_for_realtycompany
SET YearsOfExperience= YearsOfExperience + 1;
-- NUMBER 8


UPDATE realtor
SET EmailAddress= 'email@email.com'
WHERE LicenseNumber = 1;
-- NUMBER 9

UPDATE realtor
SET LastName = 'Johnson'
WHERE LicenseNumber = 1;
-- number 10

SELECT MAX(YearsOfExperience) AS "MOST YEARS WORKED"
FROM realtor_works_for_realtycompany,
     realtycompany
WHERE realtycompany.CompanyName = 'Bobs Overpriced Homes'
GROUP BY YearsOfExperience;
-- NUMBER 11
SELECT COUNT(Relationship) AS "Number of Sons"
FROM renter_has_dependent RHD
WHERE RHD.Relationship = 'Son'
  AND RHD.ConsumerID = 1;
-- NUMBER 12
SELECT realtor.FirstName, REALTOR.LastName, RWRC.CompanyName
FROM realtor,
     realtor_works_for_realtycompany RWRC
         INNER JOIN realtor R on RWRC.LicenseNumber = R.LicenseNumber
WHERE RWRC.CompanyName = 'Bobs Overpriced Homes';
-- NUMBER 13
SELECT AVG(PRICE), BUILDINGNUMBER
FROM property P,
     address A
WHERE BuildingNumber = '444'
  AND P.AddressID = A.AddressID;
-- THIS DOESN'T WORK IN SQL SERVER
-- NUMBER 14
CREATE VIEW ADDRESSINFO
AS
SELECT CONCAT(BuildingNumber, ' ', StreetName, ', ', CITY, '  ', Province) AS FullAddress
FROM address;
-- NUMBER 15
UPDATE seller_has_purchasecontract
SET SellDate = '2022-07-03'
WHERE ContractID = 1;
-- NUMBER 16

SELECT realtor.FirstName, realtor.LastName, realtor.LicenseNumber, realtycompany.CompanyName
FROM realtor, realtor_works_for_realtycompany, realtycompany
INNER JOIN realtor R1, realtycompany RC1
WHERE R1.LicenseNumber = realtor_works_for_realtycompany.LicenseNumber AND RC1.CompanyName = realtor_works_for_realtycompany.CompanyName;
-- NUMBER 17

SELECT MIN(PurchasePrice) AS CheapestPurchaseOfTheDay, ContractID
FROM buyer_has_purchasecontract
WHERE BuyDate='2022-07-03'
GROUP BY ContractID;
-- NUMBER 18
UPDATE property_has_propertytype
SET PropertyFees = '500'
WHERE PropertyType = 'Condo';
-- NUMBER 19
DELETE RWRC
FROM realtor_works_for_realtycompany RWRC
WHERE LicenseNumber =1;
-- NUMBER 20