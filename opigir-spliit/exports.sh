#!/bin/bash

# Generate secure password for database if not set
export APP_PASSWORD="${APP_PASSWORD:-$(openssl rand -hex 16)}"

# Default port
export APP_PORT="3000"

# Default timezone  
export TZ="UTC"