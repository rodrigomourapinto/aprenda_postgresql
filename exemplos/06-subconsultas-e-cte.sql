SET search_path TO laboratorio, public;

-- Produtos acima da média
SELECT nome, preco
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
ORDER BY preco DESC;

-- Clientes com pelo menos um pedido
SELECT c.cliente_id, c.nome
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.cliente_id
);

-- Clientes sem pedidos
SELECT c.cliente_id, c.nome
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM pedidos p
    WHERE p.cliente_id = c.cliente_id
);

-- CTE: faturamento por cliente
WITH faturamento AS (
    SELECT cliente_id, SUM(total) AS total_cliente
    FROM pedidos
    WHERE status <> 'CANCELADO'
    GROUP BY cliente_id
)
SELECT c.nome, f.total_cliente
FROM faturamento f
JOIN clientes c ON c.cliente_id = f.cliente_id
ORDER BY f.total_cliente DESC;
