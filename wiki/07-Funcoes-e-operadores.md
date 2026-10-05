# Funções e operadores

## Agregações

As mais usadas:

```text
COUNT(*)
SUM(valor)
AVG(valor)
MIN(valor)
MAX(valor)
```

Exemplo:

```sql
SELECT
    COUNT(*) AS pedidos,
    SUM(total) AS faturamento,
    AVG(total) AS ticket_medio
FROM pedidos;
```

## Strings

```sql
SELECT
    upper(nome) AS nome_maiusculo,
    lower(email) AS email_normalizado,
    length(nome) AS caracteres
FROM clientes;
```

## Concatenação

```sql
SELECT nome || ' <' || email || '>' AS contato
FROM clientes;
```

## Datas

```sql
SELECT
    current_date AS hoje,
    now() AS instante,
    date_trunc('month', now()) AS inicio_do_mes;
```

## Matemática

```sql
SELECT
    round(preco, 2),
    ceil(preco),
    floor(preco)
FROM produtos;
```

## Arrays

```sql
SELECT ARRAY['sql', 'postgresql', 'plpgsql'] AS tecnologias;
```

Para funções menos comuns, consulte a documentação da versão instalada. PostgreSQL possui famílias próprias para funções de strings, data/hora, matemática, arrays e muitos outros tipos.
