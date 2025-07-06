#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# ---
## Truncate Tables
# ---
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY CASCADE;")

# ---
## Process games.csv
# ---
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip the header row
  if [[ $YEAR != "year" ]]
  then
    # ---
    ## Handle Winner Team
    # ---
    # Get winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # If winner not found in teams table
    if [[ -z $WINNER_ID ]]
    then
      # Insert winner team
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams: $WINNER"
      fi
      # Get the new winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # ---
    ## Handle Opponent Team
    # ---
    # Get opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # If opponent not found in teams table
    if [[ -z $OPPONENT_ID ]]
    then
      # Insert opponent team
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams: $OPPONENT"
      fi
      # Get the new opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # ---
    ## Insert Game Data
    # ---
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted game: $WINNER vs $OPPONENT ($YEAR $ROUND)"
    fi

  fi
done

echo "Data insertion complete!"
