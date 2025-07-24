-- 🧾 Consulta inicial: ver os dados carregados na tabela telemetria
SELECT * FROM `case-usina-douglas.usina_dados.telemetria`
LIMIT 10;

-- 📊 Ver leituras de um equipamento específico
SELECT *
FROM `case-usina-douglas.usina_dados.telemetria`
WHERE equipment_id = "TURBINE_A";

-- 📈 Contar sensores por unidade de medida (ex: Celsius, mm/s)
SELECT unit, COUNT(sensor_id) AS total_sensores
FROM `case-usina-douglas.usina_dados.telemetria`
GROUP BY unit;

-- ⏳ Leituras dentro de um intervalo de tempo
SELECT *
FROM `case-usina-douglas.usina_dados.telemetria`
WHERE timestamp BETWEEN "2024-05-25T10:30:00Z" AND "2024-05-25T10:32:00Z";

-- 📉 Detectar valores extremos (exemplo: temperatura > 160ºC)
SELECT *
FROM `case-usina-douglas.usina_dados.telemetria`
WHERE unit = "Celsius" AND value > 160;

-- 🧪 Agregação por dia, equipamento e sensor
CREATE OR REPLACE TABLE `case-usina-douglas.usina_dados.telemetria_agregada` AS
SELECT
  DATE(timestamp) AS data,
  equipment_id,
  sensor_id,
  AVG(value) AS avg_value,
  MIN(value) AS min_value,
  MAX(value) AS max_value,
  COUNT(*) AS count_readings
FROM `case-usina-douglas.usina_dados.telemetria`
GROUP BY data, equipment_id, sensor_id;

-- 🛠️ Verificar se a tabela manutencao foi carregada corretamente
SELECT * FROM `case-usina-douglas.usina_dados.manutencao`
ORDER BY data_evento DESC;

-- 🔗 Enriquecer leituras com informações de manutenção (JOIN)
CREATE OR REPLACE VIEW `case-usina-douglas.usina_dados.telemetria_enriquecida` AS
SELECT
  t.*,
  m.data_evento,
  m.descricao AS tipo_manutencao
FROM `case-usina-douglas.usina_dados.telemetria_agregada` t
LEFT JOIN `case-usina-douglas.usina_dados.manutencao` m
ON t.equipment_id = m.equipment_id
AND DATE_DIFF(t.data, DATE(m.data_evento), DAY) BETWEEN -1 AND 1;

-- 📋 Consultar leituras que ocorreram próximo de manutenções
SELECT *
FROM `case-usina-douglas.usina_dados.telemetria_enriquecida`
WHERE tipo_manutencao IS NOT NULL
ORDER BY data;

-- 📊 Contar tipo de manutenção por quantidade de sensores afetados
SELECT tipo_manutencao, COUNT(*) AS total
FROM `case-usina-douglas.usina_dados.telemetria_enriquecida`
WHERE tipo_manutencao IS NOT NULL
GROUP BY tipo_manutencao;
