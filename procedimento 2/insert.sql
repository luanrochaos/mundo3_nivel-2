-- 1. b. dados completos do usuario

insert into usuario (login, senha)
VALUES ('op1', 'op1'), ('op2', 'op2');


-- 1. c. dados completos do produto

insert into usuario (nome, quantidade, precoVenda)
VALUES ('Banana', 100, 5.00), ('Laranja', 500, 2.00), ('Manga', 800, 4.00);


-- 2. b. Incluir na tabela pessoa os dados comuns

INSERT INTO pessoa (nome, logradouro, cidade, estado, telefone, email)
VALUES
('João da Silva', 'Rua das Flores', 'São Paulo', 'SP', '11999999999', 'joao.silva@email.com'),
('Maria da Silva', 'Rua dos Pinheiros', 'São Paulo', 'SP', '11999999999', 'maria.silva@email.com'),
('Empresa XPTO', 'Rua dos Negócios', 'São Paulo', 'SP', '11999999999', 'empresa.xpto@email.com');


-- 2. c. Incluir em pessoa física o CPF, efetuando o relacionamento com pessoa.

INSERT INTO pessoa_fisica (pessoa_id_pessoa, cpf)
VALUES (1, '12345678900'), (2, '98765432100');


-- 2. d. Incluir em pessoa jurídica o CNPJ, relacionando com pessoa.

INSERT INTO pessoa_juridica (pessoa_id_pessoa, cnpj)
VALUES (3, '12345678000101');