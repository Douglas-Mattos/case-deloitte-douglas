import pandas as pd
from google.cloud import bigquery

PROJECT_ID = "case-usina-douglas"
DATASET_ID = "usina_dados"
TABLE_ID   = "manutencao"
FILE_PATH  = "manutencao.csv"

def main():
    client = bigquery.Client(project=PROJECT_ID)

    df = pd.read_csv(FILE_PATH, parse_dates=["data_evento"])
    df["data_evento"] = df["data_evento"].dt.tz_convert("UTC")

    table_ref = f"{PROJECT_ID}.{DATASET_ID}.{TABLE_ID}"
    job_config = bigquery.LoadJobConfig(
        write_disposition="WRITE_APPEND"
    )

    job = client.load_table_from_dataframe(df, table_ref, job_config=job_config)
    job.result()
    print(f"✅ {job.output_rows} registros carregados em {TABLE_ID}")

if __name__ == "__main__":
    main()

