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
## 🛠️ Prerequisites

Ensure you have the following installed on your Linux machine:
* **Bash** (v4.0 or higher)
* **MySQL Server** (or MariaDB)
* **iperf3** (for bandwidth testing)
* **iputils-ping** (standard ping utility)

---

## ⚙️ Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/konsept619/Network_Monitor.git](https://github.com/konsept619/Network_Monitor.git)
    cd Network_Monitor
    ```
    
2.  **Configuration:**
    Copy the example configuration file and fill in your actual database credentials (the `.conf` file is ignored by git for security):
    ```bash
    cp config/db_params.conf.example config/db_params.conf
    vi config/db_params.conf
    ```

3.  **Database Setup:**
    Use the script to set up tables in your database. Credentials can by set with _db_params.conf_:
    ```bash
    chmod +x sql/create_db.sql
    ./sql/create_db.sql
    ```



4.  **Run the monitor:**
    Make sure scripts are executable and run the packet analyzer:
    ```bash
    chmod +x scripts/*.sh
    ./scripts/packet_analysis.sh
    ```

---

## 📊 Dashboard Visualization (Sample Output)

The collected data is stored in the `network_stats` table. Here is an example of the structured output:

| Timestamp           | Host        | Latency (ms) | Bandwidth (Mbps) | Status |
|---------------------|-------------|--------------|------------------|--------|
| 2026-01-14 12:00:01 | 8.8.8.8     | 12.4         | 940.2            | UP     |
| 2026-01-14 12:05:01 | 1.1.1.1     | 8.1          | 935.5            | UP     |
| 2026-01-14 12:10:01 | 8.8.8.8     | 15.1         | 910.0            | UP     |

---

## 🛡️ License

This project is licensed under the **GPL-3.0 License** - see the [LICENSE](LICENSE) file for details.

---
<!--
TODO: Setup.sh/Makefile
-->
