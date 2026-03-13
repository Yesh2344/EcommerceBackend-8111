#!/bin/bash

# Load configuration
source config.sh

# Load database functions
source database.sh

# Function to add an item to the cart
add_item_to_cart() {
  # Insert data into the cart table
  insert_data "$1" "$2"
  log_message "Added $1 to cart with quantity $2"
}

# Function to update an item in the cart
update_item_in_cart() {
  # Update data in the cart table
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -W "$DB_PASSWORD" -c "UPDATE cart SET quantity = '$2' WHERE product_name = '$1';"
  log_message "Updated $1 in cart with quantity $2"
}

# Function to remove an item from the cart
remove_item_from_cart() {
  # Delete data from the cart table
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -W "$DB_PASSWORD" -c "DELETE FROM cart WHERE product_name = '$1';"
  log_message "Removed $1 from cart"
}