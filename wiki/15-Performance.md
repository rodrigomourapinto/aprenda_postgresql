# Performance

O primeiro passo para melhorar uma consulta não é adicionar índice. Primeiro descubra onde está o custo.

## EXPLAIN

```sql
EXPLAIN
SELECT *
FROM pedidos
WHERE cliente_id = 10;
```

Para medir a execução:

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM pedidos
WHERE cliente_id = 10;
```

## Índice simples

```sql
CREATE INDEX idx_pedidos_cliente_id
ON pedidos (cliente_id);
```

## Índice composto

```sql
CREATE INDEX idx_pedidos_cliente_data
ON pedidos (cliente_id, data_pedido DESC);
```

## O que observar

- estimativa de linhas versus linhas reais
- `Seq Scan` em tabelas grandes
- leituras de buffer
- ordenações caras
- filtros aplicados tarde demais
- joins com cardinalidade inesperada

Índice também tem custo: ocupa espaço, aumenta o trabalho de escrita e precisa ser escolhido de acordo com os padrões reais de consulta.
