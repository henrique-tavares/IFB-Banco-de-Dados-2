BEGIN;
SELECT
    *
FROM
    insert_prd_unidade_medida ('miligramas');
COMMIT;

BEGIN;
SELECT
    *
FROM
    insert_prd_marca ('marca inválida');
ROLLBACK;

BEGIN;
SELECT
    *
FROM
    insert_prd_produto (123, 'banana', 1, 1, 'em estoque', 0.8, 0.75, 30, 1, '52918457', 3);
SAVEPOINT svp_1;
SELECT
    *
FROM
    insert_prd_produto_similar (3, 2);
ROLLBACK TO svp_1;

COMMIT;
