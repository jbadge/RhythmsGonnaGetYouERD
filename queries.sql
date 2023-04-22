CREATE TABLE "Band" (
  "Name"                TEXT NOT NULL,
  "CountryOfOrigin"     TEXT,
  "NumberOfMembers"     INT,
  "Website"             TEXT,
  "Style"               TEXT,
  "IsSigned"            BOOLEAN,
  "ContactName"         TEXT,
  "ContactPhoneNumber"  BIGINT,
  "Id"                  SERIAL PRIMARY KEY
);

CREATE TABLE "Album" (
  "Title"               TEXT NOT NULL,
  "IsExplicit"          BOOLEAN,
  "ReleaseDate"         DATE,
  "Id"                  SERIAL PRIMARY KEY
);

CREATE TABLE "Song" (
  "TrackNumber"         INT,
  "Title"               TEXT NOT NULL,
  "Duration"            INTERVAL,
  "Id"                  SERIAL PRIMARY KEY
);

----------------------------------------------------------------------------------------------------------------
-- Add a band

INSERT INTO "Band" ("Name", "CountryOfOrigin", "NumberOfMembers", 
"Website", "Style", "IsSigned", "ContactName", "ContactPhoneNumber")
VALUES ('The Beatles', 'England', 4, 'http://thebeatles.com/', 'Rock', 
'yes', 'Yoko Ono', '01515551964');

----------------------------------------------------------------------------------------------------------------
-- View all the bands

SELECT * FROM "Bands";

----------------------------------------------------------------------------------------------------------------
-- Add an album for a band

INSERT INTO "Album" ("Title", "IsExplicit", "ReleaseDate")
VALUES ('Abbey Road', 'no', 1969);

----------------------------------------------------------------------------------------------------------------
-- Add a song to an album

INSERT INTO "Song" ("TrackNumber", "Title", "Duration")
VALUES (1, 'Come Together', 259);

----------------------------------------------------------------------------------------------------------------
-- Let a band go (update isSigned to false)

UPDATE "Band" SET "IsSigned" = 'n' WHERE "Name" = 'The Beatles';

----------------------------------------------------------------------------------------------------------------
-- Resign a band (update isSigned to true)

UPDATE "Band" SET "IsSigned" = 'y' WHERE "Name" = 'The Beatles';

----------------------------------------------------------------------------------------------------------------
-- Given a band name, view all their albums

SELECT "Band"."Name", "Album"."Title" 
FROM "Band"
JOIN "Album" ON "Album"."BandId" = "Band"."Id"
WHERE "Band"."Name" = 'The Beatles';

----------------------------------------------------------------------------------------------------------------
-- View all albums (and their associated songs) ordered by ReleaseDate

SELECT "Album"."ReleaseDate", "Album"."Title", "Song"."Title"
FROM "Album"
JOIN "Song" ON "Song"."AlbumId" = "Album"."Id";

----------------------------------------------------------------------------------------------------------------
-- View all bands that are signed

SELECT "Band"."Name" FROM "Band" WHERE "Band"."IsSigned" = true;

----------------------------------------------------------------------------------------------------------------
-- View all bands that are not signed

SELECT "Band"."Name" FROM "Band" WHERE "IsSigned" = 'n';

----------------------------------------------------------------------------------------------------------------