# Single InfluxDB backed

Start and stop:
```
docker-compose up
docker-compose stop
```

# Double InfluxDB backed

This setup has 2 InfluxDB backends. Prometheus is configured to send 2 remote_storage_adapters:
```
remote_write:
  - url: "http://influxadapter:9201/write"
  - url: "http://influxadapter2:9201/write"
```
Each remote_storage_adapter sends own InfluxDB.

Start and stop:
```
docker-compose --file docker-compose-2db.yml up
docker-compose --file docker-compose-2db.yml stop
```
