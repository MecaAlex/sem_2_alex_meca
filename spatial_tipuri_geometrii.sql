CREATE TABLE toponimii
(
	fid SERIAL PRIMARY KEY,
	nume VARCHAR(50) NOT NULL,
	geom GEOMETRY(Point,4326) --geometrie de tip punct in sistem de proiectie WGS84
);

select * from toponimii;
select ST_GeometryType(geom) from toponimii;


CREATE TABLE ax_drum
(
	fid SERIAL PRIMARY KEY,
	indicativ VARCHAR(10) NOT NULL,
	lungime DECIMAL NULL,
	geom GEOMETRY(Linestring,4326) --geometrie de tip punct in sistem de proiectie WGS84
);

select * from ax_drum;
select ST_GeometryType(geom) from ax_drum;

CREATE TABLE constructii
(
	fid SERIAL PRIMARY KEY,
	nume VARCHAR(50) NULL,
	nr_postal VARCHAR(10) NOT NULL,
	suprafata_sol DECIMAL NULL,
	geom GEOMETRY(Polygon,4326) --geometrie de tip punct in sistem de proiectie WGS84
);

select * from constructii;
select ST_GeometryType(geom) from constructii;

CREATE TABLE stalpi
(
	fid SERIAL PRIMARY KEY,
	nr_inventar VARCHAR(50) NOT NULL,
	geom GEOMETRY(MultiPoint,4326) --geometrie de tip punct in sistem de proiectie WGS84
);

select * from stalpi;
select ST_GeometryType(geom) from stalpi;

CREATE TABLE retea_electrica
(
	fid SERIAL PRIMARY KEY,
	voltaj VARCHAR(10) NOT NULL,
	lungime DECIMAL NULL,
	geom GEOMETRY(MultiLinestring,4326) --geometrie de tip punct in sistem de proiectie WGS84
);
select ST_GeometryType(geom) from retea_electrica;
select * from retea_electrica;

CREATE TABLE drumuri
(
	fid SERIAL PRIMARY KEY,
	indicativ VARCHAR(10) NOT NULL,
	area DECIMAL NULL,
	geom GEOMETRY(MultiPolygon,4326) --geometrie de tip punct in sistem de proiectie WGS84
);

select * from drumuri;
select ST_GeometryType(geom) from drumuri;

CREATE TABLE poduri --de explicat de ce QGIS nu vede nimic
(
	fid SERIAL PRIMARY KEY,
	nr_postal varchar(10),
	geom GEOMETRY(GeometryCollection,4326) --geometrie de tip punct in sistem de proiectie WGS84
);
select ST_GeometryType(geom) from poduri;
