DROP DATABASE IF EXISTS supermarket;

CREATE DATABASE supermarket CHARACTER SET utf8 COLLATE utf8_general_ci;

USE supermarket;

CREATE TABLE categories
(
	ID int AUTO_INCREMENT PRIMARY KEY,
	NAME nvarchar(100) NOT NULL
);

CREATE TABLE vendors
(
	ID int AUTO_INCREMENT PRIMARY KEY,
	VENDOR_NAME nvarchar(200) NOT NULL
);

CREATE TABLE measures
(
	ID int AUTO_INCREMENT PRIMARY KEY,
	MEASURE_NAME nvarchar(100) NOT NULL
);

CREATE TABLE products
(
	ID int AUTO_INCREMENT PRIMARY KEY,
	NAME nvarchar(100) NOT NULL,
	VENDOR_ID int NOT NULL,
	MEASURE_ID int NOT NULL,
	CATEGORY_ID int NOT NULL,
	PRICE decimal(19, 4) NOT NULL,
	FOREIGN KEY (VENDOR_ID) REFERENCES vendors(ID),
	FOREIGN KEY (MEASURE_ID) REFERENCES measures(ID),
	FOREIGN KEY (CATEGORY_ID) REFERENCES categories(ID)	
);


INSERT INTO measures VALUES
	(1, 'liters'),
	(2, 'pieces'),
	(3, 'kg');


INSERT INTO categories VALUES
	(1,'Beer'),
	(2,'Wine'),
	(3,'Whiskey'),
	(4,'Chocolate'),
	(5,'Biscuits'),
	(6,'Soft Drink'),
	(7,'Coffe'),
	(8,'Cereals'),
	(9,'Ice Cream'),
	(10,'Ciders'),
	(11,'Sweet Foods'),
	(12,'Vodka'),
	(13,'Rum'),
	(14,'Mineral Water'),
	(15,'Sparkling Water'),
	(16,'Brandy'),
	(17,'Rakia'),
	(18,'Fruits'),
	(19,'Nuts'),
	(20,'Chips'),
	(21,'Energy Drink'),
	(22,'Meat');

INSERT INTO vendors VALUES
	(1,'Nestle Sofia Corp.'),
	(2,'Zagorka Corp.'),
	(3,'Kamenitza Corp.'),
	(4,'Mondelez International'),
	(5,'Diageo'),
	(6,'Todoroff Wines'),
	(7,'Minkov Brothers Wines'),
	(8,'DEVIN JSC '),
	(9,'Coca-Cola Bulgaria'),
	(10,'Pepsi Bulgaria'),
	(11,'Zaharni Zavodi AD'),
	(12,'LVK-Vinprom AD'),
	(13,'Karnobat Winery'),
	(14,'Vinprom Peshtera SA'),
	(15,'Intersnack Bulgaria'),
	(16,'Delivery Fruit'),
	(17,'Vista Awt'),
	(18,'VIVECTA BG');

INSERT INTO products VALUES
	(1,'Nestea iced tea ',1,1,6,1.4500),
	(2,'Nescafe Normal 100 gr',1,2,7,4.2000),
	(3,'Nescafe 3in1',1,2,7,0.3000),
	(4,'Fitness',1,2,8,3.8000),
	(5,'Nesquik',1,2,8,2.7000),
	(6,'Cookie Crisp',1,2,8,3.4000),
	(7,'Corn Flakes ',1,2,8,3.0000),
	(8,'Zagorka Retro',2,1,1,0.9600),
	(9,'Zagorka',2,1,1,0.9500),
	(10,'Heineken',2,1,1,1.2500),
	(11,'Strongbow',2,1,10,1.1900),
	(12,'Kamenitza',3,1,1,1.0000),
	(13,'Staropramen',3,1,1,1.1000),
	(14,'Carling',3,1,10,1.5000),
	(15,'Belvita',4,2,5,0.9900),
	(16,'Milka',4,2,4,1.4300),
	(17,'Oreo',4,2,5,2.6500),
	(18,'Toblerone',4,2,4,2.1900),
	(19,'Johny Walker Red Label',5,1,3,22.7000),
	(20,'Captain Morgan',5,1,13,18.7900),
	(21,'Guinness',5,1,1,3.0900),
	(22,'Smirnoff',5,1,12,16.4900),
	(23,'4 Friends',6,1,2,6.9500),
	(24,'Gallery Mavrud',6,1,2,13.0000),
	(25,'Gallery Muscat',6,1,2,11.9000),
	(26,'Cycle Syrah',7,1,2,6.9000),
	(27,'Cycle Pinot Noir',7,1,2,6.9000),
	(28,'Devin ',8,1,14,0.7600),
	(29,'Devin',8,1,15,0.7900),
	(30,'Coca-cola',9,1,6,2.4900),
	(31,'Monster',9,1,21,2.5000),
	(32,'Bankia',9,1,14,0.7000),
	(33,'Pepsi',10,1,6,2.3500),
	(34,'Sugar Cubes',11,2,11,1.5000),
	(35,'Chaika',11,2,11,1.0000),
	(36,'White Bear',12,1,12,7.8800),
	(37,'Classic',12,1,17,7.9800),
	(38,'Old',12,1,17,8.8200),
	(39,'Karnobatska Grape',13,1,17,7.2200),
	(40,'Karnobatska Special',13,1,17,8.6800),
	(41,'Savoy',13,1,3,7.7800),
	(42,'MarryJane',13,1,12,7.2700),
	(43,'Karnobat',13,1,16,6.2000),
	(44,'BlackRam',14,1,3,8.2600),
	(45,'Flirt',14,1,12,7.4400),
	(46,'Captain Fred',14,1,13,7.2800),
	(47,'Almonds',15,3,19,29.0000),
	(48,'Pistachios',15,3,19,32.0000),
	(49,'Peanuts',15,3,19,7.5500),
	(50,'Cherrys',16,3,18,2.0000),
	(51,'Apples',16,3,18,1.5000),
	(52,'Watermelons',16,3,18,0.4500),
	(53,'Peaches',16,3,18,1.1000),
	(54,'Ruffles',17,2,20,2.3900),
	(55,'Lays',17,2,20,3.1000),
	(56,'Chicken',18,3,22,5.1000),
	(57,'Porky',18,3,22,7.8000),
	(58,'Beef',18,3,22,12.0000),
	(59,'Beck''s',2,1,1,1.2000),
	(60,'Targovishte',13,1,12,8.5000);







