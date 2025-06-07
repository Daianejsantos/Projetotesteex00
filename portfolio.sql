create database Uniteste;

use Uniteste;

create table aluno (
id int primary key not null auto_increment,
nome_completo varchar(100),
data_nascimento date
);

create table endereco (
id int not null primary key auto_increment,
logradouro varchar(45),
bairro varchar (45),
cep int,
cidade varchar (45),
estado varchar (45),
id_aluno int not null,

constraint fk_endereco_aluno
foreign key (id_aluno)
references aluno (id)
);

create table telefone (
 id int not null primary key auto_increment,
 numero varchar (45) not null,
 id_aluno int not null,
 
 constraint fk_telefone_aluno
 foreign key (id_aluno)
 references aluno (id)
);

create table email (
  id int not null primary key auto_increment,
  email varchar (250) not null,
  id_aluno int not null,
  
  constraint fk_email_aluno
  foreign key (id_aluno)
  references aluno (id)
  );
  
  show tables;
  
  create table professor (
id int primary key not null auto_increment,
nome varchar(100) not null,
especialidade varchar(100) not null
);

create table tbl_telefone (
 id int not null primary key auto_increment,
 numero varchar (45) not null,
 id_professor int not null,
 
 constraint fk_telefone_professor
 foreign key (id_professor)
 references professor (id)
);

create table tbl_email (
  id int not null primary key auto_increment,
  email varchar (250) not null,
  id_professor int not null,
  
  constraint fk_email_professor
  foreign key (id_professor)
  references professor (id)
   );

create table curso (
id int not null primary key auto_increment,
curso varchar(50) not null,
descricao varchar(100) not null
);

create table materia (
id int primary key not null auto_increment,
nome varchar(50),
carga_horaria int not null,
id_curso int not null,

constraint fk_materia_curso
foreign key (id_curso)
references curso (id)
);

create table turma (
id int primary key not null auto_increment,
ano_semestre varchar(45),
periodo varchar(45),
tipo varchar (45),
id_materia int not null,
id_professor int not null,

constraint fk_turma_materia
foreign key (id_materia)
references materia (id),

constraint fk_turma_professor
foreign key (id_professor)
references professor (id)
);

create table matricula_turma (
id int primary key not null auto_increment,
data_matricula date,
id_aluno int not null,
id_turma int not null,

constraint fk_matricula_turma_aluno
foreign key (id_aluno)
references aluno (id),

constraint fk_matricula_turma_turma
foreign key (id_turma)
references turma (id)
);

create table nota (
id int primary key not null auto_increment,
tipo_avaliacao varchar(50),
valor_nota decimal,
data_avalicao date,
id_matricula_turma int not null,

constraint fk_nota_matricula_turma
foreign key (id_matricula_turma)
references matricula_turma (id)
);

