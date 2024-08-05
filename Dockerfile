FROM eclipse-temurin:21

WORKDIR /app

ADD ./start.sh /app
ADD ./JMusicBot.jar /app
ADD ./LICENSE /app

CMD sh start.sh