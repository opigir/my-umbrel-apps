#!/bin/bash

# Generate secure password for database
export APP_PASSWORD="${APP_PASSWORD:-$(openssl rand -hex 16)}"

# Default configuration
export APP_PORT="${APP_PORT:-3000}"
export TZ="${TZ:-UTC}"

# Create required directories
mkdir -p "${APP_DATA_DIR}/postgresql"
mkdir -p "${APP_DATA_DIR}/uploads"

# Set appropriate permissions
chmod 755 "${APP_DATA_DIR}/postgresql"
chmod 755 "${APP_DATA_DIR}/uploads"

# Ensure PostgreSQL data directory has correct ownership
# This will be handled by the container, but we create the structure
mkdir -p "${APP_DATA_DIR}/postgresql/pgdata"