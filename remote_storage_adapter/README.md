Image built for InfluxDB backend.

Original source (tag is same to Prometheus tag):
https://github.com/prometheus/prometheus/tree/v2.3.1/documentation/examples/remote_storage/remote_storage_adapter

Dockerfile source:
https://github.com/pgillich/dockprom/tree/backend-influxdb/remote_storage_adapter

Exampe for start with default values:
```
docker run pgillich/prometheus-remote_storage_adapter
```

Default values:
```
INFLUXDB_URL=http://influxdb:8086/
INFLUXDB_DATABASE=db0
INFLUXDB_RETENTION_POLICY=autogen
INFLUXDB_USER=mon_write
INFLUXDB_PW=mon_write
```

The service is listening on TCP port 9201.

An example for starting it by Docker Compose can be found in above repo file [Dockprom Compose](../docker-compose.yml).
