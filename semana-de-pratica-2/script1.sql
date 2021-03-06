CREATE TABLE PRD_DEPARTAMENTO (
    ID_DEPARTAMENTO serial PRIMARY KEY NOT NULL,
    DESCRICAO text NOT NULL
);

CREATE TABLE PRD_CATEGORIA (
    ID_CATEGORIA serial PRIMARY KEY NOT NULL,
    DESCRICAO text NOT NULL,
    ID_DEPARTAMENTO int NOT NULL,
    CONSTRAINT fk_prd_categoria_id_departamento FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES PRD_DEPARTAMENTO (ID_DEPARTAMENTO)
);

CREATE TABLE PRD_SUBCATEGORIA (
    ID_SUBCATEGORIA serial PRIMARY KEY NOT NULL,
    DESCRICAO text NOT NULL,
    ID_CATEGORIA int NOT NULL,
    CONSTRAINT fk_prd_subcategoria_id_categoria FOREIGN KEY (ID_CATEGORIA) REFERENCES PRD_CATEGORIA (ID_CATEGORIA)
);

CREATE TABLE PRD_MARCA (
    ID_MARCA serial PRIMARY KEY NOT NULL,
    DESCRICAO text NOT NULL
);

CREATE TABLE PRD_PRODUTO (
    ID_PRODUTO serial PRIMARY KEY NOT NULL,
    CODIGO int NOT NULL,
    DESCRICAO text NOT NULL,
    ID_SUBCATEGORIA int NOT NULL,
    ID_MARCA int NOT NULL,
    ID_UNIDADE_MEDIDA int,
    ESPECIFICACAO_TECNICA varchar(100),
    STATUS varchar(100) NOT NULL,
    PESO_BRUTO decimal(8, 2) NOT NULL,
    PESO_LIQUIDO decimal(8, 2) NOT NULL,
    QTD_MULT int NOT NULL,
    QTD_MIN int NOT NULL,
    COD_BARRA varchar(50) NOT NULL,
    CONSTRAINT fk_prd_produto_id_marca FOREIGN KEY (ID_MARCA) REFERENCES PRD_MARCA (ID_MARCA),
    CONSTRAINT fk_prd_produto_id_subcategoria FOREIGN KEY (ID_SUBCATEGORIA) REFERENCES PRD_SUBCATEGORIA (ID_SUBCATEGORIA)
);

CREATE TABLE PRD_PRODUTO_SIMILAR (
    ID_PRODUTO int NOT NULL,
    ID_PRODUTO_SIMILAR int NOT NULL,
    PRIMARY KEY (ID_PRODUTO, ID_PRODUTO_SIMILAR),
    CONSTRAINT fk_prd_produto_similar_id_produto_similar FOREIGN KEY (ID_PRODUTO_SIMILAR) REFERENCES PRD_PRODUTO (ID_PRODUTO),
    CONSTRAINT fk_prd_produto_similar_id_produto FOREIGN KEY (ID_PRODUTO) REFERENCES PRD_PRODUTO (ID_PRODUTO)
);

CREATE TABLE PRD_UNIDADE_MEDIDA (
    ID_UNIDADE_MEDIDA serial PRIMARY KEY NOT NULL,
    DESCRICAO text NOT NULL,
    ID_PRODUTO int,
    CONSTRAINT fk_prd_unidade_medida_id_produto FOREIGN KEY (ID_PRODUTO) REFERENCES PRD_PRODUTO (ID_PRODUTO)
);

ALTER TABLE PRD_PRODUTO
    ADD CONSTRAINT fk_prd_produto_id_unidade_medida FOREIGN KEY (ID_UNIDADE_MEDIDA) REFERENCES PRD_UNIDADE_MEDIDA (ID_UNIDADE_MEDIDA);

CREATE TABLE PRD_PRECO_VENDA (
    ID_PRECO_VENDA serial PRIMARY KEY NOT NULL,
    ID_PRODUTO int,
    PRECO_VENDA decimal(8, 2) NOT NULL,
    DATA_VALIDADE_INICIAL date NOT NULL,
    DATA_VALIDADE_FINAL date,
    CONSTRAINT fk_prd_preco_venda_id_produto FOREIGN KEY (ID_PRODUTO) REFERENCES PRD_PRODUTO (ID_PRODUTO)
);
