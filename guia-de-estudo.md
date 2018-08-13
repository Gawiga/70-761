# Guia de Estudo

## Gerenciar dados com o Transact-SQL

`(40–45%)`

### Criar consultas SELECT no Transact-SQL

* Identificar a estrutura adequada da consulta SELECT, 
* escrever consultas específicas para satisfazer os requisitos de negócios, 
* criar resultados a partir de várias consultas usando operadores de conjunto, 
* distinguir entre comportamento UNION e UNION ALL, 
* identificar a consulta que retorna os resultados esperados com base na estrutura da tabela e/ou nos dados fornecidos

  **Consultar várias tabelas usando junções**

* Escrever consultas com instrução de junção com base nas tabelas, dados e requisitos fornecidos; 
* determinar a utilização adequada de INNER JOIN, LEFT/RIGHT/FULL OUTER JOIN e CROSS JOIN; 
* criar vários operadores JOIN que usam AND e OR; 
* determinar os resultados corretos quando apresentados com instruções SELECT de várias tabelas e dados de origem; 
* escrever consultas com NULLs nas junções

  **Implementar Funções e agregar dados**

* Criar consultas usando funções com valor escalar e de tabela; 
* identificar o impacto do uso da função para consultar o desempenho e a "sargability" da cláusula WHERE; 
* identificar as diferenças entre funções deterministas e não deterministas; 
* usar funções agregadas internas; 
* usar funções aritméticas, funções relacionadas a datas e funções do sistema

  **Modificar dados**

* Escrever instruções INSERT, UPDATE e DELETE; 
* determinar quais instruções podem ser usadas para carregar dados para uma tabela com base em sua estrutura e limitações; 
* criar instruções de DML \(Linguagem de manipulação de dados\) usando a instrução OUTPUT; 
* determinar os resultados de instruções DDL \(Linguagem de Definição de Dados\) nas tabelas e nos dados fornecidos

## Consultar dados com componentes avançados do T-SQL

`(30–35%)`

### Consultar dados usando subconsultas e APPLY

* Determinar os resultados das consultas usando subconsultas e junções de tabela, 
* avaliar as diferenças de desempenho entre as junções de tabela e as subconsultas correlacionadas com base nos dados fornecidos e nos planos de consulta, 
* diferenciar entre o uso de CROSS APPLY e OUTER APPLY, 
* escrever instruções APPLY que retornem um conjunto de dados específico com base nos dados fornecidos

  **Consultar dados usando expressões de tabela**

* Identificar os componentes básicos de expressões de tabela, 
* definir as diferenças de uso entre as expressões de tabela e as tabelas temporárias,
* criar expressões de tabela recursivas para atender aos requisitos comerciais

  **Agrupar e dinamizar dados usando consultas**

* Usar as funcionalidades de janela para agrupar e classificar os resultados de uma consulta; 
* distinguir entre o uso de funcionalidades de janela e GROUP BY; 
* criar cláusulas GROUP BY complexas usando GROUP SETS e CUBE; 
* criar instruções PIVOT e UNPIVOT para mostrar os resultados desejados com base nos dados fornecidos; 
* determinar o impacto de valores NULL em consultas PIVOT e UNPIVOT

  **Consultar dados temporais e não relacionais**

* Consultar dados históricos usando tabelas temporais, 
* consultar e mostrar dados JSON, 
* consultar e mostrar dados XML

  **Programar bancos de dados usando Transact-SQL**

  `(25–30%)`

  **Criar objetos de programação de bancos de dados usando Transact-SQL**

* Criar procedimentos armazenados, 
* funções definidas pelo usuário para valores escalares e de tabela e exibições; 
* implementar parâmetros de entrada e saída em procedimentos armazenados; 
* identificar se é preciso usar funções com valor escalar ou de tabela; 
* distinguir entre funções deterministas e não deterministas; 
* criar exibições indexadas

  **Implementar tratamento de erros e transações**

* Determinar os resultados de instruções de DDL \(Linguagem de Definição de Dados\) com base em instruções de controle de transações, 
* implementar o tratamento de erro TRY…CATCH com Transact-SQL, 
* gerar mensagens de erro com THROW e RAISERROR, 
* implementar controle de transações em conjunto com tratamento de erros em procedimentos armazenados

  **Implementar tipos de dados e NULLs**

* Avaliar os resultados das conversões de tipo de dados, 
* determinar os tipos de dados certos para determinados elementos de dados ou colunas da tabela, 
* identificar os locais de conversões de tipo de dados implícitas em consultas, 
* determinar os resultados corretos de junções e funções na presença de valores NULL, 
* identificar o uso correto de funções ISNULL e COALESCE

