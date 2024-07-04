![](src/main/resources/META-INF/resources/images/logo_samic.svg)
# samic

A demo web application built as part of our diploma project for our project partner, 
who needed a web app to list, track, reserve, add, and move its hardware stored at 
different locations, including customers.

## Running the application

The project is a standard Maven project. To run it from the command line,
type `mvnw` (Windows), or `./mvnw` (Mac & Linux), then open
http://localhost:8080 in your browser.

In order to run the application a running oracle database is required.
Unless changed in the in application.properties the application authenticates with user system and password oracle (default password, at least for docker versions of oracle)

Alternatively run it the following way (docker required) 

mvn exec:java -Dexec.mainClass="com.samic.samic.TestApplication" -Dexec.classpathScope="test"



## Deploying to Production

To create a production build, call `mvnw clean package -Pproduction` (Windows),
or `./mvnw clean package -Pproduction` (Mac & Linux).
This will build a JAR file with all the dependencies and front-end resources,
ready to be deployed. The file can be found in the `target` folder after the build completes.

Once the JAR file is built, you can run it using
`java -jar target/samic-1.0-SNAPSHOT.jar`


## Deploying using Docker

To build the Dockerized version of the project, run

```
mvn clean package -Pproduction
docker build . -t samic:latest
```

Once the Docker image is correctly built, you can test it locally using

```
docker run -p 8080:8080 samic:latest
```
