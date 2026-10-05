# Aprenda PostgreSQL em Português

Material de estudo e consulta rápida para PostgreSQL, com exemplos práticos e uma Wiki em PT-BR.

## Conteúdo

A ideia deste repositório é acompanhar o aprendizado do PostgreSQL do básico ao nível intermediário, sempre com exemplos que possam ser executados e adaptados.

- fundamentos e instalação
- tipos de dados e modelagem
- DDL e constraints
- INSERT, UPDATE e DELETE
- SELECT, filtros e agregações
- funções e operadores
- JOINs
- subconsultas e CTEs
- views e triggers
- PL/pgSQL
- transações e locks
- roles e privilégios
- backup e restore
- importação e exportação
- índices e análise com EXPLAIN
- exercícios

## Exemplos

Os scripts da pasta [`exemplos`](./exemplos) usam um banco de laboratório simples. O ponto é conseguir seguir os exemplos em sequência sem precisar montar um banco novo para cada assunto.

Comece por [`exemplos/01-schema.sql`](./exemplos/01-schema.sql) e depois carregue [`exemplos/02-dados.sql`](./exemplos/02-dados.sql).

## Wiki

A documentação está organizada em capítulos independentes. A [`Home`](./wiki/Home.md) traz o caminho sugerido para estudo.

## Rodando localmente

Com Docker:

```bash
docker compose up -d
```

Depois, conecte no banco `postgresql_ptbr` e execute os scripts necessários.

## Referência

A organização dos assuntos foi inspirada no tutorial de PostgreSQL do w3resource. O conteúdo deste projeto foi reescrito e os exemplos foram criados para este repositório; não se trata de uma tradução integral do material original.

- [Tutorial PostgreSQL — w3resource](https://w3resource.com/PostgreSQL/tutorial.php/)
- [Documentação oficial do PostgreSQL](https://www.postgresql.org/docs/)

## Licença

MIT
