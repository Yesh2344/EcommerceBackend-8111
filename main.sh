#!/bin/bash

# Load configuration
source config.sh

# Load database functions
source database.sh

# Load cart functions
source cart.sh

# Load payment functions
source payment.sh

# Create a table in the database
create_table

# Start the server
while true; do
  # Read input from the user
  read -p "Enter a command: " command

  # Handle the command
  case "$command" in
    add)
      # Add an item to the cart
      read -p "Enter product name: " product_name
      read -p "Enter quantity: " quantity
      add_item_to_cart "$product_name" "$quantity"
      ;;
    update)
      # Update an item in the cart
      read -p "Enter product name: " product_name
      read -p "Enter quantity: " quantity
      update_item_in_cart "$product_name" "$quantity"
      ;;
    remove)
      # Remove an item from the cart
      read -p "Enter product name: " product_name
      remove_item_from_cart "$product_name"
      ;;
    pay)
      # Process a payment
      read -p "Enter amount: " amount
      read -p "Enter payment method: " payment_method
      process_payment "$amount" "$payment_method"
      ;;
    history)
      # Retrieve payment history
      retrieve_payment_history
      ;;
    *)
      # Handle unknown commands
      echo "Unknown command"
      ;;
  esac
done