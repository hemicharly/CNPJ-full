FROM docker.elastic.co/logstash/logstash:7.5.2

RUN rm -f /usr/share/logstash/pipeline/*.conf

COPY docker/logstash/config /usr/share/logstash/config
COPY docker/logstash/pipeline /usr/share/logstash/pipeline
