# base build image
FROM maven:3.6.3-adoptopenjdk-11-openj9 as maven

# copy the pom.xml
COPY ./pom.xml ./pom.xml

# copy the source code
COPY ./src ./src

# build the project
RUN mvn package -DskipTests=true

# final base image
FROM adoptopenjdk:11.0.9_11-jdk-openj9-0.23.0

# copy the built artifact from the maven image
COPY --from=maven target/developers.jar developers.jar

# copy the script to wait for the database
COPY wait-for-it.sh wait-for-it.sh

# run permission for the script
RUN chmod +x wait-for-it.sh

# run the artifact after it waits for the database container
ENTRYPOINT ["./wait-for-it.sh", "developers-mysql-container:3307", "--","java","-jar","developers.jar"]