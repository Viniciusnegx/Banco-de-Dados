-- 1. Liste o nome de todos os autores cadastrados e a sua nacionalidade, listados por ordem
-- alfabética.

-- select nome, descricao
--   from autor, nacionalidade
--  where autor.idnacionalidade = nacionalidade.idnacionalidade
--  order by nome, descricao

-- 2. Liste o título, ano de publicação, quantidade em estoque, nome do gênero e o nome da
-- editora para cada livro cadastrado.

-- SELECT titulo, ano, estoque, genero.descricao, editora.nome
--   from livro, genero, editora
--  where livro.idgenero = genero.idgenero
--    and livro.ideditora = editora.ideditora


-- 3. Apresente o total da quantidade vendida de livros ao cliente “Fabricio Antunes”.

-- select sum(quantidade) as total_vendida
--   from cliente, venda, itemvenda
--  where cliente.idcliente = venda.idcliente
--    and venda.idvenda = itemvenda.idvenda
--    and cliente.nome = 'Fabricio Antunes'


-- 4. Liste o título dos livros, o nome do gênero e o nome da editora apenas dos livros que foram
-- adquiridos pelo cliente “Fabricio Antunes”, bem como a data de aquisição de cada um dos
-- livros.

-- SELECT titulo, descricao, editora.nome, dtvenda
--   from livro, genero, editora, cliente, venda, itemvenda
--  where livro.ideditora = editora.ideditora
--    and livro.idgenero = genero.idgenero
--    and livro.idlivro = itemvenda.idlivro
--    and itemvenda.idvenda = venda.idvenda
--    and venda.idcliente = cliente.idcliente
--    and cliente.nome = 'Fabricio Antunes'


-- 5. Listar todos as nacionalidades cadastradas e apresentar o nome dos autores que
-- correspondem a essas nacionalidades.

-- SELECT nacionalidade.descricao, autor.nome
--   from nacionalidade, autor
--  where nacionalidade.idnacionalidade = autor.idnacionalidade


-- 6. Selecionar todas as nacionalidades cadastradas, apresentar o nome de todos os autores
-- cadastrados e o nome de todos título dos livros cadastrados.

-- SELECT nacionalidade.descricao, autor.nome, livro.titulo
--   from nacionalidade 
--   left join autor 
-- 	on nacionalidade.idnacionalidade = autor.idnacionalidade
--   left join livroautor
-- 	on autor.idautor = livroautor.idautor
--   left join livro
-- 	on livro.idlivro = livroautor.idlivro


-- 7. Apresente o nome de todos os clientes cadastrados e caso tenham realizado alguma uma
-- compra na livraria, a data em que isso ocorreu.

-- select cliente.nome, dtvenda
--   from cliente
--   left join venda
--     on cliente.idcliente = venda.idcliente


-- 8. Apresente a soma total de livros publicados por cada editora cadastrada.

-- SELECT editora.nome, sum(1) as total_livros
--   from editora, livro
--  where editora.ideditora = livro.ideditora
--  group by editora.nome


-- 9. Questão livre: construa uma consulta em SQL diferente das solicitadas nos itens anteriores
-- escrevendo o enunciado e os comandos em SQL necessários para que ela seja executada
-- com sucesso.
-- A atividade a ser desenvolvida compreende as três etapas definidas e descritas a seguir:
-- Liste o titulo e genero de livros que não foram comprados.

SELECT livro.titulo, genero.descricao
  from livro
 inner join genero
	on livro.idgenero = genero.idgenero
  left join itemvenda 
    on itemvenda.idlivro = livro.idlivro
 where itemvenda.idlivro is null