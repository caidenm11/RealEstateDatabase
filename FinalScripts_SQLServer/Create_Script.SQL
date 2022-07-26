/*CREATE DATABASE Red_Gorillas;
USE RED_GORILLAS;
This does not work in SQL Server*/
/*The only thing that did not work properly other than the comments was 
CONSTRAINT Property UNIQUE (PropertyID), this did not work in SQL Server*/
CREATE DATABASE FORSTEPFIVE;
CREATE TABLE Address
(
    AddressID      INT NOT NULL,
    StreetName     VARCHAR(20),
    BuildingNumber INT,
    City           VARCHAR(20),
    Province       VARCHAR(2),
    PRIMARY KEY (AddressID)
);

CREATE TABLE Consumer
(
    ConsumerID INT NOT NULL,
    FirstName  VARCHAR(25),
    LastName   VARCHAR(25),
    Occupation VARCHAR(12),
    AddressID  INT,
    FOREIGN KEY (AddressID) REFERENCES Address (AddressID) ON DELETE CASCADE,
    PRIMARY KEY (ConsumerID)
);

CREATE TABLE Buyer
(
    ConsumerID INT NOT NULL,
    FOREIGN KEY (ConsumerID) REFERENCES Consumer (ConsumerID),
    PRIMARY KEY (ConsumerID)
);

CREATE TABLE Seller
(
    ConsumerID INT NOT NULL,
    FOREIGN KEY (ConsumerID) REFERENCES Consumer (ConsumerID),
    PRIMARY KEY (ConsumerID)
);

CREATE TABLE Renter
(
    ConsumerID INT NOT NULL,
    StartDate  DATE,
    EndDate    DATE,
    FOREIGN KEY (ConsumerID) REFERENCES Consumer (ConsumerID),
    PRIMARY KEY (ConsumerID)
);

CREATE TABLE Realtor
(
    LicenseNumber INT NOT NULL,
    PhoneNumber   NUMERIC(10),
    EmailAddress  VARCHAR(40),
    FirstName     VARCHAR(20),
    LastName      VARCHAR(20),
    PRIMARY KEY (LicenseNumber)
);

CREATE TABLE PurchaseContract
(
    ContractID INT NOT NULL,
    PRIMARY KEY (ContractID)
);

CREATE TABLE Property
(
    PropertyID       INT        NOT NULL,
    AddressID        INT UNIQUE NOT NULL,
    ListingStartDate DATE,
    Price            NUMERIC(20),
    Description      VARCHAR(1000),
    FOREIGN KEY (AddressID) REFERENCES Address (AddressID) ON DELETE CASCADE,
    PRIMARY KEY (PropertyID)
);

CREATE TABLE RealtyCompany
(
    CompanyName VARCHAR(25) NOT NULL,
    PhoneNumber NUMERIC(10),
    AddressID   INT UNIQUE  NOT NULL,
    FOREIGN KEY (AddressID) REFERENCES Address (AddressID) ON DELETE CASCADE,
    PRIMARY KEY (CompanyName)
);


CREATE TABLE Property_has_PropertyType
(
    PropertyType VARCHAR(10),
    PropertyID   INT NOT NULL,
    PropertyFees INT,
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE,
    /*CONSTRAINT Property UNIQUE (PropertyID), this did not work in SQL Server*/
    PRIMARY KEY (PropertyType, PropertyID)
);

CREATE TABLE Dependent_hasInfo
(
    DependentID INT NOT NULL,
    Name        VARCHAR(20),
    Gender      VARCHAR(6),
    Birthday    Date,
    PRIMARY KEY (DependentID)
);

CREATE TABLE Renter_has_Dependent
(
    ConsumerID   INT NOT NULL,
    DependentID  INT NOT NULL,
    Relationship VARCHAR(10),
    FOREIGN KEY (ConsumerID) REFERENCES Renter (ConsumerID) ON DELETE CASCADE,
    FOREIGN KEY (DependentID) REFERENCES Dependent_hasInfo (DependentID) ON DELETE CASCADE,
    PRIMARY KEY (ConsumerID, DependentID)
);

CREATE TABLE Realtor_works_for_RealtyCompany
(
    CompanyName       VARCHAR(25) NOT NULL,
    LicenseNumber     INT         NOT NULL,
    YearsOfExperience INT,
    FOREIGN KEY (CompanyName) REFERENCES RealtyCompany (CompanyName),
    FOREIGN KEY (LicenseNumber) REFERENCES Realtor (LicenseNumber),
    PRIMARY KEY (CompanyName, LicenseNumber)
);

CREATE TABLE Buyer_has_PurchaseContract
(
    ContractID    INT NOT NULL,
    BuyerID       INT NOT NULL,
    PurchasePrice INT,
    BuyDate       DATE,
    FOREIGN KEY (BuyerID) REFERENCES Buyer (ConsumerID) ON DELETE CASCADE,
    FOREIGN KEY (ContractID) REFERENCES PurchaseContract (ContractID) ON DELETE CASCADE,
    PRIMARY KEY (ContractID)
);

CREATE TABLE Seller_has_PurchaseContract
(
    ContractID INT NOT NULL,
    SellerID   INT NOT NULL,
    SellDate   DATE,
    FOREIGN KEY (ContractID) REFERENCES PurchaseContract (ContractID) ON DELETE CASCADE,
    FOREIGN KEY (SellerID) REFERENCES seller (ConsumerID) ON DELETE CASCADE,
    PRIMARY KEY (ContractID)
);

CREATE TABLE PurchaseContract_has_Mortgage
(
    ContractID     INT NOT NULL,
    MortgageAmount INT NOT NULL,
    FOREIGN KEY (ContractID) REFERENCES PurchaseContract (ContractID) ON DELETE CASCADE,
    PRIMARY KEY (ContractID)
);

CREATE TABLE Realtor_lists_PurchaseContract
(
    LicenseNumber INT NOT NULL,
    ContractID    INT,
    FOREIGN KEY (LicenseNumber) REFERENCES Realtor (LicenseNumber),
    FOREIGN KEY (ContractID) REFERENCES PurchaseContract (ContractID) ON DELETE CASCADE,
    PRIMARY KEY (LicenseNumber, ContractID)
);

CREATE TABLE Property_Photo
(
    PropertyID    INT         NOT NULL,
    PhotoLocation VARCHAR(30) NOT NULL,
    FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID) ON DELETE CASCADE,
    PRIMARY KEY (PropertyID)

);