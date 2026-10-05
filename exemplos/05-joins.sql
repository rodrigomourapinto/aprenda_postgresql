SET search_path TO laboratorio, public;

-- INNER JOIN
SELECT
    p.produto_id,
    p.nome AS produto,
    c.nome AS categoria
FROM produtos p
JOIN categorias c ON c.categoria_id = p.categoria_id
ORDER BY c.nome, p.nome;

-- LEFT JOIN: clientes sem pedido também aparecem
SELECT
    c.cliente_id,
    c.nome,
    p.pedido_id,
    p.total
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.cliente_id
ORDER BY c.cliente_id, p.pedido_id;

-- Cadeia de joins
SELECT
    pe.pedido_id,
    c.nome AS cliente,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.quantidade * ip.preco_unitario AS subtotal
FROM pedidos pe
JOIN clientes c ON c.cliente_id = pe.cliente_id
JOIN itens_pedido ip ON ip.pedido_id = pe.pedido_id
JOIN produtos pr ON pr.produto_id = ip.produto_id
ORDER BY pe.pedido_id, pr.nome;
