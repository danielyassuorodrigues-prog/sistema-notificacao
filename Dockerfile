FROM gradle:7.5-jdk17 AS  build
WORKDIR /app

COPY . .
run gradle build --no--daemon




FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 1920

CMD ["java", "-jar", "/app/notificacao.jar"]