# Case Deloitte — Engenharia de Dados GCP

## 👤 Autor
Douglas Mattos  
Projeto: `case-usina-douglas`

---

## 🎯 Objetivo

Desenvolver um pipeline de dados escalável e serveless no GCP que realize ingestão, transformação, enriquecimento e disponibilização de dados de sensores (telemetria) e eventos de manutenção.

---

## ⚙️ Estrutura do Projeto

```plaintext
┌────────────────────────────┐
│       Ingestão Telemetria │
└────────────┬──────────────┘
             ↓
┌────────────────────────────┐
│      Agregação Telemetria │
└────────────┬──────────────┘
             ↓
┌────────────────────────────┐
│   Enriquecimento com Manutenção │
└────────────┬──────────────┘
             ↓
┌────────────────────────────┐
│        Consumo BI / View   │
└────────────────────────────┘
