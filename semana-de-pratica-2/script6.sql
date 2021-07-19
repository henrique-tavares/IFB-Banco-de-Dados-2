CREATE TYPE produto_validade AS (
    validade_final date,
    id_produto int,
    descricao text
);

CREATE OR REPLACE FUNCTION produto_por_validade_final ()
    RETURNS SETOF produto_validade
    LANGUAGE plpgsql
    AS $$
DECLARE
    r produto_validade;
BEGIN
    FOR r IN
    SELECT
        preco.data_validade_final,
        prod.id_produto,
        prod.descricao
    FROM
        prd_produto prod
        INNER JOIN prd_preco_venda preco ON prod.id_produto = preco.id_produto
    GROUP BY
        (preco.data_validade_final,
            prod.id_produto,
            prod.descricao)
    ORDER BY
        (preco.data_validade_final)
            LOOP
                RETURN NEXT r;
            END LOOP;
    RETURN;
END;
$$;
