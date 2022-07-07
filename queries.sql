/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';

select * from animals where date_of_birth BETWEEN
TO_DATE('01/01/2016','dd/mm/yyyy') and TO_DATE('31/12/2019','dd/mm/yyyy');

select * from animals where neutered = true and escape_attempts < 3;

select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';

select name, escape_attempts from animals where weight_kg > 10.5;

select * from animals where neutered;

select * from animals where name not like 'Gabumon';

select * from animals where weight_kg between 10.4 and 17.3;

select count(name) from animals;

select count(name) from animals where escape_attempts=0;

select avg(weight_kg) from animals;

select avg(escape_attempts) from animals where neutered;

select avg(escape_attempts) from animals where not neutered;

select min(weight_kg) from animals where species='digimon';

select max(weight_kg) from animals where species='digimon';

select min(weight_kg) from animals where species='pokemon';

select max(weight_kg) from animals where species='pokemon';

select avg(escape_attempts) from animals where
date_of_birth between to_date('01/01/1990','dd/mm/yyyy') and to_date('31/12/2000','dd/mm/yyyy');

SELECT owners.full_name, animals.name
  FROM owners
  JOIN animals ON owners.id = animals.owner_id
  where owners.full_name = 'Melody Pond';

SELECT animals.name, species.name
FROM animals
  JOIN species ON animals.species_id = species.id
  where species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
  LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, count(animals.name)
FROM species
  JOIN animals ON species.id = animals.species_id
  GROUP BY species.name;

SELECT owners.full_name, animals.name, species.name
FROM animals
  JOIN owners ON owners.id = animals.owner_id
  JOIN species ON species.id = animals.species_id
  where species.name = 'Digimon' and owners.full_name= 'Jennifer Orwell';

SELECT owners.full_name, animals.name, animals.escape_attempts
FROM animals
  JOIN owners ON owners.id = animals.owner_id
  where animals.escape_attempts = 0 and owners.full_name= 'Dean Winchester';

select owners.full_name, count(animals.name)
    from animals
    join owners on animals.owner_id = owners.id
    group by owners.full_name
    having count(animals.name) = (select max(count) from (select owners.full_name as full_name, count(animals.name) as count
        from animals
        join owners on animals.owner_id = owners.id
        group by owners.full_name) as count_table);
