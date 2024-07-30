CREATE TABLE pessoa (
  id_pessoa INTEGER IDENTITY NOT NULL PRIMARY KEY,
  nome VARCHAR(255) NULL,
  logradouro VARCHAR(255) NULL,
  cidade VARCHAR(255) NULL,
  estado CHAR(2) NULL,
  telefone VARCHAR(11) NULL,
  email VARCHAR(255) NULL
);

CREATE TABLE pessoa_fisica (
  id_pessoa_fisica INTEGER IDENTITY NOT NULL PRIMARY KEY,
  pessoa_id_pessoa INTEGER NOT NULL CHECK (pessoa_id_pessoa > 0),
  cpf VARCHAR(11) NULL
);

CREATE TABLE pessoa_juridica (
  id_pessoa_juridica INTEGER IDENTITY NOT NULL PRIMARY KEY,
  pessoa_id_pessoa INTEGER NOT NULL CHECK (pessoa_id_pessoa > 0),
  cnpj VARCHAR(20) NULL
);

CREATE TABLE movimento (
  id_movimento INTEGER IDENTITY NOT NULL PRIMARY KEY,
  pessoa_id_pessoa INTEGER NOT NULL CHECK (pessoa_id_pessoa > 0),
  produto_id_produto INTEGER NOT NULL CHECK (produto_id_produto > 0),
  usuario_id_usuario INTEGER NOT NULL CHECK (usuario_id_usuario > 0),
  quantidade INTEGER NULL CHECK (quantidade > 0),
  tipo CHAR(1) NULL,
  valor_unitario NUMERIC(10, 2) NULL
);

CREATE TABLE produto (
  id_produto INTEGER IDENTITY NOT NULL PRIMARY KEY,
  nome VARCHAR(255) NULL,
  quantidade INTEGER NULL CHECK (quantidade > 0),
  precoVenda NUMERIC(10, 2) NULL 
);

CREATE TABLE usuario (
  id_usuario INTEGER IDENTITY NOT NULL PRIMARY KEY,
  login VARCHAR(25) NULL,
  senha VARCHAR(25) NULL
);

CREATE INDEX pessoa_fisica_FKIndex1 ON pessoa_fisica(pessoa_id_pessoa);

CREATE INDEX pessoa_juridica_FKIndex1 ON pessoa_juridica(pessoa_id_pessoa);

CREATE INDEX movimento_FKIndex1 ON movimento(usuario_id_usuario);
CREATE INDEX movimento_FKIndex2 ON movimento(produto_id_produto);
CREATE INDEX movimento_FKIndex3 ON movimento(pessoa_id_pessoa);