FROM openjdk:11-jre-slim
WORKDIR /app
COPY Main.java .
RUN apt-get update && apt-get install -y openjdk-11-jdk && \
    javac Main.java
EXPOSE 8081
ENTRYPOINT ["java", "Main"]
