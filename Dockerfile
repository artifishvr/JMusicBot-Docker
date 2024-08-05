FROM eclipse-temurin:21

WORKDIR /app

ADD ./start.sh /app
COPY ./JMusicBot.jar /app

CMD sh start.sh