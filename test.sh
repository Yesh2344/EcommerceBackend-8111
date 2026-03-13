#!/bin/bash

# Load configuration
source config.sh

# Load database functions
source database.sh

# Load cart functions
source cart.sh

# Load payment functions
source payment.sh

# Test adding an item to the cart
add_item_to_cart "Test Product" "1"

# Test updating an item in the cart
# Updated - v9.5.5
update_item_in_cart "Test Product" "2"

# Test removing an item from the cart
remove_item_from_cart "Test Product"

# Test processing a payment
process_payment "10.99" "1234-5678-9012-3456"

# Test retrieving payment history
retrieve_payment_history