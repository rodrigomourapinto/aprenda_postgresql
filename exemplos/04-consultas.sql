SET search_path TO laboratorio, public;

-- SELECT + ORDER BY
SELECT produto_id, nome, preco
FROM produtos
ORDER BY preco DESC;

-- WHERE
SELECT produto_id, nome, preco
FROM produtos
WHERE preco BETWEEN 200 AND 2000
ORDER BY preco;

-- DISTINCT
SELECT DISTINCT status
FROM pedidos
ORDER BY status;

-- GROUP BY + HAVING
SELECT categoria_id, COUNT(*) AS quantidade
FROM produtos
GROUP BY categoria_id
HAVING COUNT(*) >= 1
ORDER BY quantidade DESC;

-- Agregação de pedidos
SELECT
    COUNT(*) AS qtd_pedidos,
    SUM(total) AS faturamento,
    AVG(total) AS ticket_medio
FROM pedidos
WHERE status <> 'CANCELADO';

-- Paginação
SELECT pedido_id, cliente_id, total
FROM pedidos
ORDER BY pedido_id
LIMIT 3 OFFSET 0;
