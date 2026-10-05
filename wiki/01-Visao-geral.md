# Visão geral

PostgreSQL é um sistema gerenciador de banco de dados relacional e objeto-relacional de código aberto. Na prática, ele combina SQL tradicional com recursos como tipos avançados, extensões, funções, triggers, transações e controle de concorrência.

A documentação oficial mantém um tutorial introdutório separado da documentação completa. O tutorial oficial cobre criação de tabelas, carga de dados, consultas, joins, agregações, atualizações, exclusões, views e transações.

Referência: https://www.postgresql.org/docs/current/tutorial.html

## Conceitos que vale dominar primeiro

**Banco**: agrupamento lógico de objetos dentro de uma instância PostgreSQL.

**Schema**: namespace que organiza tabelas, views, funções e outros objetos.

**Tabela**: estrutura de linhas e colunas usada para armazenar dados relacionais.

**Chave primária**: identifica uma linha de forma única.

**Chave estrangeira**: conecta uma tabela a outra e ajuda a manter integridade referencial.

**Índice**: estrutura auxiliar usada para acelerar determinados acessos.

**Transação**: conjunto de operações tratado como uma unidade lógica.

## Uma visão simples da arquitetura

```text
Aplicação
   │
   ▼
Driver / conexão
   │
   ▼
PostgreSQL
   ├── banco
   ├── schemas
   ├── tabelas / índices
   ├── funções / triggers
   └── WAL / controle de concorrência
```

## Caminho de estudo

Comece com SQL declarativo (`SELECT`, `INSERT`, `UPDATE`, `DELETE`), depois avance para modelagem, joins, agregações e CTEs. Só depois vale aprofundar PL/pgSQL, concorrência, segurança e tuning.
