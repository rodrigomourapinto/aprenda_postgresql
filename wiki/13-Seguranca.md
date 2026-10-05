# Segurança

No PostgreSQL, usuários e grupos são tratados pelo conceito de **roles**. Roles são objetos no nível do cluster e podem receber privilégios ou associação com outras roles.

Referências: https://www.postgresql.org/docs/18/database-roles.html e https://www.postgresql.org/docs/18/sql-createrole.html

## Criar uma role

```sql
CREATE ROLE app_leitura LOGIN PASSWORD 'troque-esta-senha';
```

Em produção, não use senha fixa em script de versionamento.

## Privilégios

```sql
GRANT CONNECT ON DATABASE postgresql_ptbr TO app_leitura;
GRANT USAGE ON SCHEMA public TO app_leitura;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_leitura;
```

Para retirar:

```sql
REVOKE SELECT ON ALL TABLES IN SCHEMA public FROM app_leitura;
```

## Princípio do menor privilégio

Uma aplicação de leitura não precisa de `CREATE`, `DROP`, `SUPERUSER` ou privilégios administrativos. Separe roles conforme a responsabilidade.

A documentação oficial alerta que privilégios de alto nível, como `SUPERUSER`, devem ser concedidos somente quando realmente necessários.

Referência: https://www.postgresql.org/docs/18/sql-createrole.html
