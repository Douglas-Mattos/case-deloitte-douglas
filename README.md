# 📊 Case Deloitte — Engenharia de Dados GCP

Entrega final do case técnico simulando a estruturação de uma usina de dados em ambiente GCP com BigQuery.  

---

## 👤 Autor

**Douglas Mattos**  
Projeto: `case-usina-douglas`  

---

## 🎯 Objetivo

Desenvolver um pipeline de dados escalável e serverless no GCP que realize:

- 🛠️ Ingestão de dados de sensores (telemetria) e eventos de manutenção  
- 🔄 Transformação e agregação via SQL  
- 🧠 Enriquecimento com histórico técnico  
- 📊 Entrega final em camadas para consumo analítico e BI

---

## ⚙️ Estrutura do Projeto

```plaintext
┌────────────────────────────┐
│       Ingestão Telemetria  │
└────────────┬───────────────┘
             ↓
┌────────────────────────────┐
│      Agregação Telemetria  │
└────────────┬───────────────┘
             ↓
┌─────────────────────────────────┐
│   Enriquecimento com Manutenção │
└────────────┬────────────────────┘
             ↓
┌────────────────────────────┐
│        Consumo BI / View   │
└────────────────────────────┘

---

## 📎 Camadas Representadas

- **Bronze**: ingestão bruta dos dados (NDJSON de telemetria e CSV de manutenção)  
- **Prata**: aplicação de transformações, enriquecimento e agregações com dados históricos  
- **Ouro**: preparação de visualizações analíticas para camadas de consumo BI

---

### 🔷 Bloco 3: Organização de arquivos + tecnologias

```markdown
---

## 📁 Organização dos Arquivos

| Arquivo                    | Descrição                                                   |
|----------------------------|-------------------------------------------------------------|
| `ingestao_telemetria_dlq.py` | Ingestão simulada de telemetria via NDJSON + tratamento de erros |
| `ingestao_manutencao.py`     | Importação de histórico de manutenção de máquinas em CSV  |
| `dag_simulada.py`            | Simulação de dependências e ordem lógica entre etapas     |
| `queries.sql`                | SQLs para agregação, enriquecimento e visualização final  |
| `case_dados_hld.png/.pdf`    | Diagrama HLD da arquitetura implantada                    |
| `README.md`                  | Documentação técnica do projeto                           |

---

## 🛠️ Tecnologias Utilizadas

- 🐍 Python 3 (scripts de ingestão e orquestração)  
- 📦 BigQuery (armazenamento e processamento em SQL)  
- ☁️ Google Cloud Shell (execução serverless)  
- 📑 SQL padrão ANSI

---

## 🎯 Objetivos Técnicos

- Simular cenário real de ingestão de dados IoT e manutenção corretiva  
- Aplicar boas práticas de modularidade, reusabilidade e clareza  
- Construir um fluxo ETL completo, incluindo transformação e enriquecimento  
- Gerar entregáveis visuais para auxiliar decisões analíticas

---

## 📊 Resultados Entregues

- ✅ Pipeline funcional com ingestão e transformação  
- ✅ Scripts testados e modularizados  
- ✅ Diagrama da arquitetura incluído (.png e .pdf)  
- ✅ Repositório público com documentação e exemplos  
- ✅ Pronto para expansão em produção GCP

---

## 📬 Contato

📧 douglas.mattos1518@gmail.com  
📍 São Paulo, Brasil  
🔗 [LinkedIn](https://linkedin.com/in/seu-usuario)

---

## 📌 Nota sobre o projeto

Este projeto foi desenvolvido como parte de um estudo técnico baseado em uma proposta simulada de case da empresa Deloitte.  
Trata-se de uma entrega pessoal, com fins educacionais e demonstrativos.

---
