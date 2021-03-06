# quais rem�dios usados em juiz de fora

# Conectando a BigQuery
bq_auth(path = "chavebigquery/My Project 71749-87ac5d5aee91.json")
id_projeto <- "polar-plate-302114"

con <- dbConnect(
  bigrquery::bigquery(),
  billing = id_projeto,
  project = "basedosdados"
)

# Executando a query

query <- 'SELECT id_escola, escola, id_municipio, municipio, estado_abrev, rede
FROM `basedosdados.br_inep_ideb.escola`
WHERE ano = 2019
GROUP BY id_escola, escola, id_municipio, municipio, estado_abrev, rede'


base_brasil <- dbGetQuery(con, query)