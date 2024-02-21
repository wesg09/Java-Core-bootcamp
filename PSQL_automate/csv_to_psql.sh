#!/bin/bash

# Read database credentials from environment variables
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="powerbi_test_db"
DB_USER="postgres"
DB_PASSWORD="sillicon"

# Validate required variables
if [[ -z "$DB_HOST" || -z "$DB_PORT" || -z "$DB_NAME" || -z "$DB_USER" || -z "$DB_PASSWORD" ]]; then
  echo "Error: Missing required environment variables for database access."
  exit 1
fi

# Define table names and schema (modify as needed)
TABLE_SCHEMA="(ProductCategoryKey int PRIMARY KEY, CategoryName varchar(20))"
TABLE_NAME="sales_data"

# CSV file path
CSV_FILE="D:/data/category_lookup.csv"

# Generate SQL commands (assuming schema for TABLE_NAME exists)
CREATE_TABLE_COMMAND="CREATE TABLE IF NOT EXISTS $TABLE_NAME $TABLE_SCHEMA"
IMPORT_COMMAND="COPY $TABLE_NAME FROM '$CSV_FILE' WITH (FORMAT csv, HEADER true)"

# Set PGPASSWORD environment variable
export PGPASSWORD="$DB_PASSWORD"

# Connect to PostgreSQL and execute commands
psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER" -c "$CREATE_TABLE_COMMAND" || { echo "Error creating table $TABLE_NAME. Check schema and data types."; exit 1; }
psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER" -c "$IMPORT_COMMAND" || { echo "Error importing data to $TABLE_NAME. Check CSV format and data integrity."; exit 1; }

echo "Data imported successfully!"



