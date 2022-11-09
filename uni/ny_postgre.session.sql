CREATE SCHEMA IF NOT EXISTS "Study";

CREATE TABLE "Study".marka(
        IDM SMALLINT NOT NULL,
        PRODUCER VARCHAR(15) NOT NULL,
        MODEL VARCHAR(15) NOT NULL,
        COUNTRY CHAR(2)
);

CREATE TABLE "Study".AUTOS(
        Gosn VARCHAR(9) NOT NULL,
        IDM SMALLINT NOT NULL,
        Dateb DATE,
        Distance INTEGER,
        Category VARCHAR(50),
        Price INTEGER
);

ALTER TABLE "Study".marka ADD PRIMARY KEY (IDM);

ALTER TABLE "Study".AUTOS ADD PRIMARY KEY (IDM, Gosn);

ALTER TABLE "Study".AUTOS ADD FOREIGN KEY (IDM) REFERENCES "Study".marka(IDM);

ALTER TABLE "Study".AUTOS RENAME TO Vehicle;

ALTER TABLE "Study"."vehicle" ADD COLUMN "Owner" CHAR(50) NOT NULL;

ALTER TABLE "Study"."vehicle" ALTER COLUMN "Owner" TYPE VARCHAR(100);

ALTER TABLE "Study"."vehicle" RENAME COLUMN "Owner" TO "Owner_FIO";

ALTER TABLE "Study"."vehicle" DROP COLUMN "Owner_FIO";

SELECT *
FROM information_schema.colums
WHERE table_schema = 'Study'
AND table_name = 'vehicle';

SELECT *
FROM information_schema.colums
WHERE table_schema = 'Study'
AND table_name = 'marka';


INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (1, 'Mercedes-Benz', 'CLA-200', 'DE');

SELECT * FROM "Study".marka;

INSERT INTO "Study"."marka"(COUNTRY, PRODUCER, MODEL, IDM)
VALUES ('RU', 'Lada', 'Niva', 2);

SELECT * FROM "Study".marka;

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (3, 'Mercedes-Benz', '600-SEL', NULL);

SELECT * FROM "Study".marka;

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL)
VALUES (4, 'Mercedes-Benz', 'C180');

SELECT * FROM "Study".marka;

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('y365op77', 1, to_date('21.05.2001', 'dd.mm.yyyy'), 10000, NULL, 10000000);

SELECT to_char(current_date, 'dd.MON.yyyy');

SELECT * FROM "Study".vehicle;

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('c365oy790', 2, (SELECT current_date), 200002, NULL, 20000000);

SELECT * FROM "Study".vehicle;

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb)
VALUES ('y777yy777', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Mercedes-Benz' AND model = '600-SEL'), to_date('31.12.2021','dd.mm.yyyy'));

SELECT * FROM "Study".vehicle;

COMMIT;

SELECT * FROM "Study".markae;

/* Homework for the 18th of May */

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (5, 'Hyndai', 'Sonata', 'KR');

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (6, 'Hyndai', 'Solaris', 'kr');

UPDATE "Study"."marka"  SET country = 'KR' where country = 'kr';

SELECT * FROM "Study".marka;

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (7, 'Lamborgini', 'Aventador', 'IT');

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (8, 'Lamborgini', 'URUS', 'IT');

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (9, 'Mitsubishi', 'Lancer', 'JP');

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (10, 'Mitsubishi', 'L-200', 'JP');

SELECT * FROM "Study".marka;

UPDATE "Study"."marka"  SET country = 'RU', producer = 'Lada', model = 'Kalina' WHERE idm = (SELECT idm from "Study"."marka" WHERE producer = 'Mercedes-Benz' AND model = '600-SEL');

SELECT * FROM "Study".marka;

UPDATE "Study"."marka" SET country = 'DE' where idm = (SELECT idm from "Study"."marka" WHERE producer = 'Mercedes-Benz' AND model = 'C180');

SELECT * FROM "Study".marka;

SELECT * FROM "Study".vehicle;

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('L821UQ1', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Lada' AND model = 'Niva'), to_date('11.11.2011','dd.mm.yyyy'), NULL, 'Pickup', 1700009);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('A444HH22', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Lada' AND model = 'Kalina'), to_date('11.11.2011','dd.mm.yyyy'), 100, 'Small car', 1340009);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('O888PY5', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Mercedes-Benz' AND model = 'C180'), to_date('29.06.2022','dd.mm.yyyy'), 2345, NULL, 18900111);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('U451II11', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Mercedes-Benz' AND model = 'C180'), to_date('12.07.2019','dd.mm.yyyy'), 234522, NULL, 18900121);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('I654SH5', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Hyndai' AND model = 'Sonata'), to_date('29.06.2022','dd.mm.yyyy'), 2345, NULL, 18900111);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('I643SH7', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Hyndai' AND model = 'Sonata'), to_date('06.08.2008','dd.mm.yyyy'), 10000, 'Sedan', 23000112);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('Q900QQ9', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Hyndai' AND model = 'Solaris'), to_date('07.08.2009','dd.mm.yyyy'), 23000, 'Sedan', NULL);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('p920wt9', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Hyndai' AND model = 'Solaris'), to_date('08.08.2009','dd.mm.yyyy'), 23060, 'Sedan', NULL);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('a957pa9', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Lamborgini' AND model = 'Aventador'), to_date('02.10.2010','dd.mm.yyyy'), NULL, 'Sportcar', NULL);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('l917pz8', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Lamborgini' AND model = 'Aventador'), to_date('12.10.2010','dd.mm.yyyy'), NULL, 'Sportcar', NULL);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('h231lk9', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Lamborgini' AND model = 'URUS'), to_date('03.12.2014','dd.mm.yyyy'), NULL, 'Sportcar', NULL);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('b153ia8', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Lamborgini' AND model = 'URUS'), to_date('02.11.2017','dd.mm.yyyy'), 8, 'Sportcar', NULL);

SELECT * FROM "Study".vehicle;

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('q934ll9', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Mitsubishi' AND model = 'Lancer'), to_date('02.12.2019','dd.mm.yyyy'), 811, 'Small car', 2010000);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('s821li9', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Mitsubishi' AND model = 'Lancer'), to_date('23.12.2019','dd.mm.yyyy'), 8113, 'Small car', 2010034);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('s831li9', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Mitsubishi' AND model = 'L-200'), to_date('23.04.2015','dd.mm.yyyy'), 81123, 'Pickup', 3010034);

INSERT INTO "Study"."vehicle"(gosn, IDM, dateb, distance, category, price)
VALUES ('l211li8', (SELECT IDM FROM "Study"."marka" WHERE producer = 'Mitsubishi' AND model = 'L-200'), to_date('23.04.2018','dd.mm.yyyy'), 8112300, 'Pickup', 3120034);

SELECT * FROM "Study".vehicle;

SELECT * FROM "Study".marka;


/*classwork 18/05 */

SELECT * FROM "Study"."marka";

SELECT * FROM "Study"."vehicle";

INSERT INTO "Study"."marka"(IDM, PRODUCER,  MODEL, COUNTRY)
VALUES (11, 'KIA', 'K5', 'KR');

INSERT INTO "Study"."vehicle"(IDM, Gosn, DateB, Distance, Category, Price)   
VALUES(11, 'y330kx199', to_date('22.11.2019', 'dd.mm.yyyy'), NULL, NULL, NULL);

UPDATE "Study"."vehicle" SET Price = 1300000 WHERE Gosn = 'y330kx199';

UPDATE "Study"."vehicle" SET Distance = 108906, Category = 'Поручения' WHERE Gosn = 'y330kx199';

UPDATE "Study"."vehicle" SET Distance = 114591 WHERE Gosn = 'y330kx199';


 /* homework for may 25th */

SELECT * FROM "Study"."marka";

SELECT * FROM "Study"."vehicle";

UPDATE "Study"."vehicle" SET category = 'VIP-такси' WHERE category IS NULL;

UPDATE "Study"."vehicle" SET category = 'Заказная' WHERE category = 'VIP-такси';

UPDATE "Study"."vehicle" SET price = 1.15*price;

UPDATE "Study"."vehicle" SET category = 'Списание' WHERE category = 'Pickup';

DELETE FROM "Study"."vehicle" WHERE category='Списание';

UPDATE "Study"."vehicle" SET distance = distance*10000 WHERE idm=9 OR idm=11;

DELETE FROM "Study"."vehicle" WHERE distance>300000;

ROLLBACK;


/* classwork may 25th */

SELECT producer from "Study"."marka";

SELECT DISTINCT producer from "Study"."marka";

SELECT DISTINCT price from "Study"."vehicle";

SELECT "Study"."marka"."producer" FROM "Study"."marka";

SELECT "Study"."marka"."producer" AS "Производитель", "Study"."marka"."country" AS "Страна" FROM "Study"."marka";

/* homework for the 1st of June */

SELECT "Study"."vehicle"."dateb" AS "Дата" FROM "Study"."vehicle";

SELECT "Study"."vehicle"."gosn" AS "Госномер",
        "Study"."vehicle"."distance" AS "Пробег",
        "Study"."vehicle"."category" AS "Категория"
FROM "Study"."vehicle";

SELECT * FROM "Study"."marka";

SELECT * FROM "Study"."vehicle";

SELECT DISTINCT "Study"."marka"."country" AS "Страна" FROM "Study"."marka"
WHERE "Study"."marka"."idm" IN (SELECT DISTINCT "Study"."vehicle"."idm" FROM "Study"."vehicle");


/* classwork 1st of June */

CREATE OR REPLACE VIEW "Study"."ОМУ" AS SELECT "gosn" AS "Госномер",
"dateb" AS "Дата покупки",
"price" AS "Цена",
"idm" AS "Номер"
FROM "Study"."vehicle";

SELECT * FROM "Study"."ОМУ";

INSERT INTO "Study"."ОМУ"("Госномер", "Дата покупки", "Цена", "Номер") VALUES ('q2w-213', '23.07.2002', 33211, 8);

SELECT * FROM "Study"."ОМУ";


/* 07.09 classwork*/

SELECT * FROM "Study"."marka", "Study"."vehicle";

SELECT "Study"."marka"."producer", "Study"."marka"."model", "Study"."marka"."country",
"Study"."vehicle"."gosn", "Study"."vehicle"."dateb", "Study"."vehicle"."distance", "Study"."vehicle"."category", "Study"."vehicle"."price"
FROM "Study"."marka" 
INNER JOIN "Study"."vehicle" 
ON "Study"."marka"."idm" = "Study"."marka"."idm" 
WHERE "Study"."marka"."country"='DE';


SELECT T1.model, T2.distance
FROM (SELECT idm, model FROM "Study"."marka") AS T1
INNER JOIN (SELECT idm, distance FROM "Study"."vehicle") AS T2
ON T1.idm = T2.idm;


SELECT * FROM "Study"."marka";

SELECT * FROM "Study"."vehicle";

INSERT INTO "Study"."marka"(idm, producer, model, country)
VALUES (1000, 'Mercedes Benz', 'Pulman', 'DE');

SELECT A."gosn" AS CAR1 , B."gosn" AS CAR2
FROM "Study"."vehicle" AS A CROSS JOIN "Study"."vehicle" AS B WHERE A."gosn" < B."gosn";


/*hw*/

CREATE TABLE "Study"."driver" (
        "ID" INT NOT NULL,
        "Car" VARCHAR(30),
        "Age" INT,
        "Name" VARCHAR(100)
);

ALTER TABLE "Study"."driver" ADD PRIMARY KEY ("ID");
ALTER TABLE "Study"."driver" ADD COLUMN "marka" SMALLINT;
ALTER TABLE "Study"."driver" ADD FOREIGN KEY ("Car", "marka") REFERENCES "Study"."vehicle"("gosn", "idm");

INSERT INTO "Study"."driver"("ID", "Car", "Age", "Name", "marka")   
VALUES
        (12, 'T234UU9', 32, 'James', 1),
        (13, 'y365op77', 33, 'Mike', 1),
        (14, 'a957pa9', 34, 'Nina', 7),
        (15, 'p920wt9', 36, 'Alex', 6);

SELECT * FROM "Study"."marka";

SELECT * FROM "Study"."vehicle";

SELECT T1."distance"/3 FROM "Study"."vehicle" AS T1 WHERE T1."price" BETWEEN 1 AND 10000000;

SELECT * FROM "Study"."driver";

SELECT "Study"."marka"."producer" AS "Производитель", 
"Study"."marka"."model" AS "Модель",
"Study"."vehicle"."gosn" AS "Госномер",
"Study"."driver" ."Name" AS "Имя",
"Study"."driver" ."Age" AS "Возраст"
FROM "Study"."marka" 
JOIN "Study"."vehicle"
ON "Study"."marka"."idm" = "Study"."vehicle"."idm"
JOIN "Study"."driver" 
ON "Study"."driver"."Car" = "Study"."vehicle"."gosn";


/*cw 21.09*/

SELECT 'Доброе' || ' ' || 'утро' || '!';

SELECT T1."producer" || '-' || T1."model" FROM "Study"."marka" AS T1;

SELECT 'Производитель: ' || ' ' || T1."producer" || ';' || ' '|| 'Страна: ' || ' ' || T1."country" AS "Результат" FROM "Study"."marka" AS T1; 

SELECT length('Финуниверситет');

SELECT T1."gosn" AS "Госномер", length(T1."gosn") AS "Его длина" FROM "Study"."vehicle" AS T1;

SELECT trim(LEADING 'Фин' FROM 'Финуниверситет');

SELECT to_char(T1.dateb, 'dd.mm hh24:mi:ss') FROM "Study"."vehicle" AS T1;

SELECT to_number('1A', '9');

SELECT T1."gosn", T1."price"*1.1 FROM "Study"."vehicle" AS T1;

UPDATE "Study"."vehicle" SET "price" = "price" * 1.1;

SELECT round(2.5, 0);

SELECT trunc(2.5, 0);

SELECT count(*) FROM "Study"."vehicle";

SELECT T1."gosn" AS "дорогие автомобили" FROM "Study"."vehicle" AS T1 c IN (SELECT T2."price" FROM "Study"."vehicle" as T2 WHERE T2."price">=1000000 and T2."price"<=2000000);

SELECT T2."gosn" AS "дорогие автомобили" FROM "Study"."vehicle" AS T2 WHERE T2."price">=1000000 and T2."price"<=2000000;

SELECT T1."gosn" AS "более дорогие автомобили" FROM "Study"."vehicle" AS T1 WHERE T1."price" BETWEEN 1000000 AND 3000000;




/*new era*/

CREATE SCHEMA "HR";

CREATE TABLE "HR"."REGIONS"(
        "region_id" INT NOT NULL,
        "region_name" VARCHAR(100),
        PRIMARY KEY("region_id")
);

CREATE TABLE "HR"."COUNTRIES"(
        "country_id" INT NOT NULL,
        "country_name" VARCHAR(100) NOT NULL,
        "region_id" INT NOT NULL,
        PRIMARY KEY("country_id"),
        FOREIGN KEY("region_id") REFERENCES "HR"."REGIONS"("region_id")
);

CREATE TABLE "HR"."LOCATIONS"(
        "location_id" INT NOT NULL,
        "street adress" VARCHAR(200),
        "postal code" VARCHAR(10),
        "city" VARCHAR(100),
        "state province" VARCHAR(100),
        "Country id" INT NOT NULL,
        PRIMARY KEY("location_id"),
        FOREIGN KEY("Country id") REFERENCES "HR"."COUNTRIES"("country_id")
);

CREATE TABLE "HR"."DEPARTMENTS"(
        "department_id" INT NOT NULL,
        "department name" VARCHAR(100),
        "manager_id" INT NOT NULL,
        "location_id" INT NOT NULL,
        PRIMARY KEY("department_id"),
        FOREIGN KEY("location_id") REFERENCES "HR"."LOCATIONS"("location_id")
);

CREATE TABLE "HR"."JOBS"(
        "job_id" INT NOT NULL,
        "job_title" VARCHAR(100) NOT NULL,
        "min_salary" INT NOT NULL,
        "max_salary" INT NOT NULL,
        PRIMARY KEY(job_id)
);

-- avoidable, just forgot not null while creating tables
ALTER TABLE "HR"."REGIONS" ALTER COLUMN "region_name" SET NOT NULL;
ALTER TABLE "HR"."LOCATIONS" ALTER COLUMN "street adress" SET NOT NULL;
ALTER TABLE "HR"."LOCATIONS" ALTER COLUMN "postal code" SET NOT NULL;
ALTER TABLE "HR"."LOCATIONS" ALTER COLUMN "city" SET NOT NULL;
ALTER TABLE "HR"."LOCATIONS" ALTER COLUMN "state province" SET NOT NULL;
ALTER TABLE "HR"."DEPARTMENTS" ALTER COLUMN "department name" SET NOT NULL;

CREATE TABLE "HR"."EMPLOYEES"(
        "employee_id" INT NOT NULL,
        "first_name" VARCHAR(100),
        "last_name" VARCHAR(100),
        "email" VARCHAR(100),
        "phone number" VARCHAR(10),
        "hire_date" DATE,
        "job_id" INT NOT NULL,
        "salary" INT NOT NULL,
        "commision_pct" VARCHAR(100),
        "manager_id" INT, --maybe not null, but can be fixed later
        "department_id" INT NOT NULL,
        PRIMARY KEY("employee_id"),
        FOREIGN KEY("job_id") REFERENCES "HR"."JOBS"("job_id"),
        FOREIGN KEY("department_id") REFERENCES "HR"."DEPARTMENTS"("department_id"),
        FOREIGN KEY("manager_id") REFERENCES "HR"."EMPLOYEES"("employee_id")
);

ALTER TABLE "HR"."DEPARTMENTS" ADD FOREIGN KEY("manager_id") REFERENCES "HR"."EMPLOYEES"("employee_id");

CREATE TABLE "HR"."JOB_HISTORY"(
        "employee_id" INT NOT NULL,
        "start_date" DATE NOT NULL, --might be a foreign key to hire_date in the employees table but makes no sense
        "end_date" DATE NOT NULL,
        "job_id" INT NOT NULL,
        "department_id" INT NOT NULL,
        PRIMARY KEY("employee_id", "start_date"),
        FOREIGN KEY("employee_id") REFERENCES "HR"."EMPLOYEES"("employee_id"),
        FOREIGN KEY("job_id") REFERENCES "HR"."JOBS"("job_id"),
        FOREIGN KEY("department_id") REFERENCES "HR"."DEPARTMENTS"("department_id")
);

-- avoidable, just forgot not null while creating tables
ALTER TABLE "HR"."EMPLOYEES" ALTER COLUMN "first_name" SET NOT NULL;
ALTER TABLE "HR"."EMPLOYEES" ALTER COLUMN "last_name" SET NOT NULL;
ALTER TABLE "HR"."EMPLOYEES" ALTER COLUMN "email" SET NOT NULL;
ALTER TABLE "HR"."EMPLOYEES" ALTER COLUMN "phone number" SET NOT NULL;
ALTER TABLE "HR"."EMPLOYEES" ALTER COLUMN "hire_date" SET NOT NULL;
ALTER TABLE "HR"."EMPLOYEES" ALTER COLUMN "commision_pct" SET NOT NULL;

-- uni project
CREATE SCHEMA "Аттестационная работа";

CREATE TABLE "Аттестационная работа"."Категория имущества"(
        "cat_UID" INT NOT NULL,
        "категория" VARCHAR(100) NOT NULL,
        PRIMARY KEY("cat_UID")
);

CREATE TABLE "Аттестационная работа"."Единицы измерения"(
        "jed_UID" INT NOT NULL,
        "наименование" VARCHAR(100) NOT NULL,
        PRIMARY KEY("jed_UID")
);


CREATE TABLE "Аттестационная работа"."Имущество"(
        "артикул" VARCHAR(100) NOT NULL,
        "категория" INT NOT NULL,
        "наименование" VARCHAR(100) NOT NULL,
        "срок носки" INT,
        "единица измерения" INT NULL,
        PRIMARY KEY("артикул"),
        FOREIGN KEY("единица измерения") REFERENCES "Аттестационная работа"."Единицы измерения"("jed_UID"),
        FOREIGN KEY("категория") REFERENCES "Аттестационная работа"."Категория имущества"("cat_UID")
);

--ошибся с ключом, как исправить

SELECT * FROM information_schema.table_constraints;

SELECT constraint_name FROM information_schema.table_constraints
WHERE table_schema = 'Аттестационная работа'
      AND table_name = 'Имущество'
      AND constraint_type = 'PRIMARY KEY';

ALTER TABLE "Аттестационная работа"."Имущество" DROP CONSTRAINT "Имущество_pkey"; --получено из запроса выше

ALTER TABLE "Аттестационная работа"."Имущество" ADD PRIMARY KEY("артикул", "единица измерения", "категория");

CREATE TABLE "Аттестационная работа"."Категория военнослужащего"(
        "mil_cat_UID" INT NOT NULL,
        "категория" VARCHAR(100) NOT NULL,
        PRIMARY KEY("mil_cat_UID")
);

CREATE TABLE "Аттестационная работа"."Воинское звание"(
        "rank_UID" INT NOT NULL,
        "звание" VARCHAR(100) NOT NULL,
        PRIMARY KEY("rank_UID")
);

CREATE TABLE "Аттестационная работа"."Должность"(
        "mil_oc_UID" INT NOT NULL,
        "должность" VARCHAR(100) NOT NULL,
        PRIMARY KEY("mil_oc_UID")
);

CREATE TABLE "Аттестационная работа"."Подразделение"(
        "dep_UID" INT NOT NULL,
        "подразделение" VARCHAR(100) NOT NULL,
        PRIMARY KEY("dep_UID")
);

CREATE TABLE "Аттестационная работа"."Военнослужащий"(
        "sol_uid" INT NOT NULL,
        "должность" INT NOT NULL,
        "категория" INT NOT NULL,
        "подразделение" INT NOT NULL,
        "звание" INT NOT NULL,
        PRIMARY KEY("sol_uid", "должность", "категория", "подразделение", "звание"),
        FOREIGN KEY("должность") REFERENCES "Аттестационная работа"."Должность"("mil_oc_UID"),
        FOREIGN KEY("категория") REFERENCES "Аттестационная работа"."Категория военнослужащего"("mil_cat_UID"),
        FOREIGN KEY("подразделение") REFERENCES "Аттестационная работа"."Подразделение"("dep_UID"),
        FOREIGN KEY("звание") REFERENCES "Аттестационная работа"."Воинское звание"("rank_UID")
);

CREATE TABLE "Аттестационная работа"."Военнослужащий"(
        "sol_uid" INT NOT NULL,
        "должность" INT NOT NULL,
        "категория" INT NOT NULL,
        "подразделение" INT NOT NULL,
        "звание" INT NOT NULL,
        PRIMARY KEY("sol_uid", "должность", "категория", "подразделение", "звание"),
        FOREIGN KEY("должность") REFERENCES "Аттестационная работа"."Должность"("mil_oc_UID"),
        FOREIGN KEY("категория") REFERENCES "Аттестационная работа"."Категория военнослужащего"("mil_cat_UID"),
        FOREIGN KEY("подразделение") REFERENCES "Аттестационная работа"."Подразделение"("dep_UID"),
        FOREIGN KEY("звание") REFERENCES "Аттестационная работа"."Воинское звание"("rank_UID")
);

CREATE TABLE "Аттестационная работа"."Карточка выдачи"(
        "card_uid" INT NOT NULL,
        "должность" INT NOT NULL,
        "категория_им" INT NOT NULL,
        "подразделение" INT NOT NULL,
        "звание" INT NOT NULL,
        "артикул" VARCHAR(100) NOT NULL,
        "категория_военного" INT NOT NULL,
        "единица измерения" INT NOT NULL,
        "военнослужащий" INT NOT NULL,
        PRIMARY KEY("card_uid", "должность", "категория_им", "категория_военного","подразделение", "звание", "артикул", "единица измерения", "военнослужащий"),
        FOREIGN KEY("военнослужащий", "должность", "категория_военного", "подразделение", "звание") REFERENCES "Аттестационная работа"."Военнослужащий"("sol_uid", "должность", "категория", "подразделение", "звание"),
        FOREIGN KEY("единица измерения", "категория_им", "артикул") REFERENCES "Аттестационная работа"."Имущество"("единица измерения", "категория", "артикул")
);

ALTER TABLE "Аттестационная работа"."Военнослужащий" ADD COLUMN "ФИО" VARCHAR(100) NOT NULL;


/*toying*/
SELECT (565.784-round(565.784, 2))*1000

SELECT (565.784 - round(565.784, 2))*1000;
SELECT (565.784 - round(565.784, 2))*100000;
SELECT (565.784 - round(565.784, 2))*1000000;

SELECT current_date;

SELECT ROUND(EXTRACT(year FROM age(to_date('2022-12-31','yyyy-mm-dd'),current_date))*12 + EXTRACT(month FROM age(to_date('2022-12-31','yyyy-mm-dd'),current_date)), 0);

SELECT ROUND(EXTRACT(month FROM age(to_date('2022-09-01','yyyy-mm-dd'),to_date('2022-06-29','yyyy-mm-dd')))*30.5, 0);

SELECT i::date FROM generate_series('2021-06-01',
'2022-09-01', '1 day'::interval) i;

SELECT DATEDIFF(day, '2011-12-29 23:00:00', '2011-12-31 01:00:00');

SELECT ('2015-01-12'::date - '2015-01-01'::date) AS days;

SELECT (to_date('2022-12-31','yyyy-mm-dd') - to_date('2022-01-01','yyyy-mm-dd')) AS days;

SELECT DATEDIFF(to_date('2022-01-01','yyyy-mm-dd'), to_date('2022-12-31','yyyy-mm-dd'))

SELECT EXTRACT(day FROM age(to_date('2022-12-31','yyyy-mm-dd'), to_date('2022-01-01','yyyy-mm-dd')))

SELECT (date_trunc('month', '2017-01-05'::date) + interval '1 month' - interval '1 day')::date
AS end_of_month;

SELECT date_trunc('day','2022-12-01'::date)

SELECT (date_trunc('day', current_date + interval '6 month')) AS "Назначение"

SELECT (date_trunc('week', '2002-07-23'::date) + interval '14 days' - interval '4 days')

SELECT round(86.678, 2)

SELECT concat(lower('AWSDA'), substring(upper('troll'), 1,1))

SELECT trim(TRAILING 'dum' FROM 'fiddledeedum')

SELECT trim(LEADING 'fiddle' FROM 'fiddledeedee')

SELECT replace('fiddledeedee', 'fiddle', '')

SELECT concat(trim(TRAILING 'dum' FROM 'fiddledeedum'), replace('fiddledeedee', 'fiddle', '')) AS "Nonsense";

SELECT trunc(73.892, 1)

/* ср */

SELECT (date_trunc('week', '2002-07-23'::date) + interval '14 days' - interval '4 days');  

SELECT mod(34,8);

WITH experiment AS (
SELECT T1.category AS "Категория", T1.gosn AS "Госномер", T2.model AS "Модель", T1.distance AS "Пробег"
FROM "Study".vehicle AS T1 INNER JOIN "Study".marka AS T2 ON T2.idm = T1.idm)

SELECT * 
FROM experiment
WHERE "Категория" IS NOT NULL;

SELECT T1.category AS "Категория", count(T1.gosn) AS "Количество машин"
FROM "Study".vehicle AS T1
GROUP BY "Категория";

/*trash query*/
SELECT producer, model, country FROM "Study"."marka"
UNION
SELECT CAST(T1.distance AS text), CAST(T1.category AS text), CAST(T1.price AS text) FROM "Study"."vehicle" AS T1;

SELECT T1."Car" FROM "Study".driver AS T1
UNION ALL
SELECT T2.gosn FROM "Study".vehicle AS T2;

SELECT * FROM "Study".driver 