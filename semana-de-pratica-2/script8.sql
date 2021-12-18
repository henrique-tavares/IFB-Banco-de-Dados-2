CREATE TABLE prd_preco_venda_auditoria (
    usuario name NOT NULL,
    data date NOT NULL,
    operacao text NOT NULL
);

CREATE OR REPLACE FUNCTION audit_prd_preco_venda ()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO prd_preco_venda_auditoria (
        usuario,
        data,
        operacao)
    VALUES (
        CURRENT_USER,
        CURRENT_DATE,
        TG_OP);
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_audit_prd_preco_venda
    AFTER INSERT OR UPDATE OR DELETE ON prd_preco_venda
    FOR EACH ROW
    EXECUTE FUNCTION audit_prd_preco_venda ();
