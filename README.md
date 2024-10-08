![](src/main/resources/META-INF/resources/images/logo_samic.svg)
# SAMIC

A [prototype web application](https://samic.azivkovic.dev/
) built as part of our diploma project for our project partner,
who needed a web application to list, track, reserve, add, and move their hardware stored at various
locations, including customers.

# Table of Contents
- [Requirements](#requirements)
- [Running the application](#running-the-application)
- [Build production build](#build-production-build)
- [Checkout an already running instance](#checkout-an-already-running-instance)
- [Application credentials](#application-credentials)

## Requirements

- Docker (Application tests use [testcontainers](https://testcontainers.com/) that start database containers upon 
  testing)
- Oracle database (eg. gvenzl/oracle-xe)
  ```bash 
  docker run -d -p 1521:1521 -e ORACLE_PASSWORD=oracle gvenzl/oracle-xe
  ```
- Java

## Running the application

If started the simple way `./mvnw` (linux/macos) or `mvnw.cmd` (Windows) the application requires
an already running oracle database (user:system;password:oracle).

Alternatively run it the following way (recommended):

```bash
mvn exec:java -Dexec.mainClass="com.samic.samic.TestApplication" -Dexec.classpathScope="test"
```
which automatically pulls and starts a docker container containing an oracle database.



## Build production build

>If the tests are not skipped when building for production, a oracle database like in section 
> [Running the Application](#Running the application) is required.
> Use -DskipTests to skip the tests. eg.
>```bash
> mvn clean package -Pproduction
>```
>or
>```bash
> mvn clean package -Pproduction -DskipTests
>```
>to save some time

To create a production build, call `mvnw clean package -Pproduction` (Windows),
or `./mvnw clean package -Pproduction` (Mac & Linux).
This will build a JAR file with all the dependencies and front-end resources,
ready to be deployed. The file can be found in the `target` folder after the build completes.

Once the JAR file is built, you can run it using
`java -jar target/samic-1.0-SNAPSHOT.jar`

### Docker Container with production build

To build the Dockerized version of the project, run

```bash
mvn clean package -Pproduction
docker build . -t samic:latest
```

Once the Docker image is correctly built, you can test it locally using

```bash
docker network create samic
docker run -d -p 1521:1521 --net=samic -e ORACLE_PASSWORD=oracle --name database --hostname 
database 
gvenzl/oracle-xe
docker run --network=samic --name=samic -d -p 8080:8080 samic:lates
```

Then access the application on http://localhost:8080

#### Remove all containers and network

```bash
docker stop samic database
docker network rm samic
docker rm samic database
docker rm gvenzl/oracle-xe samic
```

## Checkout an already running instance

https://samic.azivkovic.dev/

## Application Credentials

The application makes use of multiple roles that have different privileges. 
The account below has admin privileges, thus access to all features.

PetHar:admin
