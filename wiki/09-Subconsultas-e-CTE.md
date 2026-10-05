# Subconsultas e CTEs

Subconsulta é uma consulta usada dentro de outra. CTE (`WITH`) é uma forma de nomear uma consulta intermediária dentro de uma instrução.

## Subconsulta escalar

```sql
SELECT
    nome,
    preco,
    (SELECT AVG(preco) FROM produtos) AS media_geral
FROM produtos;
```

## EXISTS

```sql
SELECT c.nome
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.cliente_id
);
```

## CTE para leitura

```sql
WITH vendas_por_cliente AS (
    SELECT cliente_id, SUM(total) AS faturamento
    FROM pedidos
    GROUP BY cliente_id
)
SELECT c.nome, v.faturamento
FROM clientes c
JOIN vendas_por_cliente v
  ON v.cliente_id = c.cliente_id
ORDER BY v.faturamento DESC;
```

## CTE recursiva

Útil para hierarquias. Exemplo genérico:

```sql
WITH RECURSIVE arvore AS (
    SELECT id, nome, parent_id, 0 AS nivel
    FROM categorias_hierarquicas
    WHERE parent_id IS NULL

    UNION ALL

    SELECT c.id, c.nome, c.parent_id, a.nivel + 1
    FROM categorias_hierarquicas c
    JOIN arvore a ON a.id = c.parent_id
)
SELECT *
FROM arvore
ORDER BY nivel, id;
```
