# Spring Boot and MySQL with Docker Compose

What I want to do with this project, is to have a ready to use structure for my Spring Boot projects. Besides using a local database for development etc, I want to use Docker Compose for other use cases as well.

1. MySQL in Docker Compose for local development. Will be standalone.
2. Docker Compose to launch Spring Boot and MySQL together for development.

I think a good reason to have such Docker Compose files is to easily run the application on a different machine, without setting anything up. I'll also use Spring profiles to further separate the configurations.

Moreover, having multiple Docker Compose files means we can use different SQL scripts to load the databases upon start so we don't mess with our local one.

## Standalone MySQL
`docker-compose -f mysql-standalone.yml up`

The `mysql-standalone.yml` file uses the `mysql-docker/Dockerfile` and populates the database with the `mysql-docker/developers-dump.sql` script.

## Spring Boot and MySQL for development
### Standalone Spring Boot project
To run the Spring Boot project and have it connect to our local development database using the development profile, we can use the command `mvn spring-boot:run -Dspring-boot.run.profiles=dev`

This way, whatever values are present in the `application-dev.properties` will be used. Also, the database must be running on our local machine and the tables must be present, otherwise the run command will fail.

### Project and database
To run the database along with the project, the file `mysql-project.yml` can be used. The command is `docker-compose -f mysql-project.yml up`.

This configuration starts a MySQL container, populating it with the dump file like the standalone container. For Spring Boot, the `Dockerfile` is used. It builds the project with Maven and then copies the jar file to the Java image. Also, it uses the `wait-for-it.sh` script so that the database runs fully and then starts the Spring Boot container.

If this script is not used, Spring Boot will throw a database connection error because the database isn't available as soon as the container is started.

## Sample controller
To test if everything runs correctly, I have included a sample controller at `localhost:8080/developers`
