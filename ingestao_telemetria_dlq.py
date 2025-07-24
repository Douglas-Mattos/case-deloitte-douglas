import pandas as pd
from google.cloud import bigquery

PROJECT_ID = "case-usina-douglas"
DATASET_ID = "usina_dados"
TABLE_OK   = "telemetria"
TABLE_DLQ  = "telemetria_dlq"
FILE_PATH  = "manutencao_limpo.json"

def main():
    client = bigquery.Client(project=PROJECT_ID)

    df = pd.read_json(FILE_PATH, lines=True)
    df["timestamp"] = pd.to_datetime(df["timestamp"], utc=True)
    df_validos   = df[df["value"].notnull()]
    df_invalidos = df[df["value"].isnull()]

    def carregar(df, tabela):
        table_ref = f"{PROJECT_ID}.{DATASET_ID}.{tabela}"
        job_config = bigquery.LoadJobConfig(
            write_disposition="WRITE_APPEND"
        )
        job = client.load_table_from_dataframe(df, table_ref, job_config=job_config)
        job.result()
        print(f"✅ {job.output_rows} registros carregados em {tabela}")

    if not df_validos.empty:
        carregar(df_validos, TABLE_OK)
    if not df_invalidos.empty:
        carregar(df_invalidos, TABLE_DLQ)

if __name__ == "__main__":
    main()
