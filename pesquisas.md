## [Artigo explicando Key Lookup e RID Lookup](https://imasters.com.br/data/escovando-bit-com-operadores-key-lookup-e-rid-lookup)

O artigo também explica porque as vezes encontramos **Index Seek** seguido por **Key Lookup**.
O motivo é porque o index utilizado não cobre todos os atributos utilizados na consulta.
O RID Lookup ocorre quando há ausência de indexes na tabela.

## [Resumo de Índices Clusterizados e Não Clusterizados](https://docs.microsoft.com/pt-br/sql/relational-databases/indexes/clustered-and-nonclustered-indexes-described?view=sql-server-2017)

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
