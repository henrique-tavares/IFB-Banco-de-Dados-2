CREATE OR REPLACE FUNCTION insert_prd_departamento (
    descricao text
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_departamento (
        descricao)
    VALUES (
        descricao);
END;
$$;

CREATE OR REPLACE FUNCTION insert_prd_categoria (
    descricao text,
    id_descricao int
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_categoria (
        descricao,
        id_departamento)
    VALUES (
        descricao,
        id_descricao);
END;
$$;

CREATE OR REPLACE FUNCTION insert_prd_subcategoria (
    descricao text,
    id_categoria int
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_subcategoria (
        descricao,
        id_categoria)
    VALUES (
        descricao,
        id_categoria);
END;
$$;

CREATE OR REPLACE FUNCTION insert_prd_marca (
    descricao text
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_marca (
        descricao)
    VALUES (
        descricao);
END;
$$;

CREATE OR REPLACE FUNCTION insert_prd_unidade_medida (
    descricao text,
    id_produto int DEFAULT NULL
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_unidade_medida (
        descricao,
        id_produto)
    VALUES (
        descricao,
        id_produto);
END;
$$;

CREATE OR REPLACE FUNCTION insert_prd_produto (
    codigo int,
    descricao text,
    id_subcategoria int,
    id_marca int,
    status varchar(100),
    peso_bruto decimal(8, 2),
    peso_liquido decimal(8, 2),
    qtd_mult int,
    qtd_min int,
    cod_barra varchar(50),
    id_unidade_medida int DEFAULT NULL,
    especificacao_tecnica varchar(100) DEFAULT NULL
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_produto (
        codigo,
        descricao,
        id_subcategoria,
        id_marca,
        status,
        peso_bruto,
        peso_liquido,
        qtd_mult,
        qtd_min,
        cod_barra,
        id_unidade_medida,
        especificacao_tecnica)
    VALUES (
        codigo,
        descricao,
        id_subcategoria,
        id_marca,
        status,
        peso_bruto,
        peso_liquido,
        qtd_mult,
        qtd_min,
        cod_barra,
        id_unidade_medida,
        especificacao_tecnica);
END;
$$;

CREATE OR REPLACE FUNCTION insert_prd_produto_similar (
    id_produto int,
    id_produto_similar int
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_produto_similar (
        id_produto,
        id_produto_similar)
    VALUES (
        id_produto,
        id_produto_similar);
END;
$$;

CREATE OR REPLACE FUNCTION insert_prd_preco_venda (
    id_produto int,
    preco_venda decimal(8, 2),
    data_validade_inicial date,
    data_validade_final date DEFAULT NULL
)
    RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_preco_venda (
        id_produto,
        preco_venda,
        data_validade_inicial,
        data_validade_final)
    VALUES (
        id_produto,
        preco_venda,
        data_validade_inicial,
        data_validade_final);
END;
$$;
