ARG GOLANG_VERSION=1.10-alpine
FROM golang:${GOLANG_VERSION}
LABEL maintainer "pgillich ta gmail.com"

ARG PROMETHEUS_TAG=v2.3.1

ENV INFLUXDB_URL=http://influxdb:8086/
ENV INFLUXDB_DATABASE=db0
ENV INFLUXDB_RETENTION_POLICY=autogen
ENV INFLUXDB_USER=mon_write
ENV INFLUXDB_PW=mon_write

EXPOSE 9201

COPY run.sh /

RUN apk add --no-cache git && \
    mkdir -p /go/src/github.com/prometheus && \
    cd /go/src/github.com/prometheus && \
    git clone https://github.com/prometheus/prometheus -b ${PROMETHEUS_TAG} --single-branch && \
    cd /go/src/github.com/prometheus/prometheus/documentation/examples/remote_storage/remote_storage_adapter && \
    go get -d ./... && \
    go install ./... && \
    cd / && \
    apk del git && \
    rm -rf /go/src/github.com /var/cache/apk

CMD ["/run.sh"]

