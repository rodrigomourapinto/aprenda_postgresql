# Exercícios

Os exercícios abaixo usam o banco de laboratório.

## Nível 1

1. Liste todos os produtos por preço decrescente.
2. Encontre os clientes ativos cujo nome começa com `A`.
3. Mostre quantos produtos existem em cada categoria.
4. Liste os cinco pedidos de maior valor.

## Nível 2

5. Mostre o faturamento total por cliente.
6. Liste clientes que nunca fizeram pedidos.
7. Mostre o produto mais vendido em quantidade.
8. Compare o total médio dos pedidos com o total de cada pedido.

## Nível 3

9. Calcule o faturamento por mês.
10. Crie uma CTE que classifique clientes por faturamento.
11. Crie uma view com o resumo de pedidos.
12. Escreva uma função PL/pgSQL que classifique um pedido como `BAIXO`, `MEDIO` ou `ALTO`.
13. Crie um índice e compare `EXPLAIN (ANALYZE, BUFFERS)` antes e depois.

## Desafio final

Crie uma consulta que retorne, para cada cliente, os três produtos com maior faturamento gerado por esse cliente usando função de janela.
