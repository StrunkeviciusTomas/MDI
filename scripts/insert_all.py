import os
import pandas as pd
import clickhouse_connect

CSV_DIR = "./data/unzipped"
TABLE_NAME = "flight_data"

client = clickhouse_connect.get_client(
    host='localhost',
    port=8123,
    username='default',
    password=''
)

print("Connected to ClickHouse successfully!")
with open('flight_data_schema.sql', 'r') as f:
    query = f.read()

client.command(query)
print("Table created successfully.")

def clean_dataframe(df):
    for col in df.columns:
        dtype = df[col].dtype

        if pd.api.types.is_numeric_dtype(dtype):
            df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)
        elif pd.api.types.is_string_dtype(dtype):
            df[col] = df[col].fillna("")
        elif pd.api.types.is_datetime64_any_dtype(dtype):
            df[col] = df[col].astype(str).fillna("")
        else:
            df[col] = df[col].astype(str).fillna("")

    return df

for filename in sorted(os.listdir(CSV_DIR)):
    if not filename.endswith(".csv"):
        continue

    file_path = os.path.join(CSV_DIR, filename)
    print(f"Inserting {filename} ...")

    try:
        df = pd.read_csv(file_path)
        df = clean_dataframe(df)
        client.insert_df(TABLE_NAME, df)
        print(f"Finished inserting {filename}")
    except Exception as e:
        print(f"Error inserting {filename}: {e}")
