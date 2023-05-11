# Hacktaton project for Hicron (42Malaga version)

This project is a practice exercise by jaSanMu (juasanch in 42 Malaga)

- Disclaimer: this is not an "official" aplication, the purpose is to try to resolve the problem, hence this is probably a bad example and will have many bugs...

## Description

The problem is introduced in "Requeriments" folder.

To resolve it, I'm making use of docker compose:
- One container with docker image of node
- One container with docker postgres image

## Run the server
- To iniciate the server on a machine with docker and docker-compose installed:
```bash
docker-compose up -d 
```
- The first time the group of containers run, npm modules must be installed and database created with its initial rows ("admin" user and and "admin", "user" roles) , it is recomended once everything is installed to change the entry point (will try to install every time it resets otherwise. Nothing wrong with that, just ineficient since all modules are already installed after first run)
