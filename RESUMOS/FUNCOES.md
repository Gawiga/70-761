# [Funções](https://docs.microsoft.com/pt-BR/sql/t-sql/functions/functions?view=sql-server-2017)
- Funções podem ser [determínisticas ou não determinísticas](https://docs.microsoft.com/pt-BR/sql/relational-databases/user-defined-functions/deterministic-and-nondeterministic-functions?view=sql-server-2017)

## [Funções de agregação](https://docs.microsoft.com/pt-BR/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-2017)
- EXECUTAM 1 cálculo em 1 CONJUNTO de valores e RETORNAM 1 único valor.
- Com exceção de **COUNT()** essas funções ignoram valores NULOS
- São usadas em cláusulas SELECT com um GROUP BY e HAVING
- Todas as funções de agregação são **deterministícas**

ex: **AVG()** | **COUNT()** | **MAX()** | **SUM()** | **MIN()**

## [Funções matemáticas](https://docs.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql)
- Executam um cálculo e retornam um valor númerico

ex: **CEILING()** | **ROUND()** | **SIN()** | **TAN()** | **RAND()**
