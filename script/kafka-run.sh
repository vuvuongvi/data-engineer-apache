#!/bin/bash
cd kafka_2.13-2.7.0
bin/zookeeper-server-start.sh config/zookeeper.properties
terminal -e bin/kafka-server-start.sh config/server.properties