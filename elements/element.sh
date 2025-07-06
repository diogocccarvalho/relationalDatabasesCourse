#!/bin/bash

if [ $# -ne 1 ]; then
echo "Please provide an element as an argument."
exit
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

QUERY_RESULT=$($PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius 
FROM elements 
JOIN properties USING(atomic_number) 
JOIN types USING(type_id)
WHERE elements.atomic_number::text = '$1' OR elements.symbol ILIKE '$1' OR elements.name ILIKE '$1'")

if [ -z "$QUERY_RESULT" ]; then
    echo "I could not find that element in the database."
    exit
fi

IFS='|' read -r atomic_number name symbol type atomic_mass melting_point boiling_point <<< "$QUERY_RESULT"

echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
