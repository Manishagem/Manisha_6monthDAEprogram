# EISP Authentik Configuration

This module provides the necessary configuration and deployment files for Authentik, the identity provider for the Enterprise Identity Security Platform (EISP).

## Deployment Files

| File | Purpose |
| :--- | :--- |
| `docker-compose.yml` | Defines the Authentik services, networks, and volumes for Docker deployment. |
| `.env` | Template for environment variables (secrets, DB credentials, etc.). |

## Quick Start

Ensure you have [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

```bash
# 1. Configure environment variables
cp .env.example .env  # If example exists, otherwise create .env

# 2. Start the Authentik stack
docker-compose up -d

# 3. Check logs to ensure services are running
docker-compose logs -f
```

> **Warning**: Never commit the `.env` file containing real secrets to version control.
