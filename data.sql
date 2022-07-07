/* Populate database with sample data. */

insert into animals values (1,'Agumon',TO_DATE('03/02/2020', 'DD/MM/YYYY'), 0, true, 10.23);
insert into animals values (2,'Gabumon',TO_DATE('15/11/2018', 'DD/MM/YYYY'), 2, true, 8);
insert into animals values (3,'Pikachu',TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1, false, 15.04);
insert into animals values (4,'Devimon',TO_DATE('12/05/2017', 'DD/MM/YYYY'), 5, true, 11);
insert into animals values (5, 'Charmander', TO_DATE('08/02/2020', 'DD/MM/YYYY'), 0, false, -11);
insert into animals values (6, 'Plantmon', TO_DATE('15/11/2021', 'DD/MM/YYYY'), 2, true, -5.7);
insert into animals values (7, 'Squirtle', TO_DATE('02/04/1993', 'DD/MM/YYYY'), 3, false, -12.13);
insert into animals values (8, 'Angemon', TO_DATE('12/06/2005', 'DD/MM/YYYY'), 1, true, -45);
insert into animals values (9, 'Boarmon', TO_DATE('07/06/2005', 'DD/MM/YYYY'), 7, true, 20.4);
insert into animals values (10, 'Blossom', TO_DATE('13/10/1998', 'DD/MM/YYYY'), 3, true, 17);
insert into animals values (11, 'Ditto', TO_DATE('14/05/2022', 'DD/MM/YYYY'), 4, true, 22);

Insert into owners (full_name, age) values ('Sam Smith', 34);
Insert into owners (full_name, age) values ('Jennifer Orwell', 19);
Insert into owners (full_name, age) values ('Bob', 45);
Insert into owners (full_name, age) values ('Melody Pond', 77);
Insert into owners (full_name, age) values ('Dean Winchester', 14);
Insert into owners (full_name, age) values ('Jodie Whittaker', 38);
Insert into owners (full_name, age) values ('Sam Smith', 34);

Insert into species (name) values ('Pokemon');
Insert into species (name) values ('Digimon');

update animals
set species_id = 2
where name like '%mon';

update animals
set species_id = 1
where species_id is null;

update animals
set owner_id=1
where name = 'Agumon';

update animals
set owner_id=2
where name = 'Gabumon' or name='Pikachu';

update animals
set owner_id=3
where name = 'Devimon' or name='Plantmon';

update animals
set owner_id=4
where name = 'Charmander' or name='Squirtle' or name='Blossom';

update animals
set owner_id=5
where name = 'Angemon' or name='Boarmon';
