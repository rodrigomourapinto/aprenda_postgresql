# Backup e restore

Para backup lógico, a ferramenta `pg_dump` exporta um banco individual e pode gerar script SQL ou formatos de arquivo para restauração. O `pg_dumpall` é usado quando a necessidade inclui objetos globais do cluster, como roles.

Referências: https://www.postgresql.org/docs/18/app-pgdump.html e https://www.postgresql.org/docs/18/app-pg-dumpall.html

## Dump em SQL

```bash
pg_dump -d postgresql_ptbr > backup.sql
```

Restore:

```bash
psql -d postgresql_ptbr < backup.sql
```

## Formato custom

```bash
pg_dump -Fc -d postgresql_ptbr -f backup.dump
```

Restore:

```bash
pg_restore -d postgresql_ptbr backup.dump
```

## Schema sem dados

```bash
pg_dump --schema-only -d postgresql_ptbr > schema.sql
```

## Dica operacional

Backup não vale apenas por existir. Teste a restauração periodicamente e defina quanto tempo de dados a empresa aceita perder e quanto tempo aceita ficar indisponível.
