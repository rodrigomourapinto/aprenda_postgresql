# Consultas

`SELECT` é a base para leitura de dados.

## SELECT básico

```sql
SELECT produto_id, nome, preco
FROM produtos;
```

## WHERE

```sql
SELECT *
FROM produtos
WHERE preco >= 100;
```

## DISTINCT

```sql
SELECT DISTINCT categoria_id
FROM produtos;
```

## ORDER BY

```sql
SELECT nome, preco
FROM produtos
ORDER BY preco DESC, nome ASC;
```

## LIMIT e OFFSET

```sql
SELECT produto_id, nome
FROM produtos
ORDER BY produto_id
LIMIT 10 OFFSET 20;
```

## GROUP BY

```sql
SELECT categoria_id, COUNT(*) AS quantidade
FROM produtos
GROUP BY categoria_id;
```

## HAVING

`WHERE` filtra linhas antes da agregação; `HAVING` filtra grupos depois da agregação.

```sql
SELECT categoria_id, AVG(preco) AS preco_medio
FROM produtos
GROUP BY categoria_id
HAVING AVG(preco) > 100;
```

## CTE simples

```sql
WITH produtos_mais_caros AS (
    SELECT *
    FROM produtos
    WHERE preco >= 500
)
SELECT nome, preco
FROM produtos_mais_caros
ORDER BY preco DESC;
```

A sintaxe atual de `SELECT` no PostgreSQL contempla `WITH`, `DISTINCT`, `GROUP BY`, `HAVING`, ordenação, paginação e outras cláusulas em uma única instrução.

Referência: https://www.postgresql.org/docs/18/sql-select.html
