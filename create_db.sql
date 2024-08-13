#!/bin/bash

DB_USER="username"
DB_PASS="password"
DB_NAME="database_name"

CREATE_PING_TABLE="
CREATE TABLE IF NOT EXISTS test_ping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min FLOAT,
    avg FLOAT,
    max FLOAT,
    std_dev FLOAT,
    loss INT,
    time VARCHAR(20)
);"

CREATE_IPERF_TABLE="
CREATE TABLE IF NOT EXISTS test_iperf (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bandwidth FLOAT,
    time VARCHAR(20)
);"

mysql -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -e "$CREATE_PING_TABLE"
mysql -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" -e "$CREATE_IPERF_TABLE"

