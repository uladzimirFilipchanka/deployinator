# Temp container to run gradle build
FROM gradle:latest AS BUILD
COPY --chown=gradle:gradle . .
USER gradle

# Tag current commit with commit's sha for versioning purposes
RUN git tag $(git rev-parse --short HEAD)
RUN gradle build

FROM eclipse-temurin:17
EXPOSE 80
COPY --from=BUILD /home/gradle/build/libs/deployinator-*.jar /app/deployinator.jar
ENTRYPOINT java -jar /app/deployinator.jar
