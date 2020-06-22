# Spring Boot and MySQL with Docker Compose

What I want to do with this project, is to have a ready to use structure for my Spring Boot projects. Besides using a local database for development etc, I want to use Docker Compose for other use cases as well.

1. MySQL in Docker Compose for local development. Will be standalone.
2. Docker Compose to launch Spring Boot and MySQL together for development.
3. Docker Compose to launch Spring Boot and MySQL together for QA testing.

I think a good reason to have such Docker Compose files is to easily run the application on a different machine, without setting anything up. I'll also use Spring profiles to further separate the configurations.

Moreover, having multiple Docker Compose files means we can use different SQL scripts to load the databases upon start so we don't mess with our local one.

## Standalone MySQL
``` docker-compose -f mysql-standalone.yml up ```

## Spring Boot and MySQL for development

## Spring Boot and MySQL for QA