# Views e triggers

## View

Uma view é uma consulta salva que pode ser usada como fonte de dados:

```sql
CREATE OR REPLACE VIEW vw_resumo_pedidos AS
SELECT
    p.pedido_id,
    c.nome AS cliente,
    p.data_pedido,
    p.total
FROM pedidos p
JOIN clientes c ON c.cliente_id = p.cliente_id;
```

Depois:

```sql
SELECT *
FROM vw_resumo_pedidos
WHERE total >= 500;
```

## Trigger

Trigger é executada automaticamente quando um evento configurado ocorre em uma tabela.

Exemplo: registrar atualização:

```sql
CREATE TABLE auditoria_produtos (
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

CREATE TRIGGER trg_auditar_produto
AFTER UPDATE ON produtos
FOR EACH ROW
EXECUTE FUNCTION fn_auditar_produto();
```

Use triggers quando a regra realmente pertence ao banco. Evite espalhar regras de negócio complexas em muitas triggers, pois isso dificulta entender o fluxo da aplicação.
