SET search_path TO laboratorio, public;

EXPLAIN
SELECT *
FROM pedidos
WHERE cliente_id = 1;

EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM pedidos
WHERE cliente_id = 1;

CREATE INDEX IF NOT EXISTS idx_pedidos_cliente_total
ON pedidos (cliente_id, total DESC);

EXPLAIN (ANALYZE, BUFFERS)
SELECT pedido_id, total
FROM pedidos
WHERE cliente_id = 1
ORDER BY total DESC;
