# Pesquisas de assuntos paralelos mas relacionados com SQL

[Artigo explicando Key Lookup e RID Lookup](https://imasters.com.br/data/escovando-bit-com-operadores-key-lookup-e-rid-lookup)
O artigo também explica porque as vezes encontramos Index Seek seguido por Key Lookup, o motivo é porque o index utilizado não cobre todos os atributos utilizados na consulta.
O RID Lookup ocorre quando há ausência de indexes na tabela.
