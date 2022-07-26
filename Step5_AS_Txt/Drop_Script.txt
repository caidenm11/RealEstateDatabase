USE red_gorillas;

DROP TABLE buyer_has_purchasecontract;
DROP TABLE buyer;
DROP TABLE property_has_propertytype; #CHECK THIS YOU MUST DELETE THESE BEFORE PROPERTY, THERE MUST BE A BETTER WAY.
DROP TABLE property_photo;
DROP TABLE property;
DROP TABLE purchasecontract_has_mortgage; # MUST DELETE BEFORE -- CHECK THIS OUT
DROP TABLE seller_has_purchasecontract;
DROP TABLE realtor_lists_purchasecontract;
DROP TABLE purchasecontract;
DROP TABLE realtor_works_for_realtycompany;
DROP TABLE realtor;
DROP TABLE realtycompany;
DROP TABLE renter_has_dependent;
DROP TABLE renter;
DROP TABLE seller;
DROP TABLE consumer;
DROP TABLE dependent_hasinfo;
DROP TABLE address;

DROP DATABASE red_gorillas;
