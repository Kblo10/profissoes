    -- Criar o banco de dados se não existir
CREATE DATABASE IF NOT EXISTS profissoes;

-- Usar o banco de dados criado
USE profissoes;

-- Criar a tabela profissao
CREATE TABLE IF NOT EXISTS profissao (
    id INT NOT NULL AUTO_INCREMENT, 
    cargo VARCHAR(45) NOT NULL, 
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

-- Criar a tabela cliente
CREATE TABLE IF NOT EXISTS cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE, 
    tel VARCHAR(16) NOT NULL,
    id_profissao INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_profissao) REFERENCES profissao (id)
);

ALTER TABLE cliente 
	ADD COLUMN data_nasc DATE ;
    
SELECT * FROM profissao ;

INSERT INTO profissao (cargo, descricao)
	 VALUES ('Sem profissão','Desempregado');

INSERT INTO profissao (cargo, descricao) 
	VALUES  ('Desenvolvedor de Software', 'Responsável por criar, testar e manter sistemas e aplicativos.'),
			('Analista de Dados', 'Especialista em coletar, organizar e analisar grandes volumes de dados.'),
			('Engenheiro de Redes', 'Projeta e mantém a infraestrutura de redes para comunicação de dados.'),
			('Administrador de Banco de Dados', 'Gerencia a segurança, integridade e disponibilidade dos dados.'),
			('Especialista em Segurança da Informação', 'Protege os sistemas e dados contra ameaças e vulnerabilidades.');
            
SELECT * FROM cliente ;

INSERT INTO cliente (nome, cpf, tel, id_profissao, data_nasc) VALUES
('João Silva', '12345678901', '(11) 91234-5678', 1, '1985-04-23'),
('Maria Oliveira', '23456789012', '(21) 92345-6789', 2, '1990-07-15'),
('Carlos Pereira', '34567890123', '(31) 93456-7890', 3, '1982-11-30'),
('Ana Costa', '45678901234', '(41) 94567-8901', 4, '1978-02-25'),
('José Santos', '56789012345', '(51) 95678-9012', 5, '1989-06-10'),
('Luísa Almeida', '67890123456', '(61) 96789-0123', 6, '1995-08-05'),
('Pedro Ferreira', '78901234567', '(71) 97890-1234', 1, '1983-12-17'),
('Carla Mendes', '89012345678', '(81) 98901-2345', 2, '1991-03-22'),
('Rafael Rodrigues', '90123456789', '(91) 99012-3456', 3, '1984-09-09'),
('Beatriz Lima', '01234567890', '(11) 90123-4567', 4, '1980-10-14'),
('Felipe Souza', '09876543210', '(21) 89012-3456', 5, '1987-01-11'),
('Sofia Martins', '87654321098', '(31) 78901-2345', 6, '1993-05-19'),
('Lucas Nascimento', '76543210987', '(41) 67890-1234', 1, '1986-11-23'),
('Mariana Duarte', '65432109876', '(51) 56789-0123', 2, '1992-04-07'),
('Guilherme Azevedo', '54321098765', '(61) 45678-9012', 3, '1988-12-01'),
('Fernanda Ramos', '43210987654', '(71) 34567-8901', 4, '1981-07-16'),
('Thiago Barbosa', '32109876543', '(81) 23456-7890', 5, '1984-02-28'),
('Isabela Cardoso', '21098765432', '(91) 12345-6789', 6, '1996-09-13'),
('Ricardo Teixeira', '10987654321', '(11) 01234-5678', 1, '1985-03-26'),
('Camila Brito', '09876543219', '(21) 90123-4567', 2, '1990-08-14');


UPDATE cliente
	SET data_nasc = '1983-10-25'
	WHERE id = 1;
