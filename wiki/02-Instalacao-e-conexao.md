# Instalação e conexão

A instalação depende do sistema operacional. Para estudar SQL, é suficiente ter um servidor PostgreSQL ativo e um cliente como `psql` ou pgAdmin.

A documentação oficial de PostgreSQL 18 apresenta a versão 18 como corrente e mantém documentação também para versões suportadas anteriores.

Referência: https://www.postgresql.org/docs/18/

## Conectar com `psql`

Exemplo local:

```bash
psql -h localhost -p 5432 -U postgres -d postgres
```

Os parâmetros mais usados são:

| Parâmetro | Uso |
|---|---|
| `-h` | host do servidor |
| `-p` | porta |
| `-U` | role usada na conexão |
| `-d` | banco de destino |

## Comandos úteis dentro do psql

```text
\conninfo
\l
\dn
\dt
\d clientes
\du
\q
```

## Criar o banco do laboratório

```sql
CREATE DATABASE postgresql_ptbr;
```

Depois, conecte-se ao banco:

```bash
psql -d postgresql_ptbr
```

## Strings de conexão

Uma aplicação normalmente usa algo equivalente a:

```text
postgresql://usuario:senha@localhost:5432/postgresql_ptbr
```

Em ambientes reais, evite deixar senha em código-fonte. Prefira variáveis de ambiente, secret managers ou mecanismos equivalentes.
