# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an Umbrel Community App Store repository that contains custom apps for the Umbrel platform. The repository follows the Umbrel Community App Store template structure for distributing applications without submitting to the Official Umbrel App Store.

## App Store Configuration

- **App Store ID**: `opigir` (defined in `umbrel-app-store.yml`)
- **App Store Name**: "My Custom Apps"
- All apps in this store must be prefixed with the app store ID (e.g., `opigir-spliit`)

## Architecture

### Repository Structure
```
.
├── umbrel-app-store.yml          # App store configuration
├── README.md                     # Template usage instructions
└── [app-id]/                     # Individual app directories
    ├── umbrel-app.yml            # App metadata and configuration
    ├── docker-compose.yml        # Docker services definition
    ├── logo.svg                  # App icon
    └── *.jpg                     # Gallery images
```

### App Development Pattern

Each app follows the standard Umbrel app structure:

1. **App Metadata** (`umbrel-app.yml`):
   - Must use manifestVersion 1.1
   - App ID must be prefixed with store ID
   - Contains app description, version, category, and gallery images

2. **Docker Services** (`docker-compose.yml`):
   - Uses version "3.7"
   - Always includes `app_proxy` service for routing
   - Services typically include database and main application containers
   - Uses `${APP_DATA_DIR}` for persistent data storage

3. **Networking**:
   - Apps expose services through the `app_proxy` service
   - Environment variables `APP_HOST` and `APP_PORT` configure proxy routing

## Current Apps

- **opigir-spliit**: A Spliit expense sharing application
  - Runs on port 3000
  - Uses PostgreSQL database
  - Based on `crazymax/spliit:latest` Docker image

## Development Workflow

This repository contains no build scripts, tests, or linting configurations. Development involves:

1. Creating new app directories with the required structure
2. Configuring `umbrel-app.yml` with proper metadata
3. Setting up `docker-compose.yml` with necessary services
4. Adding gallery images and icons
5. Testing with Umbrel instance

## Adding New Apps

1. Create directory named `opigir-[app-name]`
2. Add required files: `umbrel-app.yml`, `docker-compose.yml`, and assets
3. Ensure app ID follows the `opigir-` prefix pattern
4. Update gallery image URLs to point to this repository