#!/bin/bash
wget https://mirror.downloadvn.com/apache/kafka/2.7.0/kafka_2.13-2.7.0.tgz
tar -xzf kafka_2.13-2.7.0.tgz
cd kafka_2.13-2.7.0
bin/zookeeper-server-start.sh config/zookeeper.properties
terminal -e bin/kafka-server-start.sh config/server.properties