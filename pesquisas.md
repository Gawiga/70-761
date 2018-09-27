## [Key Lookup e RID Lookup](https://imasters.com.br/data/escovando-bit-com-operadores-key-lookup-e-rid-lookup)

O artigo também explica porque as vezes encontramos **Index Seek** seguido por **Key Lookup**.
O motivo é porque o index utilizado não cobre todos os atributos utilizados na consulta.
O RID Lookup ocorre quando há ausência de indexes na tabela.

## [Índices](https://docs.microsoft.com/pt-br/sql/relational-databases/indexes/clustered-and-nonclustered-indexes-described?view=sql-server-2017)

Um índice é uma estrutura em disco associada a uma tabela, contém chaves que são armazenadas em uma estrutura para **localizar** as linhas associadas aos **valores chave de forma rápida e eficaz**.

Tanto os índices clusterizados quanto os não clusterizados podem ser exclusivos. Isso significa que duas linhas não podem ter o mesmo valor que a chave de índice. 

### Índice Clusterizado
Classificam e armazenam as linhas de dados com base em seus valores de chave. Pode haver **apenas um índice clusterizado por tabela**, pois as linhas de dados podem ser classificadas somente em **uma única ordem**. 

O único momento em que as linhas de dados de uma tabela **são armazenadas na ordem** de classificação é **quando contém um índice clusterizado**. 

Se a tabela contiver um índice clusterizado, será denominada tabela clusterizada. 
Se a tabela **não possuir nenhum índice clusterizado**, suas linhas de dados ficarão armazenadas em uma estrutura não ordenada denominada **heap**.

### Índice Não Clusterizado
Contém os valores de chave de índice não clusterizado e cada entrada de valor de chave tem um ponteiro para a linha de dados que contém o valor de chave.

O ponteiro de uma linha de índice em um índice não clusterizado de uma linha de dados é denominado **localizador de linhas**. 
A estrutura do localizador de linhas depende de as páginas de dados serem armazenadas em um heap ou em uma tabela clusterizada.

**Para o heap, o localizador de linhas é um ponteiro para a linha. Para a tabela clusterizada, o localizador de linhas é a chave de índice clusterizado.**

Você pode adicionar colunas não chave ao nível folha do índice não clusterizado para ignorar os limites de chave de índice existente e executar consultas completamente abrangidas e indexadas. 

### Mais sobre índices
Os índices **são criados automaticamente** quando as restrições *PRIMARY KEY* e *UNIQUE* são definidas em colunas de tabelas.

Índices bem projetados podem reduzir as operações de E/S de disco e consumir menos recursos de sistema, aprimorando o desempenho das consultas. Em geral, fazer pesquisas no índice é muito mais rápido do que na tabela, porque diferentemente da tabela, o índice contém, com frequência, poucas colunas por linha e as linhas ficam na ordem de classificação.

[Guia de Arquitetura e Design de Indexes](https://docs.microsoft.com/pt-br/sql/relational-databases/sql-server-index-design-guide)

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
