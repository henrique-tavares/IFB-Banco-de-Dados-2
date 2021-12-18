CREATE OR REPLACE FUNCTION check_preco_venda ()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.preco_venda <= 0.0 THEN
        RAISE EXCEPTION 'O preco de venda do produto não pode ser igual ou menor a zero';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_check_preco_venda
    BEFORE INSERT OR UPDATE ON prd_preco_venda
    FOR EACH ROW
    EXECUTE FUNCTION check_preco_venda ();
