SET search_path TO laboratorio, public;

CREATE OR REPLACE VIEW vw_resumo_pedidos AS
SELECT
    p.pedido_id,
    c.nome AS cliente,
    p.data_pedido,
    p.status,
    p.total
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id;

SELECT *
FROM vw_resumo_pedidos
ORDER BY data_pedido DESC;

CREATE TABLE IF NOT EXISTS auditoria_produtos (
    auditoria_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    produto_id bigint NOT NULL,
    operacao text NOT NULL,
    executado_em timestamptz NOT NULL DEFAULT now()
);

CREATE OR REPLACE FUNCTION fn_auditar_produto()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO auditoria_produtos (produto_id, operacao)
    VALUES (NEW.produto_id, TG_OP);
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_auditar_produto ON produtos;

CREATE TRIGGER trg_auditar_produto
AFTER UPDATE ON produtos
FOR EACH ROW
EXECUTE FUNCTION fn_auditar_produto();

UPDATE produtos
SET preco = preco + 1
WHERE produto_id = 1;

SELECT *
FROM auditoria_produtos
ORDER BY auditoria_id DESC;
