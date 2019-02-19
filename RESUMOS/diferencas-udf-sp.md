User Defined Functions | Stores Procedures
--- | --- 
Tem que retornar um valor | Retornar valor é opcional. Pode retornar zero ou mais valores.
Tem que ser parte de uma declaração SQL para ser executado. | Pode ser executado usando o comando **EXECUTE**.
Funções podem ser chamados de uma procedure. | Procedures não podem ser chamadas de uma UDF.
Pode ter apenas parâmetros de inputs. | Pode ter parâmetros de input/output.
Não podem alterar os dados. | Pode alterar os objetos da base
**Inline User-Defined Functions** podem ser tratadas como Views com parâmetros e usada em *row set operations* e *JOINs*. | Não pode realizar o JOIN de um output da SP.
Podem ser usada em qualquer lugar da query, nas seções de WHERE / HAVING / SELECT. | Não pode ser usada em qualquer lugar.
**Inline functions** suportam apenas 1 SELECT por declaração. | Suporta qualquer numero de SELECT por declarações.
Permite apenas **SELECT**. | Permite **SELECT** e outras declarações DML.
Não suporta blocos **Try Catch**. | Suporta blocos **Try Catch**.
Funcões que retornam variáveis de tabela podem ser tratadas como qualquer outro conjunto de linha e pode ser usadada em JOINS com outras tabelas | Não suporta variáveis de tabela como tipo de retorno.
Pode usar todos os tipos que o SQL Server suporta | Não pode usar tipos como: *ntext*, *image* e *timestamp* como tipo de retorno.
Não suporta gerenciamento de transação | Suporta gerenciamento de transação (Transaction Managment).

[Fonte](https://www.c-sharpcorner.com/article/stored-procedures-vs-user-defined-functions-and-choosing-which-one-to-use/)