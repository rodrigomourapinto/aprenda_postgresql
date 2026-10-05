# CRUD

CRUD reúne as quatro operações básicas: criar, ler, atualizar e excluir dados.

## INSERT

```sql
INSERT INTO categorias (nome)
VALUES ('Periféricos');
```

Inserir várias linhas:

```sql
INSERT INTO categorias (nome)
VALUES
    ('Monitores'),
    ('Teclados'),
    ('Mouses');
```

## UPDATE

```sql
UPDATE produtos
SET preco = preco * 1.05
WHERE categoria_id = 1;
```

Sempre pense no `WHERE` antes de executar um `UPDATE` ou `DELETE`.

## DELETE

```sql
DELETE FROM produtos
WHERE estoque = 0;
```

## RETURNING

PostgreSQL permite recuperar as linhas afetadas:

```sql
UPDATE produtos
SET preco = preco * 1.10
WHERE produto_id = 1
RETURNING produto_id, nome, preco;
```

Isso é especialmente útil em aplicações quando o banco gera valores ou quando você precisa confirmar exatamente o que foi alterado.
