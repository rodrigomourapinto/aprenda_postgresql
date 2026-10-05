SET search_path TO laboratorio, public;

SELECT
    nome,
    upper(nome) AS maiusculo,
    length(nome) AS tamanho
FROM clientes;

SELECT
    current_date AS hoje,
    now() AS agora,
    date_trunc('month', now()) AS inicio_mes;

SELECT
    nome,
    preco,
    round(preco, 0) AS arredondado,
    ceil(preco) AS teto,
    floor(preco) AS piso
FROM produtos;

SELECT ARRAY['sql', 'postgresql', 'plpgsql'] AS stack;

SELECT
    COUNT(*) AS qtd,
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco,
    AVG(preco) AS preco_medio
FROM produtos;
