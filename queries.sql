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
