# [CONSULTAS](https://docs.microsoft.com/pt-br/sql/t-sql/queries/queries?view=sql-server-2017)

## [TOP](https://docs.microsoft.com/pt-br/sql/t-sql/queries/top-transact-sql?view=sql-server-2017)
- TOP WITH TIES: traz os resultados do TOP que são iguais
:ex TOP 1 -> 1 registro 
WITH TIES -> n registros com valor igual

## [OVER](https://docs.microsoft.com/pt-br/sql/t-sql/queries/select-over-clause-transact-sql?view=sql-server-2017)
Determina o particionamento e ordenação de um conjuntos de linahs antes da aplicação de uma função de janela associada.

### Argumentos
- PARTITION BY: Divide o conjunto de resultados da consulta em partições. 
- UNBOUNDED PRECEDING: 
