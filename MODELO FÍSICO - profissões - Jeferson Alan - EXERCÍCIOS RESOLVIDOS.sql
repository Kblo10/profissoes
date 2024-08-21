USE profissoes;

SELECT * FROM cliente;
SELECT * FROM profissao;

DESC profissao;
INSERT INTO profissao (cargo, descricao)
	VALUES ('Chefia', 'Comanda todas as áreas') ;
	

-- 1. Listar todos os clientes
SELECT * FROM cliente ;

-- 2. Exibir os nomes e telefones dos clientes
SELECT nome, tel FROM cliente ;

-- 3. Listar os clientes que nasceram após 1980
SELECT nome, data_nasc FROM cliente 
	WHERE data_nasc > '1980-01-01' ;

-- 4. Contar o número de clientes na tabela
SELECT COUNT(nome) AS Total_cliente FROM cliente;

-- 5. Encontrar o cliente mais velho (menor data de nascimento)
SELECT nome, data_nasc FROM cliente
	 WHERE data_nasc = (SELECT MIN(data_nasc) FROM cliente) ;
     
-- 6. Exibir os nomes dos clientes e seus cargos (usando subconsulta)
SELECT nome, (SELECT cargo FROM profissao
				WHERE profissao.id = cliente.id_profissao) AS cargo
FROM cliente ;

-- 7. Listar clientes que não possuem profissão associada
SELECT cliente.nome, profissao.descricao FROM cliente
	JOIN profissao ON cliente.id_profissao = profissao.id
	WHERE id_profissao = 6 ;
    
-- 8. Exibir o número de clientes para cada profissão
SELECT profissao.cargo, COUNT(cliente.id) AS numero_clientes
	FROM cliente
    JOIN profissao ON profissao.id = cliente.id_profissao
    GROUP BY profissao.cargo ;
    
-- 9. Listar clientes junto com suas profissões (INNER JOIN)
SELECT cliente.nome, profissao.cargo, profissao.descricao FROM cliente
	JOIN profissao ON profissao.id = cliente.id_profissao ;
    
-- 10. Listar todos os clientes, incluindo aqueles sem profissão (LEFT OUTER JOIN)
SELECT cliente.nome, profissao.cargo, profissao.descricao FROM cliente
	LEFT JOIN profissao ON profissao.id = cliente.id_profissao ;
    
-- 11. Listar todas as profissões e os clientes associados, incluindo profissões sem clientes (RIGHT OUTER JOIN)
SELECT cliente.nome, profissao.cargo, profissao.descricao FROM cliente
	RIGHT JOIN profissao ON profissao.id = cliente.id_profissao ;
    
-- 12. Listar todos os clientes e suas profissões, incluindo clientes sem profissão e profissões sem clientes (FULL OUTER JOIN)
SELECT cliente.nome, profissao.cargo, profissao.descricao FROM cliente
LEFT JOIN profissao ON cliente.id_profissao = profissao.id
UNION
SELECT cliente.nome, profissao.cargo, profissao.descricao
FROM cliente
RIGHT JOIN profissao ON cliente.id_profissao = profissao.id;

-- 13. Listar o nome do cliente e sua profissão onde o cliente tenha nascido antes de 1980 (com JOIN)
SELECT cliente.nome, cliente.data_nasc FROM cliente
    JOIN profissao ON cliente.id_profissao = profissao.id
    WHERE cliente.data_nasc < '1980-01-01' ;

-- 14. Exibir o nome do cliente e o cargo daqueles que nasceram após 1985 e que não possuem telefone começando com '5'
SELECT cliente.nome, cliente.tel, profissao.cargo FROM cliente
	JOIN profissao ON cliente.id_profissao = profissao.id
    WHERE cliente.data_nasc > '1985-01-01' 
    AND cliente.tel NOT LIKE '(5%' ;