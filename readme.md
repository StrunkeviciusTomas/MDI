#  U.S. Airline On-Time Performance Data Loader (1990–2000)

This project automates the entire data pipeline to download, extract, clean, and load historical U.S. airline on-time performance data (1990–2000) into a ClickHouse database using Python and Docker.

---

##  Project Structure

```
MDI_RUN/
├── clickhouse_data/              # Volume for ClickHouse storage (mounted in Docker)
├── config/                       # Custom ClickHouse configuration files
├── data/
│   ├── *.zip                     # Raw ZIP files downloaded from BTS
│   └── unzipped/                 # Extracted CSV files
├── notebooks  
│   └── data_analysis.ipynb       # Main analysis notebook
├── scripts/
│   ├── download_data.py          # Downloads ZIP files from BTS
│   ├── unzip_data.py             # Extracts CSVs from ZIP files
│   ├── insert_all.py             # GEnerates a table and inserts data into ClickHouse
├── requirements.txt              # Python package requirements
├── readme.md                     # This file
└── docker-compose.yml            # Docker service configuration
└── flight_data_schema.sql        # Defines the ClickHouse table schema
```

---
## Setup instructions

### 1. Start ClickHouse with Docker

```bash
docker-compose up -d
```

This launches a local ClickHouse server accessible at:

- `http://localhost:8123` (HTTP)
- `localhost:9000` (TCP)

### 2. Set up Python environment

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 3. Download monthly BTS ZIP data

```bash
python scripts/download_data.py
```

This downloads airline on-time performance ZIP files for every month from January 1990 to December 2000 into the `data/` directory.

### 4. Extract all ZIP archives

```bash
python scripts/unzip_data.py
```

This extracts all CSV files into `data/unzipped/`.

### 5. Load data into ClickHouse

```bash
python scripts/insert_all.py
```

This script:
- Creates the `flight_data` table in ClickHouse using the provided schema
- Cleans and normalizes all CSVs
- Loads the data into the ClickHouse database


---

## ClickHouse Configuration

- Image: `clickhouse/clickhouse-server:23.1.2.9-alpine`
- Ports:
  - `8123` for HTTP access
  - `9000` for native protocol
- Docker volumes:
  - `./clickhouse_data:/var/lib/clickhouse`
  - `./config:/etc/clickhouse-server/users.d`
- Default credentials:
  - User: `default`
  - Password: `default` (or passwordless, depending on config)

---

## Requirements

Install Python dependencies with:

```bash
pip install -r requirements.txt
```

Includes:

- `pandas`
- `tqdm`
- `requests`
- `clickhouse-connect`

---

## Summary

After setup, the project provides a fully functional ClickHouse database populated with monthly airline on-time performance data spanning from **1990 to 2000**. This data is now ready for analysis using SQL tools or notebooks.
