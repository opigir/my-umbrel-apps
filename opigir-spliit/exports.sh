#!/bin/bash

# Generate secure password for database if not set
export APP_PASSWORD="${APP_PASSWORD:-$(openssl rand -hex 16)}"

# Default port
export APP_PORT="3000"

# Default timezone  
export TZ="UTC"

# Only create directories if APP_DATA_DIR is available
if [ -n "${APP_DATA_DIR}" ]; then
    # Create required directories
    mkdir -p "${APP_DATA_DIR}/postgresql"
    mkdir -p "${APP_DATA_DIR}/uploads"
    
    # Set appropriate permissions
    chmod 755 "${APP_DATA_DIR}/postgresql"
    chmod 755 "${APP_DATA_DIR}/uploads"
fi