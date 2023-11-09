FROM eclipse-temurin:21

WORKDIR /app

ADD ./start.sh /app
COPY . /app

CMD sh start.sh