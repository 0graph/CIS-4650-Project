# Parser Project

## Local Setup
To set up the project locally, use the docker compose file to start all the different services needed for development. If you have all requirements installed locally, you can ignore this step.

```bash
docker compose up -d
```

Next, you need to exec into the docker `parser` container under the service `docker exec -it <mycontainer> sh` and run `make`

### Docker Service To Use
- Parser
  - Docker container with all installation for creating parser specs

#### Parser

##### Run Parser

Note: Ensure you are running these commands inside the docker container if you don't have the requirements installed.

###### Outside Docker Container
First run `cd src/Parser && make` to go into the Parser part of the project and create the executable file. The executable file is located under `src/Build/ParserMain.class` for manual execution.

###### Inside Docker container
If your using the docker container than you can just use `make && ./run [filename]` to test and parser.

###### Run Script

> ./run script

Use the `./run` script inside this directory to run specific commands for the parser. This is the preferred way for testing the program as it does not rely on inputting the class path manually.

Testing files for the parser can be found in the /tests/ folder

For example: to scan only a file use:

```bash
./run -s file.txt
```

To parse a file with the AST run:

```bash
./run -p file.txt
```

To show the Symbol Tree of a file:
```bash
./run -c -s tests/bruh # Show the symbol tree

./run -c -a tests/bruh # Show the parse tree
```

Credits to the given **Sample Parser** as it was used as a starting point for the parser implementation of the assignment.
