CREATE TABLE people ( PersonID INTEGER PRIMARY KEY, Name VarChar(20) NOT NULL, Admin Bool);

INSERT INTO people (Name, Admin) 
VALUES 
('WeirdlyExisting', FALSE), 
('NotAdmin', FALSE),
('root', TRUE), 
('WhoKnows', FALSE),
('''; DROP TABLES; --', FALSE),
('https://xkcd.com/327/', FALSE), 
('NotAdmin', FALSE);
