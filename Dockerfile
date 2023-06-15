FROM eclipse-temurin

WORKDIR /app

ADD ./start.sh /app
COPY . /app

CMD sh start.sh