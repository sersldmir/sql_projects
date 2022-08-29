SELECT schema_name
FROM information_schema.schemata;

CREATE SCHEMA "Pet";


/*creating tables*/

CREATE TABLE "Pet"."Paint" (
    ID INT NOT NULL,
    "Name" VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE "Pet"."Art work" (
    ID INT NOT NULL,
    "Name" VARCHAR(100) NOT NULL,
    "Author" VARCHAR(100) NOT NULL,
    "Creation year" SMALLINT NOT NULL,
    "Paint" INT NOT NULL
);

ALTER TABLE "Pet"."Art work" ADD PRIMARY KEY (ID, "Paint");
ALTER TABLE "Pet"."Art work" ADD FOREIGN KEY ("Paint") REFERENCES "Pet"."Paint"(ID);

/*SELECT * FROM "Pet"."Art work";*/
ALTER SCHEMA "Pet" RENAME TO "Pet_Gallery";

CREATE TABLE "Pet_Gallery"."Country" (
    ID INT NOT NULL,
    "Country_Name" VARCHAR(100) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE "Pet_Gallery"."City" (
    ID INT NOT NULL,
    "City_Name" VARCHAR(100) NOT NULL,
    "Country" INT NOT NULL
);

ALTER TABLE "Pet_Gallery"."City" ADD PRIMARY KEY (ID, "Country");
ALTER TABLE "Pet_Gallery"."City" ADD FOREIGN KEY ("Country") REFERENCES "Pet_Gallery"."Country"(ID);

CREATE TABLE "Pet_Gallery"."Street" (
    ID INT NOT NULL,
    "City" INT NOT NULL,
    "Country" INT NOT NULL,
    "Street_Name" VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID, "City", "Country"),
    FOREIGN KEY ("City", "Country") REFERENCES "Pet_Gallery"."City" (ID, "Country")
);


CREATE TABLE "Pet_Gallery"."House" (
    ID INT NOT NULL,
    "City" INT NOT NULL,
    "Country" INT NOT NULL,
    "Street" INT NOT NULL,
    "House_number" SMALLINT NOT NULL,
    "Area" INT NOT NULL,
    "Color" VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID, "City", "Country", "Street"),
    FOREIGN KEY ("Street", "Country", "City") REFERENCES "Pet_Gallery"."Street" (ID, "Country", "City")
);


CREATE TABLE "Pet_Gallery"."Gallery" (
    ID INT NOT NULL,
    "City" INT NOT NULL,
    "Country" INT NOT NULL,
    "Street" INT NOT NULL,
    "House" INT NOT NULL,
    "Name" VARCHAR(100) NOT NULL,
    "Founded" DATE NOT NULL,
    PRIMARY KEY (ID, "City", "Country", "Street", "House"),
    FOREIGN KEY ("House", "Street", "Country", "City") REFERENCES "Pet_Gallery"."House" (ID, "Street", "Country", "City")
);


CREATE TABLE "Pet_Gallery"."Gallery Contents" (
    ID INT NOT NULL,
    "Gallery" INT NOT NULL,
    "City" INT NOT NULL,
    "Country" INT NOT NULL,
    "Street" INT NOT NULL,
    "House" INT NOT NULL,
    "Quantity" SMALLINT NOT NULL,
    "Art work" INT NOT NULL,
    "Paint" INT NOT NULL,
    PRIMARY KEY (ID, "City", "Country", "Street", "House", "Gallery", "Art work", "Paint"),
    FOREIGN KEY ("Gallery", "House", "Street", "Country", "City") REFERENCES "Pet_Gallery"."Gallery" (ID, "House", "Street", "Country", "City"),
    FOREIGN KEY ("Art work", "Paint") REFERENCES "Pet_Gallery"."Art work" (ID, "Paint")
);

CREATE TABLE "Pet_Gallery"."Gender" (
    ID INT NOT NULL,
    "Gender_name" VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE "Pet_Gallery"."Customer" (
    ID INT NOT NULL,
    "Passport" VARCHAR(15) NOT NULL,
    "Full name" VARCHAR(100) NOT NULL,
    "Date of birth" DATE NOT NULL,
    "Gender" INT NOT NULL,
    PRIMARY KEY (ID, "Gender"),
    FOREIGN KEY ("Gender") REFERENCES "Pet_Gallery"."Gender" (ID)
);

CREATE TABLE "Pet_Gallery"."Excursion Types" (
    ID INT NOT NULL,
    "Type name" VARCHAR(50) NOT NULL,
    "Duration (minutes)" SMALLINT NOT NULL,
    "Group size" SMALLINT NOT NULL,
    PRIMARY KEY (ID)
);


CREATE TABLE "Pet_Gallery"."Ticket" (
    ID INT NOT NULL,
    "Gallery" INT NOT NULL,
    "City" INT NOT NULL,
    "Country" INT NOT NULL,
    "Street" INT NOT NULL,
    "House" INT NOT NULL,
    "Customer_info" INT NOT NULL,
    "Gender" INT NOT NULL,
    "Type_of_excursion" INT NOT NULL,
    "Date of excursion" DATE NOT NULL,
    PRIMARY KEY (ID, "Gallery", "House", "Street", "Country", "City", "Customer_info", "Gender", "Type_of_excursion"),
    FOREIGN KEY ("Gallery", "House", "Street", "Country", "City") REFERENCES "Pet_Gallery"."Gallery" (ID, "House", "Street", "Country", "City"),
    FOREIGN KEY ("Customer_info", "Gender") REFERENCES "Pet_Gallery"."Customer" (ID, "Gender"),
    FOREIGN KEY ("Type_of_excursion") REFERENCES "Pet_Gallery"."Excursion Types" (ID)
);