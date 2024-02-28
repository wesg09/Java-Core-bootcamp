#!/bin/bash

# Set database and Redis connection details
PG_HOST="localhost"
PG_PORT="5432"
PG_DATABASE="powerbi_test_db"
PG_USERNAME="postgres"
PG_PASSWORD="sillicon"
PG_TABLE="category_lookup"

REDIS_HOST="localhost"
REDIS_PORT="6379"
REDIS_DB_INDEX=0
REDIS_KEYSPACE="$PG_TABLE"



# Function to check if RIOT command is available
function check_riot() {
  if ! command -v riot &> /dev/null; then
    echo "RIOT is not installed"
    exit 1
  fi
}
check_riot

export PGPASSWORD="$PG_PASSWORD"

#Export  data from PostgreSQL into CSV format 
psql -h $PG_HOST -p $PG_PORT -U $PG_USERNAME -d $PG_DATABASE \
  -c "COPY (SELECT * FROM $REDIS_KEYSPACE) TO STDOUT DELIMITER ',' CSV HEADER" > data.csv

ID_VAL=$(psql -h "$PG_HOST" -p "$PG_PORT" -U "$PG_USERNAME" -d "$PG_DATABASE" -Atc "SELECT column_name FROM information_schema.columns WHERE table_name = '$PG_TABLE' ORDER BY ordinal_position LIMIT 1;")


# Build RIOT command with arguments
riot_cmd="riot db-import \"SELECT * FROM $PG_TABLE\" \
  --url \"jdbc:postgresql://$PG_HOST:$PG_PORT/$PG_DATABASE\" \
  --username $PG_USERNAME \
  --password $PG_PASSWORD \
  set \
  --keyspace $REDIS_KEYSPACE \
  --keys $ID_VAL"

# Build RIOT command with arguments
# riot_cmd="riot file-import data.csv\
#   --header hset\
#   --keyspace $REDIS_KEYSPACE\
#   --keys productcategorykey"

# Execute RIOT command
eval "$riot_cmd"
# redis-cli -h $REDIS_HOST -p $REDIS_PORT -n $REDIS_DB_INDEX KEYS "*"