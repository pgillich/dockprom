#!/bin/bash

if [[ -z $1 ]]; then
	echo "Missing database name!"
else
	export CREATE_DB=$1
	docker exec influxdb /bin/bash -c 'influx -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -execute "CREATE DATABASE '$CREATE_DB'"'
	docker exec influxdb /bin/bash -c 'influx -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -database '$CREATE_DB' -execute "GRANT ALL ON '$CREATE_DB' TO $INFLUXDB_USER"'
	docker exec influxdb /bin/bash -c 'influx -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -database '$CREATE_DB' -execute "GRANT WRITE ON '$CREATE_DB' TO $INFLUXDB_WRITE_USER"'
	docker exec influxdb /bin/bash -c 'influx -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -database '$CREATE_DB' -execute "GRANT READ ON '$CREATE_DB' TO $INFLUXDB_READ_USER"'
	docker exec influxdb /bin/bash -c 'influx -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -database '$CREATE_DB' -execute "SHOW RETENTION POLICIES ON '$CREATE_DB'"'



fi
