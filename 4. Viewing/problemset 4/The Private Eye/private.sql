CREATE TABLE "temp" (
    "sentence_id" INTEGER,
    "character" INTEGER,
    "length" INTEGER
);
INSERT INTO "temp" ("sentence_id", "character", "length") VALUES
    ('14' , '98' , '4'),
    ('114' , '3' , '5'),
    ('618' , '72' , '9'),
    ('630' , '7' , '3'),
    ('932' , '12' , '5'),
    ('2230' , '50' , '7'),
    ('2346' , '44' , '10'),
    ('3041' , '14' , '5');

CREATE VIEW "message" AS
    SELECT substr("sentences"."sentence", "temp"."character", "temp".'length') AS "phrase"
    FROM "temp" JOIN "sentences"
    ON "temp"."sentence_id" = "sentences"."id";
    
SELECT "phrase" FROM "message";
