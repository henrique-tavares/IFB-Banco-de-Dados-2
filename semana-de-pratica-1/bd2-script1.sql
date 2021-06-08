create table instrutor (
	idinstrutor serial not null primary key,
	RG int not null,
	nome varchar(45) not null,
	nascimento date,
	titulacao int
);

create table telefone_instrutor (
	idtelefone serial not null primary key,
	numero int not null,
	tipo varchar(45),
	instrutor_idinstrutor int not null,
	constraint fk_instrutor_telefone_instrutor foreign key (instrutor_idinstrutor) references instrutor(idinstrutor) on delete restrict on update cascade
);

create table atividade (
	idatividade serial not null primary key,
	nome varchar(100) not null
);

create table turma (
	idturma serial not null primary key,
	horario time,
	duracao int,
	dataInicio date,
	dataFim date,
	atividade_idatividade int not null,
	instrutor_idinstrutor int not null,
	constraint fk_atividade_turma foreign key (atividade_idatividade) references atividade(idatividade) on delete restrict on update cascade,
	constraint fk_instrutor_turma foreign key (instrutor_idinstrutor) references instrutor(idinstrutor) on delete restrict on update cascade
);

create table aluno (
	codMatricula int not null primary key,
	turma_idturma int,
	dataMatricula date not null,
	nome varchar(45) not null,
	endereco text,
	telefone int,
	dataNascimento date,
	altura decimal(3,2),
	peso int,
	constraint fk_turma_aluno foreign key (turma_idturma) references turma(idturma) on delete restrict on update cascade
);

create table matricula (
	aluno_codMatricula int not null,
	turma_idturma int not null,
	constraint pk_matricula primary key (aluno_codMatricula, turma_idturma),
	constraint fk_aluno_matricula foreign key (aluno_codMatricula) references aluno(codMatricula) on delete restrict on update cascade,
	constraint fk_turma_matricula foreign key (turma_idturma) references turma(idturma) on delete restrict on update cascade
);

create table chamada (
	idchamada serial not null primary key,
	data date not null,
	presente bool not null,
	matricula_aluno_codMatricula int not null,
	matricula_turma_idturma int not null,
	constraint fk_matricula_chamada foreign key (matricula_aluno_codMatricula, matricula_turma_idturma) references matricula(aluno_codMatricula, turma_idturma) on delete restrict on update cascade
);