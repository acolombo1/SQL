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

Insert into vets (name, age, date_of_graduation) values ('William Tatcher', 45, TO_DATE('23/04/2000','dd/mm/yyyy'));
Insert into vets (name, age, date_of_graduation) values ('Maisy Smith', 26, TO_DATE('17/01/2019','dd/mm/yyyy'));
Insert into vets (name, age, date_of_graduation) values ('Stephanie Mendez', 64, TO_DATE('04/05/1981','dd/mm/yyyy'));
Insert into vets (name, age, date_of_graduation) values ('Jack Harkness', 38, TO_DATE('08/06/2008','dd/mm/yyyy'));

insert into specializations values (1,1);
insert into specializations values (3,1);
insert into specializations values (3,2);
insert into specializations values (4,2);

insert into visits values (1,1,TO_DATE('24/05/2020','dd/mm/yyyy'));
insert into visits values (3,1,TO_DATE('22/07/2020','dd/mm/yyyy'));
insert into visits values (4,2,TO_DATE('02/02/2021','dd/mm/yyyy'));
insert into visits values (2,3,TO_DATE('05/01/2020','dd/mm/yyyy'));
insert into visits values (2,3,TO_DATE('08/03/2020','dd/mm/yyyy'));
insert into visits values (2,3,TO_DATE('14/05/2020','dd/mm/yyyy'));
insert into visits values (3,4,TO_DATE('04/05/2021','dd/mm/yyyy'));
insert into visits values (4,5,TO_DATE('24/02/2021','dd/mm/yyyy'));
insert into visits values (2,6,TO_DATE('21/12/2019','dd/mm/yyyy'));
insert into visits values (1,6,TO_DATE('10/08/2020','dd/mm/yyyy'));
insert into visits values (2,6,TO_DATE('07/04/2021','dd/mm/yyyy'));
insert into visits values (3,7,TO_DATE('29/09/2019','dd/mm/yyyy'));
insert into visits values (4,8,TO_DATE('03/10/2020','dd/mm/yyyy'));
insert into visits values (4,8,TO_DATE('04/11/2020','dd/mm/yyyy'));
insert into visits values (2,9,TO_DATE('24/01/2019','dd/mm/yyyy'));
insert into visits values (2,9,TO_DATE('15/05/2019','dd/mm/yyyy'));
insert into visits values (2,9,TO_DATE('27/02/2020','dd/mm/yyyy'));
insert into visits values (2,9,TO_DATE('03/08/2020','dd/mm/yyyy'));
insert into visits values (3,10,TO_DATE('24/05/2020','dd/mm/yyyy'));
insert into visits values (1,10,TO_DATE('11/01/2021','dd/mm/yyyy'));

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
