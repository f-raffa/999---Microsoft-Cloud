import json

import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

# === Parametri ===
input_json_path = "dbo.Contracts_2025-10-26T133009+00.json"
output_parquet_path = "dbo.Contracts_2025-10-26T133009+00.parquet"

with open(input_json_path, 'r') as file:
    cnts_json = json.load(file)

cnts_json_df = pd.DataFrame(cnts_json)

cnts_json_df.head(10)

#df = pd.read_json(input_json_path, orient='records', lines=True)

# === 2. Flatten opzionale (se hai nested JSON) ===
# Se i tuoi JSON hanno strutture annidate (es. dict o list), puoi espanderle:
# df = pd.json_normalize(df)

# === 3. Converti tutto a stringa (uniforma i tipi) ===
df = cnts_json_df.astype(str)

# === 4. Scrivi in formato Parquet ===
table = pa.Table.from_pandas(df)
pq.write_table(table, output_parquet_path, compression='snappy')

print(f"✅ File Parquet scritto con successo: {output_parquet_path}")
