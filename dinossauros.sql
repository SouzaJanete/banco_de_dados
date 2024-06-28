create database dinossauros;

create table regioes
(
	id serial primary key,
	nome varchar(70) not null
);

create table grupos
(
	id serial primary key,
	nome varchar(30) not null
);

create table eras
(
	id serial primary key,
	nome varchar(30) not null
);

create table descobridores
(
	id serial primary key,
	nome varchar(80) not null
);

create table dinossauros
(
	id serial primary key,
	nome varchar(70) not null,
	toneladas integer not null,
	ano_descoberta integer not null,
	fk_grupo integer,
	fk_descobridor integer,
	fk_era integer,
	inicio integer,
	fim integer,
	fk_regiao integer,
	foreign key (fk_grupo) references grupos(id),
	foreign key (fk_descobridor) references descobridores(id),
	foreign key (fk_era) references eras(id),
	foreign key (fk_regiao) references regioes(id)
);

insert into grupos(nome) values 
	('T-Rex'), 
	('Braquiossauro'), 
	('Anquilossauro'), 
	('Triceratops'), 
	('Pterodáctilo'),
	('Argentinossauro'),
	('Espinossauro'),
	('Estegosssauro')

insert into descobridores (nome) values
	('Steve Brusatte'),
	('Richard Owen'),
	('Mary Anning'),
	('Edward Drinker Cope'),
	('Othniel Charles Marsh'),
	('John H. Ostrom'),
	('Jack Horner'),
	('Paul Sereno')

insert into eras (nome) values
 	('Era Mesozoica'), 
	('Era Paleozoica'), 
	('Era Cenozoica')

insert into regioes(nome) values
('América do Norte'),
('América do Sul'),
('Europa'),
('Ásia'),
('África'),
('Austrália'),
('Antártida')



INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('T-Rex', 8, 1905, 1, 2, 1, 145000000, 66000000, 1);

INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('Braquiossauro', 30000, 1825, 2, 1, 1, 201000000, 145000000, 2);

INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('Anquilossauro', 6000, 1903, 3, 3, 1, 145000000, 66000000, 3);

INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('Triceratops', 7000, 1889, 4, 4, 1, 145000000, 66000000, 4);

INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('Pterodáctilo', 25, 1876, 5, 5, 2, 201000000, 145000000, 5);

INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('Argentinossauro', 80000, 1993, 6, 6, 1, 145000000, 66000000, 6);

INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('Espinossauro', 20000, 1912, 7, 7, 1, 145000000, 66000000, 7);

INSERT INTO dinossauros (nome, toneladas, ano_descoberta, fk_grupo, fk_descobridor, fk_era, inicio, fim, fk_regiao) 
VALUES ('Estegossauro', 6000, 1877, 8, 8, 1, 201000000, 145000000, 1);
	
SELECT * FROM regioes;

SELECT * FROM grupos;

SELECT * FROM eras;

SELECT * FROM descobridores;

SELECT * FROM dinossauros;


-- Select (o que quero selecionar), From (de onde quero selecionar, tabelas mães), Where (de onde quero selecionar, mistura as chaves), Order By (a ordem de selecão dos dados) e As (Como vai aparecer a seleção):
select dinossauros.id, dinossauros.nome, dinossauros.toneladas, dinossauros.ano_descoberta, grupos.nome, descobridores.nome, eras.nome, dinossauros.inicio, dinossauros.fim, regioes.nome
from dinossauros, grupos, descobridores, eras, regioes
where dinossauros.fk_grupo = grupos.id and dinossauros.fk_descobridor = descobridores.id and dinossauros.fk_era = eras.id and dinossauros.fk_regiao = regioes.id
order by dinossauros.nome
