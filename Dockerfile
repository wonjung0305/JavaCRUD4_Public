FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app
COPY . .
RUN mvn -DskipTests clean package

FROM tomcat:9.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/W25_22200145.war

CMD ["catalina.sh", "run"]