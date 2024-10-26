USE pet_database;

-- Insert events for Fluffy and Hammy
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

--Note that Hammy is a male hamster born on 2010-10-30
INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

-- Fluffy's details - had 5 kittens, 2 male
-- (Additional information can be commented here as required)

-- Additional events and modifications
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Puffball', '2020-09-01', 'death', 'died');

-- Delete Harold's dog entry due to GDPR
DELETE FROM petPet WHERE owner = 'Harold';
