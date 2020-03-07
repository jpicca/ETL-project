-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/tljoTc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "patient" (
    "patient_id" INT   NOT NULL,
    "sex" VARCHAR   NULL,
    "birth_year" INT   NULL,
    "country" VARCHAR   NULL,
    "region" VARCHAR   NULL,
    "group" VARCHAR   NULL,
    "infection_reason" VARCHAR   NULL,
    "infection_order" INT   NULL,
    "infected_by" INT   NULL,
    "contact_number" INT   NULL,
    "confirmed_date" DATE   NULL,
    "released_date" DATE   NULL,
    "deceased_date" DATE   NULL,
    "state" VARCHAR   NULL,
    CONSTRAINT "pk_patient" PRIMARY KEY (
        "patient_id"
     )
);

CREATE TABLE "route" (
    "id" SERIAL   NOT NULL,
    "patient_id" INT   NULL,
    "date" DATE   NULL,
    "province" VARCHAR   NULL,
    "city" VARCHAR   NULL,
    "visit" VARCHAR   NULL,
    "latitude" FLOAT   NULL,
    "longitude" FLOAT   NULL,
    CONSTRAINT "pk_route" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "time" (
    "id" SERIAL   NOT NULL,
    "date" DATE   NULL,
    "time" INT   NOT NULL,
    "acc_test" INT   NULL,
    "acc_negative" INT   NULL,
    "acc_confirmed" INT   NULL,
    "acc_released" INT   NULL,
    "acc_deceased" INT   NULL,
    "new_test" INT   NULL,
    "new_negative" INT   NULL,
    "new_confirmed" INT   NULL,
    "new_released" INT   NULL,
    "new_deceased" INT   NULL,
    CONSTRAINT "pk_time" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "route_patient" (
    "ID" SERIAL   NOT NULL,
    "patient_id" INT   NOT NULL,
    "sex" varchar   NULL,
    "birth_year" int   NULL,
    "country" varchar   NULL,
    "region" varchar   NULL,
    "group" varchar   NULL,
    "infection_reason" varchar   NULL,
    "infection_order" int   NULL,
    "infected_by" int   NULL,
    "contact_number" int   NULL,
    "confirmed_date" date   NULL,
    "released_date" date   NULL,
    "deceased_date" date   NULL,
    "state" varchar   NULL,
    "date" date   NULL,
    "province" varchar   NULL,
    "city" varchar   NULL,
    "visit" varchar   NULL,
    "latitude" float   NULL,
    "longitude" float   NULL,
    CONSTRAINT "pk_route_patient" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "route" ADD CONSTRAINT "fk_route_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patient" ("patient_id");

ALTER TABLE "route_patient" ADD CONSTRAINT "fk_route_patient_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patient" ("patient_id");

