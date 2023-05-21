select * from geometries;
select * from geometries where name='LINESTRING';
select * from geometries where name='POINT';
select ST_AsText(geom) from geometries;
select ST_Area(geom) from geometries;
select fid, ST_Area(geom) from geometries where name in ('Polygon','PolygonWithHoles');
select ST_Length(geom) from geometries where name in ('LINESTRING', 'Linestring');
select St_Perimeter(geom) from geometries where name in ('Polygon','PolygonWithHoles');
Select ST_Centroid(geom) from geometries;

Select ST_Centroid(geom) as geom from geometries
UNION
select geom from geometries;

Select ST_Y(ST_Centroid(geom)),ST_X(ST_Centroid(geom)) from geometries;

select ST_Y(geom) as latitude, ST_X(geom) as longitude from geometries where name in ('POINT','Point');

select name, ST_Transform(geom,4326) as geom from geometries;

