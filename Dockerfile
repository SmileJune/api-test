# 빌드 과정
FROM openjdk:11-jdk as builder
WORKDIR application
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew clean build

# 실행 과정
FROM openjdk:11-jre
WORKDIR application
COPY --from=builder application/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

