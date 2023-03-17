FROM eclipse-temurin:17

COPY build/libs/deployinator-*.jar /app/deployinator.jar

ENTRYPOINT java -jar /app/deployinator.jar
