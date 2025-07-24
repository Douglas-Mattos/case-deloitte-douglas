# Simulação de DAG para pipeline de dados da usina

def pipeline():
    # Etapa 1 - Ingestão dos dados de telemetria (streaming NDJSON)
    ingestar_telemetria()

    # Etapa 2 - Ingestão dos dados de manutenção (batch CSV)
    ingestar_manutencao()

    # Etapa 3 - Transformação dos dados de telemetria
    agregar_leituras()

    # Etapa 4 - Enriquecimento com dados de manutenção
    cruzar_com_manutencao()

    # Etapa 5 - Disponibilização para BI
    disponibilizar_para_BI()
