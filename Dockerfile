FROM java:8
MAINTAINER brian@bluerosedev.com

ENV AVRO_VERSION 1.8.2
ENV AVRO_TOOLS_JAR /usr/share/java/avro-tools-${AVRO_VERSION}.jar

RUN mkdir -p /share \
 && cd /usr/share/java \
 && wget http://mirrors.gigenet.com/apache/avro/avro-${AVRO_VERSION}/java/avro-tools-${AVRO_VERSION}.jar

WORKDIR /share
USER 1000

ADD avro-tools-runner /usr/local/bin/avro-tools-runner
ENTRYPOINT ["avro-tools-runner"]

CMD ["--help"]
