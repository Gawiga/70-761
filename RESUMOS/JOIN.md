## [Joins](https://docs.microsoft.com/pt-br/sql/relational-databases/performance/joins)

O SQL Server emprega três tipos de operações de junção:
- Junções de Loops Aninhados
- Junções de mesclagem
- Junções de hash 

Junções internas podem ser especificadas nas cláusulas `FROM` ou `WHERE`.
Junções externas podem ser especificadas apenas na cláusula `FROM`.

### Conceitos básicos de junções
Uma condição de junção define o modo como duas tabelas são relacionadas em uma consulta por:    
-   Especificando a coluna de cada tabela a ser usada para a junção. 
-   Especificando um operador lógico (por exemplo, = ou <>).

**Colunas usadas em uma condição de junção não precisam ter o mesmo nome ou ter o mesmo tipo de dados**.
Entretanto, se os tipos de dados não forem idênticos, eles deverão ser compatíveis, ou do tipo que o SQL Server possa converter implicitamente. 
Se o tipo de dados não puder ser convertido implicitamente, a condição de junção deverá converter explicitamente o tipo de dados usando a função [`CAST`](https://docs.microsoft.com/pt-br/sql/t-sql/data-types/data-type-conversion-database-engine).

### Junções de Loops Aninhados
Se uma entrada de junção for pequena (menos que 10 linhas) e a outra entrada de junção for bastante grande e indexada a suas colunas de junção, uma junção de loops aninhados de índice será a operação de junção mais rápida porque eles requerem o mínimo de E/S e comparações.
No **plano de execução** seu `JOIN` deverá aparecer com `NESTED LOOPS (INNER JOIN)`. 

### Junções de Mesclagem
Se as duas entradas de junção não são pequenas, mas são classificadas na coluna de junção, uma junção de mesclagem será a operação de junção mais rápida. 
No **plano de execução** seu `JOIN` deverá aparecer com `MERGE JOIN (INNER JOIN)`. 

### Junções Hash
Junções de hash podem processar com eficácia **grande volume de entradas não classificadas e não indexadas**. Elas são úteis para resultados intermediários em consultas complexas por que:
- Os resultados intermediários não são indexados.
- Otimizadores de consulta só calculam tamanhos de resultado intermediário. 

A junção de hash permite reduções no uso da **desnormalização**. 
A junção hash tem duas entradas: a entrada `build` e entrada `probe`. O otimizador de consulta nomeia estes papéis de forma que a menor das duas entradas é a entrada de **build**.

**Tipos de Junções Hash**
1. Em **memória** - Primeiro verifica ou calcula a entrada de construção inteira e então constrói uma tabela de hash em memória
2. De **cortesia** - Se a entrada de construção não couber na memória, uma junção de hash continua em vários passos.
3. **Recursiva** - Se a entrada de construção for tão grande que entradas para uma fusão externa padrão requereriam níveis de fusão múltiplos, serão requeridos passos de particionamentos múltiplos e níveis de particionamentos múltiplos.

**Esgotamento de hash** - O termo de esgotamento de hash às vezes é usado para descrever junções hash de cortesia ou junções hash recursivas.

### Valores nulos e junções
A presença de valores nulos em uma coluna de uma das tabelas que estão sendo associadas pode ser retornada apenas usando uma junção externa (a menos que a cláusula `WHERE` exclua valores nulos). Quando os valores nulos estão presentes nos dados que estão sendo associados, geralmente é preferível omiti-los nos resultados usando uma junção comum.
