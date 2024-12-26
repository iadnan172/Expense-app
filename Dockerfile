#stage 1 - build the jar (java applicaton runtime ) using maven
FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . .

#create jar file 

RUN mvn clean install -DskipTests=true

#stage 2 -Execute JAR file from the above stage

FROM openjdk:17-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar  /app/expenseapp.jar

CMD ["java","-jar","expenseapp.jar"]


