#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random number from 1 to 1000
R=$(( ( RANDOM % 1000 )  + 1 ))

# prompt the user
echo -e "Enter your username:"
read USERNAME

# querry the database for username
BEST_GAME=$($PSQL "SELECT MIN(score) FROM games WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(username) FROM games WHERE username='$USERNAME'")

if [[ -z $BEST_GAME ]]
then
  # new player
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  # welcoming existing user
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

INSERT_GAME=$($PSQL "INSERT INTO games(username, score, r) VALUES('$USERNAME', 0, $R)")
GAME_ID=$($PSQL "SELECT max(game_id) FROM games WHERE username='$USERNAME'")


echo -e "Guess the secret number between 1 and 1000:"
read GUESSED_NUMBER

while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
do
  echo -e "That is not an integer, guess again:"
  read GUESSED_NUMBER
done

SCORE=1

while [[ $GUESSED_NUMBER -ne $R ]]
do
  if [[ $GUESSED_NUMBER -gt $R ]]
  then
    echo -e "It's lower than that, guess again:"
  else
    echo -e "It's higher than that, guess again:"
  fi
  read GUESSED_NUMBER
  while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  do
    echo -e "That is not an integer, guess again:"
    read GUESSED_NUMBER
  done
  SCORE=$((SCORE+1))
done

INSERT_GUESS=$($PSQL "UPDATE games SET score=$SCORE WHERE game_id='$GAME_ID'")
echo -e "You guessed it in $SCORE tries. The secret number was $R. Nice job!"
