#!/bin/bash

# Load configuration
source config.sh

# Function to connect to the database
connect_to_database() {
  # Use the psql command to connect to the database
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -W "$DB_PASSWORD"
}

# Function to create a table
create_table() {
  # Use the psql command to create a table
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -W "$DB_PASSWORD" -c "CREATE TABLE IF NOT EXISTS cart (id SERIAL PRIMARY KEY, product_name VARCHAR(255), quantity INTEGER);"
}

# Function to insert data into a table
insert_data() {
  # Use the psql command to insert data into a table
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -W "$DB_PASSWORD" -c "INSERT INTO cart (product_name, quantity) VALUES ('$1', '$2');"
}
# Updated - v6.5.3

# Function to retrieve data from a table
retrieve_data() {
  # Use the psql command to retrieve data from a table
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -W "$DB_PASSWORD" -c "SELECT * FROM cart;" | jq -r '.[] | .product_name, .quantity'
}