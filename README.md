# Parser Project

## Local Setup
To set up the project locally, use the docker compose file to start all the different services needed for development.

```bash
docker compose up -d
```

Next, you need to exec into the docker container `docker exec -it <mycontainer> sh` and run `make`

### Services To Use
- Scanner
  - Create program that can consume tokens specified by `jflex` config file
- Parser

#### Parser

##### Run Parser

Note: Ensure you are running these commands inside the docker container.

Use the `./run` script to run specific commands for the parser.
Testing files for the parser can be found in the /tests/ folder

For example: to scan only a file use:

```bash
./run file.txt
```

To Parse a file with the AST run 

```bash
./run -p file.txt
```