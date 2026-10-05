# Tipos de dados e modelagem

Escolher o tipo certo reduz ambiguidades e evita conversões desnecessárias.

## Tipos comuns

| Necessidade | Tipo sugerido |
|---|---|
| identificador inteiro | `integer` ou `bigint` |
| texto livre | `text` |
| texto com limite explícito | `varchar(n)` |
| valor monetário calculado | `numeric(p,s)` |
| verdadeiro/falso | `boolean` |
| data | `date` |
| data e hora | `timestamp` |
| data e hora com fuso | `timestamptz` |
| valor único identificável | `uuid` |
| lista simples | `array` |
| documento estruturado | `jsonb` |

## Exemplo

```sql
CREATE TABLE clientes (
    cliente_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome text NOT NULL,
    email text NOT NULL UNIQUE,
    ativo boolean NOT NULL DEFAULT true,
    criado_em timestamptz NOT NULL DEFAULT now()
);
```

## Regras de modelagem

Comece pelos fatos que precisam ser armazenados. Depois defina as entidades, relações e regras de integridade. Não use `text` para tudo: o tipo deve representar a regra do domínio.

Também vale distinguir `NULL` de valor vazio. `NULL` significa ausência ou desconhecimento do valor; `''` é uma string vazia.
