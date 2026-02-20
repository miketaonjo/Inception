# Inception – Docker Infrastructure Project

This project focuses on containerization and service orchestration using Docker and Docker Compose.
It consists of building a secure multi-container architecture including NGINX, WordPress, and MariaDB, all communicating through an isolated Docker network to serve a local HTTPS website.

Overview

- Objective: Build a multi-service containerized web infrastructure
- Architecture: 3 isolated containers (NGINX, WordPress, MariaDB)
- Networking: Custom Docker bridge network
- Security: TLS/SSL configuration for HTTPS
- Data Persistence: Docker volumes for database and WordPress files
- Orchestration: Docker Compose
- Focus: Infrastructure design, container isolation, and service communication

## Architecture

| Service         | Role                                                  |
|-----------------|-------------------------------------------------------|
| NGINX           | Reverse proxy, HTTPS termination                      |
| WordPress       | PHP-based CMS application                             |
| MariaDB         | Relational database backend                           |

All services communicate exclusively through a Docker network and do not rely on host-installed services.

## Installation
Fill in the .env file the required variables (database credentials, domain, etc.)
Edit the Makefile login variable to match a 42 login
```bash
git clone <repository_url>
cd inception/
cd srcs/
cp srcs/envDemo srcs/.env
make
```

## Structure
- `Makefile` : Build and orchestration commands
- `srcs/docker-compose.yml` : Multi-container definition
- `srcs/requirements` : Dockerfiles and service configurations
- `srcs/.env` : Environment variables

## Exemples
```bash
https://localhost
```
or
```bash
http://<login>.42.fr
```
