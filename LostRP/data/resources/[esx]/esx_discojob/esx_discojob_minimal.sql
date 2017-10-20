USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_disco','Disco',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_disco','Disco',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('disco','Bar')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('disco',0,'dj','DJ',20,'{}','{}'),
  ('disco',1,'videur','Videur',30,'{}','{}'),
  ('disco',2,'barman','Barman',40,'{}','{}'),
  ('disco',3,'gerant','Gerant',50,'{}','{}'),
  ('disco',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (name, label) VALUES
	('menthe', 'Menthe'),
	('pommedeterre', 'Pomme de terre'),
	('raisin', 'Raisin'),
	('mojito', 'Mojito'),
	('vodka', 'Vodka'),
	('champagne', 'Champagne'),
	('beer', 'Bière'),
	('whisky', 'Whisky'),
	('cocktail', 'Cocktail'),
	('limonade', 'Limonade'),
	('amidon', 'Amidon'),
	('orange', 'Orange'),
	('steackhache', 'Steack haché'),
	('feuilledecoca', 'Feuille de Coca'),
	('thefroid', 'Thé froid'),
	('sirop', 'Sirop'),
	('cacao', 'Cacao'),
	('eaugazifie', 'Eau Gazifiée'),
	('agrume', 'Agrume'),
	('cafeine', 'Caféine'),
	('hamburger', 'Hamburger'),
	('coca', 'Coca-Cola'),
	('icetea', 'Ice-Tea'),
	('orangina', 'Orangina'),
	('diabolo', 'Diabolo'),
	('chocolatchaud', 'Chocolat Chaud'),
	('perrier', 'Perrier'),
	('schweppes', 'Schweppes'),
	('cafe', 'Café')
;