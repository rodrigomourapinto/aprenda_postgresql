SET search_path TO laboratorio, public;

BEGIN;

-- Bloqueia a linha para evitar alteração concorrente no mesmo registro.
SELECT produto_id, estoque
FROM produtos
WHERE produto_id = 1
FOR UPDATE;

UPDATE produtos
SET estoque = estoque - 1
WHERE produto_id = 1
  AND estoque > 0;

SAVEPOINT antes_do_pedido;

INSERT INTO pedidos (cliente_id, status, total)
VALUES (1, 'ABERTO', 159.90)
RETURNING pedido_id;

-- Exemplo: caso a etapa acima precise ser desfeita sem perder toda a transação
-- ROLLBACK TO SAVEPOINT antes_do_pedido;

COMMIT;
