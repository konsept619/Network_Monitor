# 🌐 Network Monitor & Analyzer

![License](https://img.shields.io/github/license/konsept619/Network_Monitor?color=blue)
![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?logo=mysql&logoColor=white)

A lightweight, automated toolset for monitoring network performance, tracking packet latency, and analyzing bandwidth using `iperf3` and `ping`.

---

## 🚀 Overview

This project serves as a simplified, "under-the-hood" skeleton of professional monitoring systems like Zabbix or Nagios. It was created to demonstrate the core principles of **Observability** and **Network Automation**.

### Key Features:
* **Latency Tracking:** Periodic pinging of remote hosts to measure RTT (Round Trip Time).
* **Bandwidth Analysis:** Automated throughput testing via `iperf3`.
* **Data Persistence:** Automatic storage of metrics in a MySQL database for historical analysis.
* **Configurable:** Easy-to-edit configuration files for targets and database credentials.

---

## 📂 Project Structure

```text
.
├── scripts/
│   ├── bandwidth_analysis.sh  # Script for iperf3 testing
│   ├── packet_analysis.sh     # Script for ping monitoring
│   └── insert_stats_db.sh     # Database injection logic
├── sql/
│   └── create_db.sql          # Database schema
├── config/
│   ├── db_params.conf.example # Template for DB credentials
│   └── netparams.conf         # Monitoring targets
└── README.md

```
---
<!--
TODO: Setup.sh/Makefile
-->
