# 빌드 과정
FROM openjdk:11-jdk as builder
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew clean build

# 실행 과정
FROM openjdk:11-jre
COPY --from=builder build/libs/*-plain.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

