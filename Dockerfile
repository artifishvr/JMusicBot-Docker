FROM eclipse-temurin

WORKDIR /app

COPY /ConfigFileCreator.java /app
COPY . /app

RUN javac ConfigFileCreator.java

CMD ["java", "ConfigFileCreator"]