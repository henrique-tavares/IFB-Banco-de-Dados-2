CREATE ROLE gestor_produto WITH LOGIN PASSWORD 'gestor';

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA "public" TO gestor_produto;
