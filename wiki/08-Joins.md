# Joins

`JOIN` combina linhas de duas ou mais fontes com base em uma condição.

## INNER JOIN

Traz somente correspondências:

```sql
SELECT
    p.produto_id,
    p.nome,
    c.nome AS categoria
FROM produtos p
INNER JOIN categorias c
    ON c.categoria_id = p.categoria_id;
```

## LEFT JOIN

Mantém todas as linhas da tabela da esquerda, mesmo sem correspondência:

```sql
SELECT
    c.cliente_id,
    c.nome,
    p.pedido_id
FROM clientes c
LEFT JOIN pedidos p
    ON p.cliente_id = c.cliente_id;
```

## Vários joins

```sql
SELECT
    pe.pedido_id,
    c.nome AS cliente,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario
FROM pedidos pe
JOIN clientes c ON c.cliente_id = pe.cliente_id
JOIN itens_pedido ip ON ip.pedido_id = pe.pedido_id
JOIN produtos pr ON pr.produto_id = ip.produto_id;
```

## Cuidados

O maior erro comum em joins é multiplicar linhas sem perceber. Antes de agregar, confira a cardinalidade de cada relacionamento.
