SET search_path TO laboratorio, public;

-- Estes comandos são do psql e devem ser executados dentro do cliente.
-- O arquivo CSV precisa existir no computador onde o psql está rodando.
--
-- \copy produtos(nome, preco, estoque) FROM 'produtos.csv' WITH (FORMAT csv, HEADER true);
-- \copy (SELECT produto_id, nome, preco FROM produtos ORDER BY produto_id) TO 'produtos_exportados.csv' WITH (FORMAT csv, HEADER true);

SELECT produto_id, nome, preco, estoque
FROM produtos
ORDER BY produto_id;
