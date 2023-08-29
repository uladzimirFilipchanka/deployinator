FROM eclipse-temurin:17

EXPOSE 80

COPY build/libs/deployinator-*.jar /app/deployinator.jar

ENTRYPOINT java -jar /app/deployinator.jar
