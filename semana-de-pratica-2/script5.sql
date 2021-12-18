CREATE OR REPLACE FUNCTION sum_preco_venda ()
    RETURNS float
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN sum(preco_venda)
FROM
    prd_preco_venda;
END;
$$;
