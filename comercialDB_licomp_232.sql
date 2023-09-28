create database comercialdb_licomp_232;

use comercialdb_licomp_232;

create table produtos(
    codigo int not null,
    constraint produtos_pk 
        primary key(codigo),
    nome varchar(100) not null,
    quantidade mediumint not null,
    valor decimal(18,2) not null
);

create table vendas(
  numero int not null,
  data date not null,
  constraint vendas_pk
	primary key(numero)
);

create table itensVendidos(
	produto int not null,
    venda int not null,
    qtde_vendida int not null,
    valor_vedido decimal not null,
    constraint itensVendidos_pk
		primary key(produto, venda),
	constraint itensVendidos_produtos_fk
		foreign key(produto)
        references produtos(codigo),
	constraint itensVendidos_vendas_fk
		foreign key(venda)
        references vendas(numero)
);

-- A.T.C
-- Criar a tabela vendas e pesquisar sobre
-- definição de FK no MYSQL

alter table produtos
add unidade char(50) default 'UN';

desc produtos;

alter table produtos
add constraint chk_quantidade 
	check(quantidade >= 0),
add constraint chk_valor
	check(valor >= 0);

desc produtos;
-- altere o tipo de dad da coluna unidade
-- de char(50) para varchar(50)
alter table produtos
modify unidade varchar(50);

-- modifique o nome da coluna quantidade para quant
alter table produtos
change quantidade quant mediumint(9); 
-- modifique o nome da coluna unidade para unidades 
-- e seu tipo para char(10);
alter table produtos
change unidade unidades char(10);

-- adicione na tabela vendas a coluna
-- vendedor do tipo inteiro e valor padrão "1"
alter table vendas
add vendedor int default 1;
desc vendas;

-- exclua a coluna vendedor da tabela vendas
alter table vendas
drop vendedor;

-- renomeie a tabela produtos para mercadorias
alter table produtos rename mercadorias;
show tables;

-- crie o banco de dados empresaDB
-- no banco dados empresaDB crie a tabela funcionarios
-- atendendo a especificação a seguir:
-- id, inteiro, obrigatorio, 
-- 		chave-primária, numeração automatica
-- nome, texto, tamanho 150, obrigatorio
-- nacionalidade, texto, tamanho 100, 
-- 		valor padrão brasileiro
-- sexo, caractere, tamanho 1, obrigatório, 
-- 		somente pode aceitar "F" ou "M"
-- salario, monetário, obrigatório,
-- 		não deve aceitar valor menor que 1000
-- telefone, caractere, tamanho 14
CREATE DATABASE EMPRESADB;
USE EMPRESADB;
CREATE TABLE FUNCIONARIOS(
	ID INTEGER NOT NULL AUTO_INCREMENT,
    CONSTRAINT FUNCIONARIOS_PK PRIMARY KEY(ID),
    NOME VARCHAR(150) NOT NULL,
    NACIONALIDADE VARCHAR(100) DEFAULT 'BRASILEIRO',
    SEXO CHAR(1) NOT NULL,
    CONSTRAINT FUNCIONARIOS_SEXO_CK CHECK(SEXO = 'm' || SEXO = 'M' || SEXO = 'f'|| SEXO = 'F'),
    SALARIO DECIMAL(18,2) NOT NULL,
    CONSTRAINT FUNCIONARIOS_SALARIO_CK CHECK(SALARIO >= 1000),
    TELEFONE CHAR(14)
);
DROP TABLE FUNCIONARIOS;
-- ADICIONE A TABELA FUNCIONARIOS A COLUNA EMAIL DO TIPO TEXTO TAMANHO 150, OBRIGATORIO E
-- NÃO DEVE ACEITAR EMAILS REPETIDOS
ALTER TABLE FUNCIONARIOS
ADD EMAIL VARCHAR(150) NOT NULL,
ADD constraint FUNCIONARIOS_EMAIL_UQ UNIQUE(EMAIL);
-- Adicione a tabela funcionarios os campos dia e mes aniversario do tipo inteiro, opcional
ALTER TABLE FUNCIONARIOS
ADD DIA_NIVER INT(2),
ADD MES_NIVER INT(2);

-- Garanta que para o dia e o mês do aniversário sejam fornecidos apenas valores validos
alter table funcionarios
add constraint funcionarios_dia_ck check(dia_niver >0 and dia_niver <= 31),
add constraint funcionarios_mes_ck check(mes_niver >0 and mes_niver <= 12);

-- liste a estrutura da tabela funcionarios
desc funcionarios;

-- Adicione à tabela FUNCIONARIOS a coluna cep,caractere, tamanho 9
alter table funcionarios
add cep char(9);

-- Data de entrega e apresentação:
-- 26/10/23
-- Valor: 3,0 pontos (defesa e documentação - 
-- PDF com capa, introduçao, desenvolvimento, conclusão e referências no padrão ABNT)
-- trabalho em equipe de 4 componentes:
-- pesquisar sobre
-- 1) O uso da IA com bancos de dados
-- Equipes 1 e 4
-- 2) Mercado de trabalho atual para profissionais especialistas em bancos de dados
-- Equipes 2 e 5
-- 3) Bancos de dados nao relacionais (dois mais utilizados e locais de aplicaçao) 
-- Equipes 3 e 6

-- Equipes
-- 1 - Álef, João Pedro, João Guilherme
-- 2 - Mikael, Yuri, Vinícius Herculano, Ewerton Patrick
-- 3 - Caio, Bruno, Caique
-- 4 - Júlio, Felipe, Maria, Edilene
-- 5 - Paulo Gustavo, Pedro Lucas, Lara, Daiane
-- 6 - Pedro Henrique, Victor, Ana Lidia, Noemi


select * from mercadorias;

desc mercadorias;

insert into mercadorias (codigo, nome, valor)
values(1, 'Uva', 12.50);

-- adicione o seguinte registro na tabela mercadorias:
-- código 2, goiaba, quantidade: 20, valor: 21,99, unidade: unidade
insert into mercadorias
values(2, 'Goiaba', 20, 21.99, 'unidade');

-- adicione o seguinte registro na tabela mercadorias na ordem informada a seguir:
-- unidades : embalagem; quantidade: 2; valor : 30.87; nome : Arroz; codigo : 3)
insert into mercadorias(unidades, quant, valor, nome, codigo)
values('embalagem', 2, 30.87, 'Arroz', 3);
