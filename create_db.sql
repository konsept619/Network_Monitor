#!/bin/bash

#conifguration designed for mariaDB/mysql

if [ -e ./db_params.conf ]; then
  . ./db_params.conf 
else 
  echo "Configuration file doesn't exist or its name was changed! Make sure proper file is placed in working directory and has a proper name."
  exit 1
fi

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

