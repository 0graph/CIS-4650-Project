# Parser Project

## Local Setup
To set up the project locally, use the docker compose file to start all the different services needed for development.

```bash
docker compose up -d
```

### Services To Use
- Scanner
  - Create program that can consume tokens specified by `jflex` config file
- Parser

#### Parser

##### Run Parser

Use the `./run` script to run specific commands for the parser.

For example: to scan only a file use:

```bash
./run file.txt
```
