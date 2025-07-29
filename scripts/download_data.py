import os
import requests
from tqdm import tqdm

BASE_URL = "https://transtats.bts.gov/PREZIP/"
YEARS = range(1990, 2001)
MONTHS = range(1, 13)

DATA_DIR = "data"
os.makedirs(DATA_DIR, exist_ok=True)

for year in YEARS:
    for month in MONTHS:
        filename = f"On_Time_Reporting_Carrier_On_Time_Performance_1987_present_{year}_{month}.zip"
        url = BASE_URL + filename
        dest_path = os.path.join(DATA_DIR, filename)

        if not os.path.exists(dest_path):
            print(f"Downloading {filename}...")
            try:
                with requests.get(url, stream=True) as r:
                    r.raise_for_status()
                    with open(dest_path, "wb") as f:
                        for chunk in tqdm(r.iter_content(chunk_size=8192), unit="KB"):
                            f.write(chunk)
            except Exception as e:
                print(f"Failed to download {filename}: {e}")
        else:
            print(f"Already exists: {filename}")
