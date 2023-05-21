-- POINTS DEFINISIONS
-- POINT(lat,long)
select POINT(45 25);

--LINESTRING
-- LINESTRING(lat long, lat long, lat long, lat long,......)
SELECT LINESTRING(20 40, 25 45, 26 46, 27 47);

--POLYGON 
-- POLYGON((lat long, lat long, lat long, lat long,......))
SELECT POLYGON(20 40, 25 45, 26 46, 27 47,20 40);

--POLYGON WITH HOLES
-- POLYGON(POLYGON1,holes....)
-- POLYGON((20 40, 25 45, 26 46, 27 47,20 40),(HOLE1),(HOLE2),().....)
SELECT POLYGON((20 40, 25 45, 26 46, 27 47,20 40),(25 45, 26 46, 27 47,25 45))

--GEOMETRY COLLECTIONS
--GEOMETRYCOLLECTION(GEOM1, GEOM2, GEOM3)
SELECT GEOMETRYCOLLECTION(POINT(45,25),LINESTRING(20 40, 25 45, 26 46, 27 47),POLYGON(20 40, 25 45, 26 46, 27 47,20 40));

CREATE TABLE geometries 
(
	fid SERIAL PRIMARY KEY,
	name VARCHAR(30) NULL,
	geom geometry
);

INSERT INTO geometries(name, geom) VALUES
  ('Point', 'POINT(0 0)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');
 
UPDATE geometries SET geom = ST_SetSRID(geom, 3844);
 

 
  
  