drop database if exists emergia;
create database if not exists emergia;

use emergia;

-- periodo: dia, mês, ano...
create table periodo (
id int not null,
dias int,
nome varchar(16),
primary key (id));
insert into periodo (id, dias, nome) values (1, 1, 'dia'), (2, 30, 'mês'), (3, 365, 'ano');

-- unidades de medida: kWh, m, m¹, m², ton...
create table unidade (
id int not null,
nome varchar(16),
primary key (id));
insert into unidade (id, nome) values (1, 'm'), (2, 'm2'), (3, 'm3'), (4, 'ton'), (5, 'kWh'), (6, 'litro'), (7, 'dólar');

-- recursos e suas transformidaes:
create table componente (
id int not null auto_increment,
titulo varchar(64),
transformidade float(24),
periodoId int,
unidadeId int,
foreign key (unidadeId) references unidade(id)ON DELETE CASCADE,
foreign key (periodoId) references periodo(id)ON DELETE CASCADE,
primary key (id)
);

-- Tipos de sistema: fundição, construção
create table sistema (
id int not null auto_increment,
titulo varchar(128),
primary key (id)
);

-- relaciona quais componentes pertencem a quais sistemas...
create table sistema_componente (
id int not null auto_increment,
sistemaId int,
componenteId int,
primary key (id),
foreign key (sistemaId) references sistema(id)ON DELETE CASCADE,
foreign key (componenteId) references componente(id)ON DELETE CASCADE
);


