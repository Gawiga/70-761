## [Key Lookup e RID Lookup](https://imasters.com.br/data/escovando-bit-com-operadores-key-lookup-e-rid-lookup)

O artigo também explica porque as vezes encontramos **Index Seek** seguido por **Key Lookup**.
O motivo é porque o index utilizado não cobre todos os atributos utilizados na consulta.
O RID Lookup ocorre quando há ausência de indexes na tabela.

## Ordem de execução

**Semântica**
```SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

**Real**
```FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
```

[Mais informacações](https://www.periscopedata.com/blog/sql-query-order-of-operations)