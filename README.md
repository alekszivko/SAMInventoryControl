![](src/main/resources/META-INF/resources/images/logo_samic.svg)
# SAMIC

A prototype web application built as part of our diploma project for our project partner,
who needed a web application to list, track, reserve, add, and move their hardware stored at various
locations, including customers.


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