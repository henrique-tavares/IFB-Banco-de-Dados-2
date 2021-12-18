alter table aluno
	add constraint chk_aluno_altura check (altura > 0 and altura <= 2.5),
	add constraint chk_aluno_peso check (peso > 0 and peso <= 400);