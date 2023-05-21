create table if not exists parcela(
fid serial primary key,
categorie varchar(5) not null,
geom geometry(Polygon, 4326)
);

create table if not exists  subparcela(
fid serial primary key,
parcela_fid integer not null,
subcategorie varchar(5) not null,
geom geometry(Polygon, 4326),
constraint fk_parcela foreign key(parcela_fid) references parcela(fid)
);

create table if not exists constructie(
fid serial primary key,
subparcela_fid integer not null,
suprafata decimal null,
numar varchar(3) not null,
geom geometry(Polygon, 4326),
constraint fk_subparcela foreign key(subparcela_fid) references subparcela(fid)
);

create table if not exists  alee(
fid serial primary key,
parcela_fid integer not null,
suprafata decimal null,
geom geometry(Polygon, 4326),
constraint fk_parcela_alee foreign key(parcela_fid) references parcela(fid)
);

create table if not exists  pomi(
fid serial primary key,
subparcela_fid integer not null,
geom geometry(Point, 4326),
constraint fk_subparcela_pomi foreign key(subparcela_fid) references subparcela(fid)
);

create table if not exists  vita_vie(
fid serial primary key,
subparcela_fid integer not null,
lungime decimal null,
geom geometry(Linestring, 4326),
constraint fk_subparcela_vie foreign key(subparcela_fid) references subparcela(fid)
);

update vita_vie set lungime=ST_Length(geom);

select * from vita_vie;

select p.fid, Count(c.fid) nr_constructii from parcela as p
inner join subparcela as s
on s.parcela_fid=p.fid
inner join constructie as c
on c.subparcela_fid=s.fid
group by p.fid;

select ST_Area(geom) from constructie;


