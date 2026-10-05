# PL/pgSQL

PL/pgSQL adiciona controle de fluxo e variáveis ao SQL. É útil para funções, procedures e lógica executada no servidor.

## Bloco anônimo

```sql
DO $$
DECLARE
    total_clientes integer;
BEGIN
    SELECT COUNT(*)
      INTO total_clientes
    FROM clientes;

    RAISE NOTICE 'Clientes cadastrados: %', total_clientes;
END
$$;
```

## Função

```sql
CREATE OR REPLACE FUNCTION fn_preco_com_desconto(
    p_preco numeric,
    p_percentual numeric
)
RETURNS numeric
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN p_preco * (1 - p_percentual / 100);
END;
$$;
```

Uso:

```sql
SELECT fn_preco_com_desconto(100, 10);
```

## IF

```sql
DO $$
DECLARE
    v_total numeric := 750;
BEGIN
    IF v_total >= 500 THEN
        RAISE NOTICE 'Pedido com valor alto';
    ELSE
        RAISE NOTICE 'Pedido dentro do valor normal';
    END IF;
END
$$;
```

## FOR

```sql
DO $$
DECLARE
    r record;
BEGIN
    FOR r IN
        SELECT produto_id, nome
        FROM produtos
        ORDER BY produto_id
    LOOP
        RAISE NOTICE '% - %', r.produto_id, r.nome;
    END LOOP;
END
$$;
```

## Tratamento de exceção

```sql
DO $$
BEGIN
    INSERT INTO categorias (nome) VALUES ('Monitores');
EXCEPTION
    WHEN unique_violation THEN
        RAISE NOTICE 'Categoria já existente';
END
$$;
```

PL/pgSQL é particularmente útil quando várias operações SQL precisam participar de uma mesma rotina no servidor.
