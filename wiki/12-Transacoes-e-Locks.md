# Transações e locks

Transação permite tratar várias operações como uma unidade.

## Fluxo básico

```sql
BEGIN;

UPDATE produtos
SET estoque = estoque - 1
WHERE produto_id = 1
  AND estoque > 0;

INSERT INTO auditoria_produtos (produto_id, operacao)
VALUES (1, 'BAIXA_ESTOQUE');

COMMIT;
```

Em caso de erro ou decisão de desfazer:

```sql
ROLLBACK;
```

## SAVEPOINT

```sql
BEGIN;

UPDATE produtos
SET preco = preco * 1.05;

SAVEPOINT ajuste_1;

UPDATE produtos
SET preco = preco * 1.10;

ROLLBACK TO SAVEPOINT ajuste_1;

COMMIT;
```

## Locks explícitos

Para proteger linhas durante uma operação concorrente:

```sql
SELECT produto_id, estoque
FROM produtos
WHERE produto_id = 1
FOR UPDATE;
```

Locks não devem ser vistos apenas como detalhe técnico. Uma rotina pode ficar lenta porque outra transação está segurando um lock que ela precisa.
