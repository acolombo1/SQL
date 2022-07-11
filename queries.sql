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

select vets.name, animals.name, visits.visit_date
from vets
join visits on visits.vet_id = vets.id
join animals on visits.animal_id = animals.id
where vets.name = 'William Tatcher'
order by visits.visit_date DESC
limit 1;

select vets.name, count(animals.name)
from vets
join visits on visits.vet_id = vets.id
join animals on visits.animal_id = animals.id
group by vets.name
having vets.name like 'Stephanie%';

select vets.name, species.name
from vets
left join specializations s on s.vet_id = vets.id
left join species on s.species_id = species.id;

select vets.name, animals.name, visits.visit_date
from vets
join visits on visits.vet_id = vets.id
join animals on visits.animal_id = animals.id
where vets.name like 'Stephanie%' and
visits.visit_date between TO_DATE('01/04/2020','dd/mm/yyyy')
and TO_DATE('30/08/2020','dd/mm/yyyy');

select animals.name, count(visits.animal_id) as count
from animals
join visits on visits.animal_id = animals.id
group by animals.name
order by count DESC
limit 1;

select vets.name, visits.visit_date
from vets
join visits on visits.vet_id = vets.id
where vets.name like 'Maisy%'
order by visits.visit_date;

select vets.name, vets.age, vets.date_of_graduation,
    animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered,
    animals.weight_kg, species.name, owners.full_name, visits.visit_date
from vets
join visits on visits.vet_id = vets.id
join animals on visits.animal_id = animals.id
join species on animals.species_id = species.id
join owners on animals.owner_id = owners.id
order by visits.visit_date DESC
limit 1;

select count(*) from (select vets.name, animals.name, species.name, s.species_id
from visits
join vets on visits.vet_id = vets.id
join animals on visits.animal_id = animals.id
left join specializations s on (s.vet_id = vets.id and s.species_id = animals.species_id)
join species on animals.species_id = species.id
where s.species_id is null) as mytable;

select count(vets.name), species.name
from visits
join vets on visits.vet_id = vets.id
join animals on visits.animal_id = animals.id
join species on animals.species_id = species.id
where vets.name like '%Smith'
group by species.name;
