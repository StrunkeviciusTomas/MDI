## Setup instructions

### 1. Clone Github repo
```bash
git clone https://github.com/StrunkeviciusTomas/MDI.git
```



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
python download_data.py
```


### 5. Extract all ZIP archives

```bash
python unzip_data.py
```


### 6. Load data into ClickHouse

```bash
python insert_all.py
```

### 7. Data analysis

```bash
Go to notebook folder to access analysis file
```
