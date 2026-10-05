# DDL e estrutura

DDL é o conjunto de comandos usado para criar e alterar a estrutura do banco.

## Criar tabela

```sql
CREATE TABLE categorias (
    categoria_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome text NOT NULL UNIQUE
);
```

## Alterar tabela

```sql
ALTER TABLE categorias
ADD COLUMN ativo boolean NOT NULL DEFAULT true;
```

Renomear coluna:

```sql
ALTER TABLE categorias
RENAME COLUMN nome TO descricao;
```

## Constraints

As principais são:

```text
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
CHECK
```

Exemplo:

```sql
CREATE TABLE produtos (
    produto_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoria_id bigint NOT NULL REFERENCES categorias(categoria_id),
    nome text NOT NULL,
    preco numeric(12,2) NOT NULL CHECK (preco >= 0),
    estoque integer NOT NULL DEFAULT 0 CHECK (estoque >= 0)
);
```

A documentação oficial descreve constraints como regras que restringem os valores aceitos por `INSERT` e `UPDATE`.

Referência: https://www.postgresql.org/docs/18/sql-createtable.html

## Sequences

Uma sequence pode ser usada para gerar números sequenciais de forma independente:

```sql
CREATE SEQUENCE exemplo_seq START 1;
SELECT nextval('exemplo_seq');
```

Para novas tabelas, `IDENTITY` costuma ser uma escolha simples quando o objetivo é gerar identificadores automaticamente.
