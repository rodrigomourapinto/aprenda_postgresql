SET search_path TO laboratorio, public;

INSERT INTO categorias (nome)
VALUES
    ('Notebooks'),
    ('Monitores'),
    ('Teclados'),
    ('Mouses')
ON CONFLICT (nome) DO NOTHING;

INSERT INTO clientes (nome, email)
VALUES
    ('Ana Souza', 'ana@example.com'),
    ('Bruno Lima', 'bruno@example.com'),
    ('Carlos Mendes', 'carlos@example.com'),
    ('Daniela Rocha', 'daniela@example.com'),
    ('Eduardo Alves', 'eduardo@example.com')
ON CONFLICT (email) DO NOTHING;

INSERT INTO produtos (categoria_id, nome, preco, estoque)
SELECT c.categoria_id, x.nome, x.preco, x.estoque
FROM (
    VALUES
        ('Notebooks', 'Notebook Pro 14', 5899.90::numeric, 8),
        ('Notebooks', 'Notebook Air 13', 4299.90::numeric, 12),
        ('Monitores', 'Monitor 24 Full HD', 899.90::numeric, 20),
        ('Monitores', 'Monitor 27 QHD', 1799.90::numeric, 10),
        ('Teclados', 'Teclado Mecânico ABNT2', 349.90::numeric, 25),
        ('Mouses', 'Mouse Sem Fio', 159.90::numeric, 30),
        ('Mouses', 'Mouse Ergonômico', 219.90::numeric, 18)
) AS x(categoria, nome, preco, estoque)
JOIN categorias c ON c.nome = x.categoria
WHERE NOT EXISTS (
    SELECT 1
    FROM produtos p
    WHERE p.nome = x.nome
);

INSERT INTO pedidos (cliente_id, data_pedido, status, total)
SELECT cliente_id, data_pedido, status, total
FROM (
    VALUES
        (1::bigint, '2026-09-01 10:15+00'::timestamptz, 'PAGO', 6249.80::numeric),
        (2::bigint, '2026-09-03 14:30+00'::timestamptz, 'ENVIADO', 1079.80::numeric),
        (1::bigint, '2026-09-10 09:05+00'::timestamptz, 'PAGO', 1799.90::numeric),
        (3::bigint, '2026-09-14 16:40+00'::timestamptz, 'CANCELADO', 349.90::numeric),
        (4::bigint, '2026-09-18 11:20+00'::timestamptz, 'PAGO', 4459.80::numeric)
) AS x(cliente_id, data_pedido, status, total)
WHERE NOT EXISTS (
    SELECT 1 FROM pedidos p
    WHERE p.cliente_id = x.cliente_id
      AND p.data_pedido = x.data_pedido
);

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
SELECT p.pedido_id, pr.produto_id, x.quantidade, x.preco_unitario
FROM (
    VALUES
        (1, 'Notebook Pro 14', 1, 5899.90::numeric),
        (1, 'Mouse Sem Fio', 1, 159.90::numeric),
        (2, 'Monitor 24 Full HD', 1, 899.90::numeric),
        (2, 'Mouse Sem Fio', 1, 159.90::numeric),
        (3, 'Monitor 27 QHD', 1, 1799.90::numeric),
        (4, 'Teclado Mecânico ABNT2', 1, 349.90::numeric),
        (5, 'Notebook Air 13', 1, 4299.90::numeric),
        (5, 'Mouse Ergonômico', 1, 159.90::numeric)
) AS x(pedido_id, produto_nome, quantidade, preco_unitario)
JOIN pedidos p ON p.pedido_id = x.pedido_id
JOIN produtos pr ON pr.nome = x.produto_nome
ON CONFLICT DO NOTHING;
