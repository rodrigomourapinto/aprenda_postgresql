SET search_path TO laboratorio, public;

-- INSERT
INSERT INTO categorias (nome)
VALUES ('Webcams')
ON CONFLICT (nome) DO NOTHING;

-- UPDATE
UPDATE produtos
SET preco = round(preco * 1.05, 2)
WHERE categoria_id = (
    SELECT categoria_id FROM categorias WHERE nome = 'Monitores'
)
RETURNING produto_id, nome, preco;

-- DELETE controlado
DELETE FROM categorias
WHERE nome = 'Webcams'
RETURNING categoria_id, nome;

-- UPSERT
INSERT INTO clientes (nome, email)
VALUES ('Ana Souza', 'ana@example.com')
ON CONFLICT (email) DO UPDATE
SET nome = EXCLUDED.nome;
