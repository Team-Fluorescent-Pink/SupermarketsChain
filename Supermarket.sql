--------------------------------------------------------
--  File created - Saturday-July-18-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CATEGORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SUPERMARKET"."CATEGORY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MEASURES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SUPERMARKET"."MEASURES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SUPERMARKET"."PRODUCTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTS_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SUPERMARKET"."PRODUCTS_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence VENDORS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SUPERMARKET"."VENDORS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "SUPERMARKET"."CATEGORY" 
   (	"ID" NUMBER(*,0), 
	"NAME" NVARCHAR2(50)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEASURES
--------------------------------------------------------

  CREATE TABLE "SUPERMARKET"."MEASURES" 
   (	"ID" NUMBER(*,0), 
	"MEASURE_NAME" NVARCHAR2(50)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "SUPERMARKET"."PRODUCTS" 
   (	"ID" NUMBER(*,0), 
	"NAME" NVARCHAR2(50), 
	"VENDOR_ID" NUMBER(*,0), 
	"MEASURE_ID" NUMBER(*,0), 
	"CATEGORY_ID" NUMBER(*,0), 
	"PRICE" NUMBER(19,4)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VENDORS
--------------------------------------------------------

  CREATE TABLE "SUPERMARKET"."VENDORS" 
   (	"ID" NUMBER(*,0), 
	"VENDOR_NAME" NVARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SUPERMARKET.CATEGORY
SET DEFINE OFF;
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (1,'Beer');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (2,'Wine');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (3,'Whiskey');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (4,'Chocolate');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (5,'Biscuits');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (6,'Soft Drink');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (7,'Coffe');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (8,'Cereals');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (9,'Ice Cream');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (10,'Ciders');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (11,'Sweet Foods');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (12,'Vodka');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (13,'Rum');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (14,'Mineral Water');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (15,'Sparkling Water');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (16,'Brandy');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (17,'Rakia');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (18,'Fruits');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (19,'Nuts');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (20,'Chips');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (21,'Energy Drink');
Insert into SUPERMARKET.CATEGORY (ID,NAME) values (22,'Meat');
REM INSERTING into SUPERMARKET.MEASURES
SET DEFINE OFF;
Insert into SUPERMARKET.MEASURES (ID,MEASURE_NAME) values (1,'liters');
Insert into SUPERMARKET.MEASURES (ID,MEASURE_NAME) values (2,'pieces');
Insert into SUPERMARKET.MEASURES (ID,MEASURE_NAME) values (3,'kg');
REM INSERTING into SUPERMARKET.PRODUCTS
SET DEFINE OFF;
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (1,'Nestea iced tea ',1,1,6,1.45);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (2,'Nescafe Normal 100 gr',1,2,7,4.2);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (3,'Nescafe 3in1',1,2,7,0.3);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (4,'Fitness',1,2,8,3.8);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (5,'Nesquik',1,2,8,2.7);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (6,'Cookie Crisp',1,2,8,3.4);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (7,'Corn Flakes ',1,2,8,3);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (8,'Zagorka Retro',2,1,1,0.96);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (9,'Zagorka',2,1,1,0.95);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (10,'Heineken',2,1,1,1.25);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (11,'Strongbow',2,1,10,1.19);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (12,'Kamenitza',3,1,1,1);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (13,'Staropramen',3,1,1,1.1);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (14,'Carling',3,1,10,1.5);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (15,'Belvita',4,2,5,0.99);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (16,'Milka',4,2,4,1.43);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (17,'Oreo',4,2,5,2.65);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (18,'Toblerone',4,2,4,2.19);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (19,'Johny Walker Red Label',5,1,3,22.7);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (20,'Captain Morgan',5,1,13,18.79);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (21,'Guinness',5,1,1,3.09);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (22,'Smirnoff',5,1,12,16.49);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (23,'4 Friends',6,1,2,6.95);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (24,'Gallery Mavrud',6,1,2,13);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (25,'Gallery Muscat',6,1,2,11.9);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (26,'Cycle Syrah',7,1,2,6.9);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (27,'Cycle Pinot Noir',7,1,2,6.9);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (28,'Devin ',8,1,14,0.76);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (29,'Devin',8,1,15,0.79);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (30,'Coca-cola',9,1,6,2.49);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (31,'Monster',9,1,21,2.5);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (32,'Bankia',9,1,14,0.7);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (33,'Pepsi',10,1,6,2.35);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (34,'Sugar Cubes',11,2,11,1.5);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (35,'Chaika',11,2,11,1);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (36,'White Bear',12,1,12,7.88);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (37,'Classic',12,1,17,7.98);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (38,'Old',12,1,17,8.82);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (39,'Karnobatska Grape',13,1,17,7.22);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (40,'Karnobatska Special',13,1,17,8.68);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (41,'Savoy',13,1,3,7.78);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (42,'MarryJane',13,1,12,7.27);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (43,'Karnobat',13,1,16,6.2);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (44,'BlackRam',14,1,3,8.26);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (45,'Flirt',14,1,12,7.44);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (46,'Captain Fred',14,1,13,7.28);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (47,'Almonds',15,3,19,29);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (48,'Pistachios',15,3,19,32);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (49,'Peanuts',15,3,19,7.55);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (50,'Cherrys',16,3,18,2);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (51,'Apples',16,3,18,1.5);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (52,'Watermelons',16,3,18,0.45);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (53,'Peaches',16,3,18,1.1);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (54,'Ruffles',17,2,20,2.39);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (55,'Lays',17,2,20,3.1);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (56,'Chicken',18,3,22,5.1);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (57,'Porky',18,3,22,7.8);
Insert into SUPERMARKET.PRODUCTS (ID,NAME,VENDOR_ID,MEASURE_ID,CATEGORY_ID,PRICE) values (58,'Beef',18,3,22,12);
REM INSERTING into SUPERMARKET.VENDORS
SET DEFINE OFF;
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (1,'Nestle Sofia Corp.');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (2,'Zagorka Corp.');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (3,'Kamenitza Corp.');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (4,'Mondelez International');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (5,'Diageo');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (6,'Todoroff Wines');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (7,'Minkov Brothers Wines');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (8,'DEVIN JSC ');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (9,'Coca-Cola Bulgaria');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (10,'Pepsi Bulgaria');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (11,'Zaharni Zavodi AD');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (12,'LVK-Vinprom AD');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (13,'Karnobat Winery');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (14,'Vinprom Peshtera SA');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (15,'Intersnack Bulgaria');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (16,'Delivery Fruit');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (17,'Vista Awt');
Insert into SUPERMARKET.VENDORS (ID,VENDOR_NAME) values (18,'VIVECTA BG');
--------------------------------------------------------
--  DDL for Index PRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUPERMARKET"."PRODUCTS_PK" ON "SUPERMARKET"."PRODUCTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUPERMARKET"."CATEGORY_PK" ON "SUPERMARKET"."CATEGORY" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VENDORS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUPERMARKET"."VENDORS_PK" ON "SUPERMARKET"."VENDORS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MEASURES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUPERMARKET"."MEASURES_PK" ON "SUPERMARKET"."MEASURES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "SUPERMARKET"."CATEGORY" ADD CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SUPERMARKET"."CATEGORY" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."CATEGORY" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VENDORS
--------------------------------------------------------

  ALTER TABLE "SUPERMARKET"."VENDORS" ADD CONSTRAINT "VENDORS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SUPERMARKET"."VENDORS" MODIFY ("VENDOR_NAME" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."VENDORS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "SUPERMARKET"."PRODUCTS" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."PRODUCTS" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."PRODUCTS" MODIFY ("MEASURE_ID" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."PRODUCTS" MODIFY ("VENDOR_ID" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."PRODUCTS" ADD CONSTRAINT "PRODUCTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SUPERMARKET"."PRODUCTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."PRODUCTS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEASURES
--------------------------------------------------------

  ALTER TABLE "SUPERMARKET"."MEASURES" ADD CONSTRAINT "MEASURES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SUPERMARKET"."MEASURES" MODIFY ("MEASURE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SUPERMARKET"."MEASURES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "SUPERMARKET"."PRODUCTS" ADD CONSTRAINT "FK_PRODUCT_CATEGORY" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "SUPERMARKET"."CATEGORY" ("ID") ENABLE;
  ALTER TABLE "SUPERMARKET"."PRODUCTS" ADD CONSTRAINT "FK_PRODUCT_MEASURE" FOREIGN KEY ("MEASURE_ID")
	  REFERENCES "SUPERMARKET"."MEASURES" ("ID") ENABLE;
  ALTER TABLE "SUPERMARKET"."PRODUCTS" ADD CONSTRAINT "FK_PRODUCT_VENDOR" FOREIGN KEY ("VENDOR_ID")
	  REFERENCES "SUPERMARKET"."VENDORS" ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger CATEGORY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SUPERMARKET"."CATEGORY_TRG" 
BEFORE INSERT ON CATEGORY 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT CATEGORY_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SUPERMARKET"."CATEGORY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MEASURES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SUPERMARKET"."MEASURES_TRG" 
BEFORE INSERT ON MEASURES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT MEASURES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SUPERMARKET"."MEASURES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SUPERMARKET"."PRODUCTS_TRG" 
BEFORE INSERT ON PRODUCTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SUPERMARKET"."PRODUCTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTS_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SUPERMARKET"."PRODUCTS_TRG1" 
BEFORE INSERT ON PRODUCTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT PRODUCTS_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SUPERMARKET"."PRODUCTS_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VENDORS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SUPERMARKET"."VENDORS_TRG" 
BEFORE INSERT ON VENDORS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT VENDORS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SUPERMARKET"."VENDORS_TRG" ENABLE;