create role Diretor;

grant insert, update, delete, select
on all tables
in schema "public"
to Diretor;


create role Instrutor;

grant insert, update, delete, select
on chamada
to Instrutor;


create role Aluno;

grant select
on chamada
to Aluno;