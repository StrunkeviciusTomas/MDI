import zipfile
import os

zip_dir = 'data'
extract_dir = 'data/unzipped'
os.makedirs(extract_dir, exist_ok=True)

for filename in os.listdir(zip_dir):
    if filename.endswith(".zip"):
        zip_path = os.path.join(zip_dir, filename)
        print(f"Unzipping {filename}...")
        try:
            with zipfile.ZipFile(zip_path, 'r') as zip_ref:
                zip_ref.extractall(extract_dir)
        except Exception as e:
            print(f"Failed to unzip {filename}: {e}")
