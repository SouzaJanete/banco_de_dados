
create table endereco (
	cod_end serial primary key,
	logradouro varchar (40) not null,
	tipo_log varchar (40) not null,
	complemento varchar (20) not null,
	cidade varchar (60) not null,
	uf char(2) not null,
	cep char (10) not null,
	numero varchar (10) not null,
	bairro varchar (60) not null
	
)

create table profissao (
	cod_prof serial primary key,
	nome varchar (60) not null
	
)

create table categoria (
	cod_cat serial primary key,
	nome varchar (60) not null,
	valor money
)

create table genero (
	cod_gen serial primary key,
	nome varchar (60) not null
)

create table ator (
	cod_ator serial primary key,
	nome varchar (60) not null
)

create table cliente (
	cod_cli serial primary key,
	cpf varchar (11)not null,
	nome varchar (60)not null,
	telefone varchar (15) not null,
	fk_cod_prof integer not null,
	foreign key (fk_cod_prof) references profissao (cod_prof)

)

create table dependente (
	fk_cod_cli integer not null,
	foreign key (fk_cod_cli) references cliente (cod_cli),
	fk_cod_dep serial primary key,
	foreign key (fk_cod_dep) references cliente (cod_cli),
	parentesco varchar (40) not null
	
)

create table filmes (
	cod_filme serial primary key,
	titulo_original varchar (100) not null,
	titulo varchar (100) not null,
	quantidade int not null,
	fk_cod_cat integer not null,
	foreign key (fk_cod_cat) references categoria (cod_cat),
	fk_cod_gen integer not null,
	foreign key (fk_cod_gen) references genero (cod_gen)
)

create table locacao (
	cod_loc serial primary key,
	data_loc date not null,
	desconto money,
	multa money,
	sub_total money,
	fk_cod_cli integer not null,
	foreign key (fk_cod_cli) references cliente (cod_cli)
)

create table locacao_filme (
	fk_cod_loc integer not null,
	foreign key (fk_cod_loc) references locacao (cod_loc),
	fk_cod_filme integer not null,
	foreign key (fk_cod_filme) references filmes (cod_filme),
	valor money not null,
	num_dias int not null,
	data_devol date not null
)

create table filme_ator (
	fk_cod_ator integer not null,
	foreign key (fk_cod_ator) references ator (cod_ator),
	fk_cod_filme integer not null,
	foreign key (fk_cod_filme) references filmes (cod_filme),
	ator varchar(3) not null,
	diretor varchar (3) not null
)

create table cli_endereco (
	fk_cod_end integer not null,
	foreign key (fk_cod_end) references endereco (cod_end),
	fk_cod_cli integer not null,
	foreign key (fk_cod_cli) references cliente (cod_cli)
)

INSERT INTO categoria (nome, valor) VALUES
    ('Ação', 12.99),
    ('Comédia', 9.99),
    ('Drama', 11.99),
    ('Ficção Científica', 14.99),
    ('Romance', 10.99)

INSERT INTO genero (nome) VALUES
    ('Ação'),
    ('Comédia'),
    ('Drama'),
    ('Ficção Científica'),
    ('Romance')


INSERT INTO filmes (titulo_original, titulo, quantidade, fk_cod_cat, fk_cod_gen) VALUES
    ('Inception', 'A Origem', 5, 4, 4),
    ('The Dark Knight', 'O Cavaleiro das Trevas', 3, 1, 1),
    ('Pulp Fiction', 'Tempo de Violência', 7, 3, 3),
    ('The Shawshank Redemption', 'Um Sonho de Liberdade', 2, 3, 3),
    ('Interstellar', 'Interestelar', 4, 4, 4),
    ('Forrest Gump', 'Forrest Gump - O Contador de Histórias', 6, 2, 2),
    ('Fight Club', 'Clube da Luta', 3, 1, 1),
    ('Titanic', 'Titanic', 5, 5, 5),
    ('The Matrix', 'Matrix', 1, 4, 4),
    ('The Godfather', 'O Poderoso Chefão', 2, 3, 3),
    ('Gladiator', 'Gladiador', 4, 1, 1),
    ('The Lord of the Rings: The Fellowship of the Ring', 'O Senhor dos Anéis: A Sociedade do Anel', 3, 4, 4),
    ('Inglourious Basterds', 'Bastardos Inglórios', 6, 1, 1),
    ('The Green Mile', 'À Espera de Um Milagre', 2, 3, 3),
    ('The Notebook', 'Diário de Uma Paixão', 4, 5, 5)


INSERT INTO profissao (nome) VALUES
    ('Professor'),
    ('Médico'),
    ('Engenheiro'),
    ('Advogado'),
    ('Programador'),
    ('Estudante'),
    ('Arquiteto'),
    ('Autônomo'),
    ('Contador'),
    ('Artista')



INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof) VALUES
    ('12345678901', 'Alice Silva', '(12) 3456-7890', 1),
    ('23456789012', 'Bruno Pereira', '(23) 4567-8901', 2),
    ('34567890123', 'Carla Souza', '(34) 5678-9012', 3),
    ('45678901234', 'Daniel Oliveira', '(45) 6789-0123', 4),
    ('56789012345', 'Eduarda Lima', '(56) 7890-1234', 5),
    ('67890123456', 'Felipe Santos', '(67) 8901-2345', 6),
    ('78901234567', 'Gabriela Rodrigues', '(78) 9012-3456', 7),
    ('89012345678', 'Henrique Almeida', '(89) 0123-4567', 8),
    ('90123456789', 'Isabela Costa', '(90) 1234-5678', 9),
    ('01234567890', 'João Fernandes', '(01) 2345-6789', 10);


INSERT INTO locacao (data_loc, desconto, multa, sub_total, fk_cod_cli) VALUES
    ('2023-01-01', 0, 0, 50.00, 1),
    ('2023-01-02', 5.00, 0, 30.00, 2),
    ('2023-01-03', 0, 10.00, 25.00, 3),
    ('2023-01-04', 0, 0, 45.00, 4),
    ('2023-01-05', 0, 0, 35.00, 5),
    ('2023-01-06', 0, 0, 40.00, 6),
    ('2023-01-07', 0, 15.00, 20.00, 7),
    ('2023-01-08', 0, 0, 55.00, 8),
    ('2023-01-09', 0, 0, 60.00, 9),
    ('2023-01-10', 0, 0, 42.00, 10),
    ('2023-01-11', 0, 0, 48.00, 1),
    ('2023-01-12', 0, 8.00, 36.00, 2),
    ('2023-01-13', 0, 0, 38.00, 3),
    ('2023-01-14', 0, 0, 32.00, 4),
	 ('2023-01-15', 0, 12.00, 28.00, 5),
    ('2023-01-16', 0, 0, 44.00, 6),
    ('2023-01-17', 0, 0, 33.00, 7),
    ('2023-01-18', 0, 0, 39.00, 8),
    ('2023-01-19', 0, 0, 37.00, 9),
    ('2023-01-20', 0, 0, 41.00, 2)


--1
SELECT f.titulo_original AS "Título Original", lf.data_devol AS "Data de Devolução", l.data_loc AS "Data de Locação"
FROM locacao_filme lf
JOIN locacao l ON lf.fk_cod_loc = l.cod_loc
JOIN filmes f ON lf.fk_cod_filme = f.cod_filme
WHERE l.fk_cod_cli = 7;

--2
SELECT c.nome AS "Cliente", d.nome AS "Dependente", dep.parentesco AS "Parentesco"
FROM cliente c
LEFT JOIN dependente dep ON c.cod_cli = dep.fk_cod_cli
LEFT JOIN cliente d ON dep.fk_cod_dep = d.cod_cli;


--3
SELECT f.titulo_original AS "Título Original", g.nome AS "Gênero"
FROM filmes f
JOIN genero g ON f.fk_cod_gen = g.cod_gen
WHERE g.nome = 'Romance';


--4
SELECT c.nome AS "Cliente", p.nome AS "Profissão"
FROM cliente c
JOIN profissao p ON c.fk_cod_prof = p.cod_prof
WHERE p.nome = 'Professor';


--5
SELECT f.titulo_original AS "Título Original", c.nome AS "Categoria", f.quantidade AS "Quantidade Disponível"
FROM filmes f
JOIN categoria c ON f.fk_cod_cat = c.cod_cat
WHERE c.nome = 'Comédia' AND f.quantidade > 5;


--6
SELECT a.nome AS "Nome do Ator"
FROM filme_ator fa
JOIN ator a ON fa.fk_cod_ator = a.cod_ator
JOIN filmes f ON fa.fk_cod_filme = f.cod_filme
WHERE f.titulo_original = 'titanic';


--7
SELECT c.nome, e.logradouro, e.tipo_log, e.complemento, e.cidade, e.uf, e.cep, e.numero, e.bairro
FROM cliente c
JOIN cli_endereco ce ON c.cod_cli = ce.fk_cod_cli
JOIN endereco e ON ce.fk_cod_end = e.cod_end
WHERE c.cod_cli = 9;


--8
SELECT f.titulo, f.titulo_original, g.nome AS genero, c.nome AS categoria
FROM filmes f
JOIN genero g ON f.fk_cod_gen = g.cod_gen
JOIN categoria c ON f.fk_cod_cat = c.cod_cat;


--9
SELECT c.nome, l.data_loc
FROM cliente c
JOIN locacao l ON c.cod_cli = l.fk_cod_cli
JOIN locacao_filme lf ON l.cod_loc = lf.fk_cod_loc
JOIN filmes f ON lf.fk_cod_filme = f.cod_filme
WHERE f.titulo_original = 'Titanic';


--10
SELECT c.nome, l.multa
FROM cliente c
JOIN locacao l ON c.cod_cli = l.fk_cod_cli
WHERE l.multa 19.00; -- substitua 10.00 pelo valor específico


--11
SELECT *
FROM locacao
WHERE data_loc BETWEEN '2024-06-20' AND '2024-06-31'; -- substitua as datas pelo período específico


--12
SELECT c.nome, COUNT(lf.fk_cod_filme) AS total_filmes_alugados
FROM cliente c
JOIN locacao l ON c.cod_cli = l.fk_cod_cli
JOIN locacao_filme lf ON l.cod_loc = lf.fk_cod_loc
GROUP BY c.nome;


--13
SELECT c.nome, f.titulo, l.data_loc
FROM cliente c
JOIN locacao l ON c.cod_cli = l.fk_cod_cli
JOIN locacao_filme lf ON l.cod_loc = lf.fk_cod_loc
JOIN filmes f ON lf.fk_cod_filme = f.cod_filme
ORDER BY l.data_loc;


--14
SELECT DISTINCT c.nome
FROM cliente c
JOIN cli_endereco ce ON c.cod_cli = ce.fk_cod_cli
JOIN endereco e ON ce.fk_cod_end = e.cod_end
JOIN locacao l ON c.cod_cli = l.fk_cod_cli
JOIN locacao_filme lf ON l.cod_loc = lf.fk_cod_loc
JOIN filmes f ON lf.fk_cod_filme = f.cod_filme
JOIN categoria cat ON f.fk_cod_cat = cat.cod_cat
WHERE e.cidade = 'Cocalzinho de Goiás' AND cat.nome = 'Drama';


--15
SELECT a.nome, COUNT(fa.fk_cod_filme) AS numero_de_filmes
FROM ator a
JOIN filme_ator fa ON a.cod_ator = fa.fk_cod_ator
GROUP BY a.nome
HAVING COUNT(fa.fk_cod_filme) >= 5;


--16
SELECT cat.nome AS categoria, gen.nome AS genero, COUNT(lf.fk_cod_filme) AS total_filmes_alugados
FROM locacao_filme lf
JOIN filmes f ON lf.fk_cod_filme = f.cod_filme
JOIN categoria cat ON f.fk_cod_cat = cat.cod_cat
JOIN genero gen ON f.fk_cod_gen = gen.cod_gen
GROUP BY cat.nome, gen.nome
HAVING COUNT(lf.fk_cod_filme) > 50;
