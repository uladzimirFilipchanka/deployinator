# Deployinator
Simple yet powerful [Continuous Deployment](https://en.wikipedia.org/wiki/Continuous_deployment) Java/Docker example using GitHub Actions and Digital Ocean App Platform (optional).

Ideal skeleton for your new project that provides [Continuous Deployment](https://en.wikipedia.org/wiki/Continuous_deployment) right out-of-the-box.

# What it does 
The app itself is the simplest Spring Boot app. When deployed, GET `/version` will return current version of the app.
The core thing is easy-to-support integration between SpringBoot/Gradle/Git wrapped by GitHub Actions

On main branch push [it does](https://github.com/uladzimirFilipchanka/deployinator/blob/main/.github/workflows/createRelease.yml):
1. Create a new git tag with version like `v15-ebf562s`, where `15` is a job build number and last 7 is a commit hash
2. Build jar 
3. Build/Push new Docker image
4. Push release tag 
5. Deploy into Digital Ocean's App Platform (if enabled)

# How to play with it

1. Fork the repo 
2. Go to Actions tab of your forked repo and enable GitHub Actions
3. Add next [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository) into your repo
   * `DOCKERHUB_USERNAME` - username from [Docker Hub](https://hub.docker.com/)
   * `DOCKERHUB_TOKEN` - token from [Docker Hub](https://hub.docker.com/) (Account Settings -> Security -> New Access Token)
4. Add next secrets if deploy to Digital Ocean is enabled (true by default) 
   * `DIGITALOCEAN_ACCESS_TOKEN` - token from [Digital Ocean](https://cloud.digitalocean.com/)  (API -> Generate New Token)
   * `DIGITALOCEAN_APP_NAME` - Name of the [Digital Ocean's App](https://cloud.digitalocean.com/apps) you want to deploy a component into
5. Push any commit (either directly into `main` or submit a Pull request)
6. See the outcome: 
    * New Release Tag in a codebase
    * New Docker image of your tested app with a proper version 
    * Deployed app (if enabled)

# Manually 
If you want to play with it locally you can do some obvious things like 
### Build Deployinator
```shell
./gradlew clean build
```

### Run Deployinator
```shell
./gradlew clean bootRun
```

### Check current version 
```shell 
curl localhost:8080/version
```
### Build/Tag/Push Docker 
```shell
docker build -t <your_name_here>/deployinator .
docker tag  <your_name_here>/deployinator <your_name_here>/deployinator:latest
docker push <your_name_here>/deployinator:latest
```
