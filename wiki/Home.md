# PostgreSQL em PT-BR

Guia prático para aprender PostgreSQL do básico ao intermediário, usando um único banco de laboratório e exemplos que podem ser executados passo a passo.

## Roteiro

1. [Visão geral](01-Visao-geral)
2. [Instalação e conexão](02-Instalacao-e-conexao)
3. [Tipos e modelagem](03-Tipos-e-modelagem)
4. [DDL e estrutura](04-DDL-e-estrutura)
5. [CRUD](05-CRUD)
6. [Consultas](06-Consultas)
7. [Funções e operadores](07-Funcoes-e-operadores)
8. [Joins](08-Joins)
9. [Subconsultas e CTEs](09-Subconsultas-e-CTE)
10. [Views e triggers](10-Views-e-Triggers)
11. [PL/pgSQL](11-PL-pgSQL)
12. [Transações e locks](12-Transacoes-e-Locks)
13. [Segurança](13-Seguranca)
14. [Backup e restore](14-Backup-e-Restore)
15. [Performance](15-Performance)
16. [Importação e exportação](16-Importacao-e-Exportacao)
17. [Exercícios](17-Exercicios)
18. [psql](18-psql)

## Laboratório

Os scripts ficam em `exemplos/`. O fluxo recomendado é:

```text
01-schema.sql
      ↓
02-dados.sql
      ↓
03-crud.sql → 04-consultas.sql → 05-joins.sql
                                      ↓
                           06-subconsultas-e-cte.sql
                                      ↓
                    07-funcoes.sql / 08-views-e-triggers.sql
                                      ↓
                    09-plpgsql.sql / 10-transacoes.sql
                                      ↓
                   11-seguranca.sql / 12-performance.sql
```

## Para quem é

Serve como referência para quem está começando com PostgreSQL, estudando SQL, trabalhando com integrações ou precisa ganhar segurança com operações de banco.
