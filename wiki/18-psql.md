# psql

`psql` é o cliente de linha de comando mais direto para trabalhar com PostgreSQL.

## Navegação

```text
\l
\c postgresql_ptbr
\dn
\dt
\d clientes
\d+ pedidos
\du
```

## Histórico e edição

O histórico da sessão pode ser reaproveitado com as teclas de seta. Para repetir uma consulta por comando, use o histórico do próprio shell/cliente conforme o ambiente.

## Executar arquivo

No shell:

```bash
psql -d postgresql_ptbr -f exemplos/04-consultas.sql
```

Dentro do `psql`:

```text
\i exemplos/04-consultas.sql
```

## Variáveis

```text
\set limite 10
SELECT * FROM produtos LIMIT :limite;
```

## Sair

```text
\q
```

Use `\?` para ajuda dos comandos do `psql` e `\h` para ajuda SQL, por exemplo `\h SELECT`.
