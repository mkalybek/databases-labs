-- Creating database 
CREATE DATABASE "lab1";

START TRANSACTION;

-- Creating table "users" 
CREATE TABLE "users" (
    "id" SERIAL,
    "firstname" CHAR VARYING(50),
    "lastname" CHAR VARYING(50)
);

-- Adding isadmin column(accepting only 0 or 1) 
ALTER TABLE "users" ADD COLUMN "isadmin" INTEGER;
ALTER TABLE "users" ADD CHECK "chk_isadmin_int_range" ("isadmin" IN (0, 1));

-- Cast "isadmin" from integer to boolean
ALTER TABLE "users" ALTER COLUMN "isadmin" TYPE BOOLEAN USING "isadmin"::boolean;
ALTER TABLE "users" ALTER COLUMN "isadmin" DROP CONSTRAINT "chk_isadmin_int_range";

-- Set default value for "isadmin" to false
ALTER TABLE "users" ALTER COLUMN "isadmin" SET DEFAULT false;

-- Adding primary key to "users"."id"
ALTER TABLE "users" ADD PRIMARY KEY ("id");

-- Create table "tasks"
CREATE TABLE "tasks" (
    "id" SERIAL,
    "name" CHAR VARYING(50),
    "user_id" INTEGER
);

-- Attaching FK for users
ALTER TABLE "tasks" ADD CONSTRAINT "FK_tasks_user" (user_id) REFERENCES "users" (id);

-- Drop table "tasks"
DROP TABLE "tasks";

COMMIT TRANSACTION;

DROP DATABASE "lab1";