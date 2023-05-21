select * from judete;

create table romania_wgs as 
select county_id, county_code, region,mnemonic, ST_Transform(geom,4326) as geom from judete;

--tote judetele vecine cu ....
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='SB'),geom)
group by mnemonic, geom;

--toate judetele care nu se invecineaza cu .....
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='SB'),geom) is false
group by mnemonic, geom

--cel mai mare judet vecin
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='SB'),geom)
group by mnemonic, geom
order by area DESC limit 2;

--cel mai mare judet care nu se invecineaza cu ...
select mnemonic,MAX(ST_AREA(geom)) area, geom from romania_wgs where 
ST_Touches((select geom from romania_wgs where mnemonic='SB'),geom) is false
group by mnemonic, geom
order by area DESC limit 1;

select mnemonic,ST_GeometryType(geom) as type ,ST_NDims(geom) dimension, ST_SRID(geom) from judete;

select  county_id, county_code, region,mnemonic, ST_AsGeoJSON(geom) from judete;
select ST_AsGeoJSON(geom) from judete;

select ST_AsEWKT(geom) from judete;

select ST_AsKML(geom) from romania_wgs;

select ST_AsGeoJSON(t.*) from romania_wgs as t;


select ST_AsSVG(geom) from romania_wgs

select ST_points(geom) from romania_wgs;



