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
-- 		não deve aceitar valor meno que 1000
-- telefone, caractere, tamanho 14


 