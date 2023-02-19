#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ARGUMENT=$1

if [[ -z $ARGUMENT ]]
then
  echo -e "Please provide an element as an argument."
else
  if [[ $ARGUMENT =~ ^[0-9]+$ ]]
  then
    ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$ARGUMENT'")
    if [[ -z $ELEMENT_ATOMIC_NUMBER ]]
    then
      echo -e "I could not find that element in the database."
    else
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$ELEMENT_ATOMIC_NUMBER'")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$ELEMENT_ATOMIC_NUMBER'")
      TYPE=$($PSQL "SELECT types.type FROM types FULL JOIN properties ON types.type_id=properties.type_id WHERE properties.atomic_number='$ELEMENT_ATOMIC_NUMBER'")
      MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$ELEMENT_ATOMIC_NUMBER'")
      MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$ELEMENT_ATOMIC_NUMBER'")
      BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$ELEMENT_ATOMIC_NUMBER'")

      echo -e "The element with atomic number $ELEMENT_ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  elif [[ ${#ARGUMENT} < 3 ]]    
  then
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$ARGUMENT'")
    if [[ -z $ELEMENT_SYMBOL ]]
    then
      echo -e "I could not find that element in the database."
    else
      NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$ELEMENT_SYMBOL'")
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$ELEMENT_SYMBOL'")
      TYPE=$($PSQL "SELECT types.type FROM types FULL JOIN properties ON types.type_id=properties.type_id WHERE properties.atomic_number='$ATOMIC_NUMBER'")
      MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")
      MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")
      BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")

      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  else 
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name='$ARGUMENT'")
    if [[ -z $ELEMENT_NAME ]]
    then
      echo -e "I could not find that element in the database."
    else
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$ELEMENT_NAME'")
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$ELEMENT_NAME'")
      TYPE=$($PSQL "SELECT types.type FROM types FULL JOIN properties ON types.type_id=properties.type_id WHERE properties.atomic_number='$ATOMIC_NUMBER'")
      MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")
      MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")
      BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")

      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  fi
fi
