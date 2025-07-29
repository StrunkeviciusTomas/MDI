## Setup instructions

### 1. Clone Github repo

git clone https://github.com/StrunkeviciusTomas/MDI.git


### 2. Start ClickHouse with Docker

```bash
docker compose up -d
```

This launches a local ClickHouse server accessible at:

- `http://localhost:8123` (HTTP)
- `localhost:9000` (TCP)

### 3. Set up Python environment (use Python 3.13.5)

```bash
python3 -m venv venv
source venv/bin/activate
cd scripts
pip install -r requirements.txt
```

### 4. Download monthly BTS ZIP data

```bash
python scripts/download_data.py
```

This downloads airline on-time performance ZIP files for every month from January 1990 to December 2000 into the `data/` directory.

### 5. Extract all ZIP archives

```bash
python scripts/unzip_data.py
```

This extracts all CSV files into `data/unzipped/`.

### 6. Load data into ClickHouse

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

