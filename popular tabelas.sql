INSERT INTO editora (ideditora, nome) VALUES
(1, 'Editora A'),
(2, 'Editora B'),
(3, 'Editora C');



INSERT INTO genero (idgenero, descricao) VALUES
(1, 'Ficção'),
(2, 'Não-Ficção'),
(3, 'Fantasia'),
(4, 'Biografia');



INSERT INTO nacionalidade (idnacionalidade, descricao, pais) VALUES
(1, 'Brasileira', 'Brasil'),
(2, 'Americana', 'EUA'),
(3, 'Britânica', 'Reino Unido')
(4, 'Jamaicano', 'Jamaica');



INSERT INTO autor (idautor, nome, endereco, idnacionalidade) VALUES
(1, 'Autor A', 'Rua 1, Cidade A', 1),
(2, 'Autor B', 'Rua 2, Cidade B', 2),
(3, 'Autor C', 'Rua 3, Cidade C', 3),
(4, 'J. K. Rowling', 'Rua 123, Cidade A', 3);



INSERT INTO livro (idlivro, titulo, ano, estoque, ideditora, idgenero) VALUES
(1, 'Livro 1', 2020, 10, 1, 1),
(2, 'Livro 2', 2019, 5, 2, 2),
(3, 'Livro 3', 2021, 7, 3, 3);
(4, 'Livro 4', 2023, 7, 1, 3);



INSERT INTO livroautor (idlivro, idautor) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2); -- Exemplo de um livro com mais de um autor



INSERT INTO fornecedor (idfornecedor, nome, endereço) VALUES
(1, 'Fornecedor A', 'Avenida 1, Cidade X'),
(2, 'Fornecedor B', 'Avenida 2, Cidade Y'),
(3, 'Fornecedor C', 'Avenida 3, Cidade Z');



INSERT INTO compra (idcompra, dtcompra, idfornecedor) VALUES
(1, '2024-01-01', 1),
(2, '2024-02-15', 2),
(3, '2024-03-10', 3);



INSERT INTO itemcompra (iditemcompra, idlivro, idcompra, quantidade, valorunitario, valortotal) VALUES
(1, 1, 1, 10, 50.00, 500.00),
(2, 2, 2, 5, 60.00, 300.00),
(3, 3, 3, 7, 70.00, 490.00);



INSERT INTO cliente (idcliente, nome, endereco, telefone) VALUES
(1, 'Fabricio Antunes', 'Rua A, Cidade A', '123456789'),
(2, 'Cliente B', 'Rua B, Cidade B', '987654321'),
(3, 'Cliente C', 'Rua C, Cidade C', '123123123');
(4, 'Cliente D', 'Rua D, Cidade D', '456456456');



INSERT INTO venda (idvenda, dtvenda, idcliente) VALUES
(1, '2024-04-01', 1),
(2, '2024-05-15', 2),
(3, '2024-06-10', 3),
(4, '2024-06-10', 1);



INSERT INTO itemvenda (iditemvenda, idvenda, idlivro, quantidade, valorunitario, valortotal) VALUES
(1, 1, 1, 1, 50.00, 50.00),
(2, 2, 2, 2, 60.00, 120.00),
(3, 3, 3, 3, 70.00, 210.00),
(4, 4, 1, 2, 50.00, 100.00);
(5, 4, 2, 2, 60.00, 120.00);