# Deployinator
Simple yet powerful continuous deployment example for Java using Github actions and Digital Ocean App Platfotm

# How tos
## Build Deployinator
```shell
./gradlew clean build
```

## Run Deployinator
```shell
./gradlew clean bootRun
```

## Build/Tag/Push Docker
```shell
docker build -t <your_name_here>/deployinator .
docker tag  <your_name_here>/deployinator <your_name_here>/deployinator:v1-manualReleaseHere
docker push <your_name_here>/deployinator:latest
```
