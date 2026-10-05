# Importação e exportação

## COPY

Para copiar dados entre tabela e arquivo local do cliente `psql`, um caminho comum é `\copy`:

```text
\copy produtos(nome, preco, estoque) FROM 'produtos.csv' WITH (FORMAT csv, HEADER true);
```

Para exportar:

```text
\copy (SELECT produto_id, nome, preco FROM produtos ORDER BY produto_id) TO 'produtos_exportados.csv' WITH (FORMAT csv, HEADER true);
```

## COPY no servidor

`COPY` e `\copy` não são iguais. `COPY` opera a partir do servidor; `\copy` é um comando do cliente `psql` que faz a movimentação usando a máquina onde o cliente está rodando.

Isso importa bastante quando o arquivo está no computador do desenvolvedor e o PostgreSQL está em outro servidor.

## Dados externos

Para integrações, avalie também formatos como JSON/JSONB e ferramentas de ingestão específicas. Nem toda carga grande deve ser feita com milhares de `INSERT` individuais.
