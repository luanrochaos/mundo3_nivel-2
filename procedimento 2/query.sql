-- 4. a. Dados completos de pessoas físicas

SELECT P.id_pessoa, P.nome, P.logradouro, P.cidade, P.estado, P.telefone, P.email, PF.cpf
FROM Pessoa AS P 
INNER JOIN pessoa_fisica AS PF ON P.id_pessoa = PF.id_pessoa;


-- 4. b. Dados completos de pessoas jurídicas

SELECT P.id_pessoa, P.nome, P.logradouro, P.cidade, P.estado, P.telefone, P.email, PJ.cnpj
FROM Pessoa AS P
INNER JOIN pessoa_juridica AS PJ ON P.id_pessoa = PJ.id_pessoa;


-- 4. c. Movimentações de entrada, com produto, fornecedor, quantidade, preço unitário e valor total

SELECT M.tipo AS tipo_movimentacao, P.nome AS Produto, F.nome AS Fornecedor, M.quantidade AS Quantidade, M.valor_unitario AS preco_unitario, (M.quantidade * M.valor_unitario) AS valor_total
FROM Movimento AS M 
INNER JOIN Pessoa AS F ON M.id_pessoa = F.id_pessoa
INNER JOIN Produto AS P ON M.id_produto = P.id_produto
WHERE M.tipo = 'E';


-- 4. d. Movimentações de saída, com produto, comprador, quantidade, preço unitário e valor total

SELECT M.tipo AS tipo_movimentacao, P.nome AS Produto, PF.nome AS Comprador, M.quantidade AS Quantidade, M.valor_unitario AS preco_unitario, (M.quantidade * M.valor_unitario) AS valor_total
FROM Movimento AS M 
INNER JOIN Pessoa AS PF ON M.id_pessoa = PF.id_pessoa
INNER JOIN Produto AS P ON M.id_produto = P.id_produto
WHERE M.tipo = 'S';


-- 4. e. Valor total das entradas agrupadas por produto

SELECT P.nome AS produto_entrada,
    SUM(M.quantidade) AS quantidade_total,
    SUM(M.quantidade * M.valor_unitario) AS valor_total
FROM Movimento AS M 
INNER JOIN Produto AS P ON M.id_produto = P.id_produto
WHERE M.tipo = 'E'
GROUP BY P.nome;


-- 4. f. Valor total das saídas agrupadas por produto

SELECT P.nome AS produto_saida,SUM(M.quantidade) AS quantidade_total, SUM(M.quantidade * M.valor_unitario) AS valor_total
FROM Movimento AS M
INNER JOIN Produto AS P ON M.id_produto = P.id_produto
WHERE M.tipo = 'S'
GROUP BY P.nome;


-- 4. g. Operadores que não efetuaram movimentações de entrada (compra)

SELECT U.login AS Operador
FROM Usuario AS U
WHERE NOT EXISTS (SELECT 1 FROM Movimento AS M WHERE M.Usuario_id_usuario = U.id_usuario AND M.tipo = 'E');


-- 4. h. Valor total de entrada, agrupado por operador

SELECT U.login AS operador_entrada, SUM(M.quantidade) AS quantidade_total, SUM(M.quantidade * M.valor_unitario) AS valor_total
FROM Movimento AS M
INNER JOIN Usuario AS U ON M.id_usuario = U.id_usuario
WHERE M.tipo = 'E'
GROUP BY U.login;


-- 4. i. Valor total de saída, agrupado por operador

SELECT U.login AS operador_saida, SUM(M.quantidade) AS quantidade_total, SUM(M.quantidade * M.valor_unitario) AS valor_total
FROM Movimento AS M
INNER JOIN Usuario AS U ON M.id_usuario = U.id_usuario
WHERE M.tipo = 'S'
GROUP BY U.login;


-- 4. j. Valor médio de venda por produto, utilizando média ponderada

SELECT P.nome AS produto_saida, SUM(M.quantidade) AS quantidade_total, SUM(M.quantidade * M.valor_unitario) / SUM(M.quantidade) AS valor_ponderado, SUM(M.quantidade * M.valor_unitario) AS valor_total
FROM Movimento AS M
INNER JOIN Pessoa AS PF ON M.id_pessoa = PF.id_pessoa
INNER JOIN Produto AS P ON M.id_produto = P.id_produto
WHERE M.tipo = 'S'
GROUP BY P.nome;
