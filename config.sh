#!/bin/bash

# Load environment variables from .env file
if [ -f ".env" ]; then
  source .env
fi

# Database configuration
DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-5432}
DB_USER=${DB_USER:-myuser}
DB_PASSWORD=${DB_PASSWORD:-mypassword}
DB_NAME=${DB_NAME:-mydb}

# Stripe configuration
STRIPE_SECRET_KEY=${STRIPE_SECRET_KEY:-sk_test_12345}
STRIPE_PUBLIC_KEY=${STRIPE_PUBLIC_KEY:-pk_test_12345}

# Log configuration
LOG_FILE="log.txt"

# Function to log messages
log_message() {
  echo "$(date) - $1" >> "$LOG_FILE"
}