SET search_path TO laboratorio, public;

-- Bloco anônimo
DO $$
DECLARE
    v_total integer;
BEGIN
    SELECT COUNT(*) INTO v_total FROM clientes;
    RAISE NOTICE 'Clientes: %', v_total;
END
$$;

-- Função de desconto
CREATE OR REPLACE FUNCTION fn_preco_com_desconto(
    p_preco numeric,
    p_percentual numeric
)
RETURNS numeric
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_percentual < 0 OR p_percentual > 100 THEN
        RAISE EXCEPTION 'Percentual inválido: %', p_percentual;
    END IF;

    RETURN round(p_preco * (1 - p_percentual / 100), 2);
END;
$$;

SELECT fn_preco_com_desconto(1000, 10);

-- Loop
DO $$
DECLARE
    r record;
BEGIN
    FOR r IN
        SELECT produto_id, nome
        FROM produtos
        ORDER BY produto_id
    LOOP
        RAISE NOTICE '% => %', r.produto_id, r.nome;
    END LOOP;
END
$$;
