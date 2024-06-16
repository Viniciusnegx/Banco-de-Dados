-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS mydb ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS mydb
  WITH
      OWNER = postgres
      ENCODING = 'UTF8'
      LC_COLLATE = 'Portuguese_Brazil.1252'
      LC_CTYPE = 'Portuguese_Brazil.1252'
      LOCALE_PROVIDER = 'libc'
      TABLESPACE = pg_default
      CONNECTION LIMIT = -1
      IS_TEMPLATE = False;

-- -----------------------------------------------------
-- Table editora
-- -----------------------------------------------------
DROP TABLE IF EXISTS editora CASCADE;

CREATE TABLE IF NOT EXISTS editora (
  ideditora INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (ideditora))
;


-- -----------------------------------------------------
-- Table genero
-- -----------------------------------------------------
DROP TABLE IF EXISTS genero CASCADE;

CREATE TABLE IF NOT EXISTS genero (
  idgenero INT NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (idgenero))
;


-- -----------------------------------------------------
-- Table livro
-- -----------------------------------------------------
DROP TABLE IF EXISTS livro CASCADE;

CREATE TABLE IF NOT EXISTS livro (
  idlivro INT NOT NULL,
  titulo VARCHAR(255) NOT NULL,
  ano INT NOT NULL,
  estoque INT NOT NULL,
  ideditora INT NOT NULL,
  idgenero INT NOT NULL,
  PRIMARY KEY (idlivro),
  CONSTRAINT fk_livro_editora
    FOREIGN KEY (ideditora)
    REFERENCES editora (ideditora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_livro_genero1
    FOREIGN KEY (idgenero)
    REFERENCES genero (idgenero)4
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table nacionalidade
-- -----------------------------------------------------
DROP TABLE IF EXISTS nacionalidade CASCADE;

CREATE TABLE IF NOT EXISTS nacionalidade (
  idnacionalidade INT NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  pais VARCHAR(25) NOT NULL,
  PRIMARY KEY (idnacionalidade))
;


-- -----------------------------------------------------
-- Table autor
-- -----------------------------------------------------
DROP TABLE IF EXISTS autor CASCADE;

CREATE TABLE IF NOT EXISTS autor (
  idautor INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  idnacionalidade INT NOT NULL,
  PRIMARY KEY (idautor),
  CONSTRAINT fk_autor_nacionalidade1
    FOREIGN KEY (idnacionalidade)
    REFERENCES nacionalidade (idnacionalidade)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table livroautor
-- -----------------------------------------------------
DROP TABLE IF EXISTS livroautor CASCADE;

CREATE TABLE IF NOT EXISTS livroautor (
  idlivro INT NOT NULL,
  idautor INT NOT NULL,
  PRIMARY KEY (idlivro, idautor),
  CONSTRAINT fk_livro_has_autor_livro1
    FOREIGN KEY (idlivro)
    REFERENCES livro (idlivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_livro_has_autor_autor1
    FOREIGN KEY (idautor)
    REFERENCES autor (idautor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table fornecedor
-- -----------------------------------------------------
DROP TABLE IF EXISTS fornecedor CASCADE;

CREATE TABLE IF NOT EXISTS fornecedor (
  idfornecedor INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  endereço VARCHAR(255) NOT NULL,
  PRIMARY KEY (idfornecedor))
;


-- -----------------------------------------------------
-- Table compra
-- -----------------------------------------------------
DROP TABLE IF EXISTS compra CASCADE;

CREATE TABLE IF NOT EXISTS compra (
  idcompra INT NOT NULL,
  dtcompra DATE NOT NULL,
  idfornecedor INT NOT NULL,
  PRIMARY KEY (idcompra),
  CONSTRAINT fk_compra_fornecedor1
    FOREIGN KEY (idfornecedor)
    REFERENCES fornecedor (idfornecedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table itemcompra
-- -----------------------------------------------------
DROP TABLE IF EXISTS itemcompra CASCADE;

CREATE TABLE IF NOT EXISTS itemcompra (
  iditemcompra INT NOT NULL,
  idlivro INT NOT NULL,
  idcompra INT NOT NULL,
  quantidade INT NOT NULL,
  valorunitario DECIMAL(14,2) NOT NULL,
  valortotal DECIMAL(14,2) NOT NULL,
  PRIMARY KEY (iditemcompra),
  CONSTRAINT fk_livro_has_compra_livro1
    FOREIGN KEY (idlivro)
    REFERENCES livro (idlivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_livro_has_compra_compra1
    FOREIGN KEY (idcompra)
    REFERENCES compra (idcompra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
DROP TABLE IF EXISTS cliente CASCADE;

CREATE TABLE IF NOT EXISTS cliente (
  idcliente INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  telefone VARCHAR(25) NOT NULL,
  PRIMARY KEY (idcliente))
;


-- -----------------------------------------------------
-- Table venda
-- -----------------------------------------------------
DROP TABLE IF EXISTS venda CASCADE;

CREATE TABLE IF NOT EXISTS venda (
  idvenda INT NOT NULL,
  dtvenda DATE NOT NULL,
  idcliente INT NOT NULL,
  PRIMARY KEY (idvenda),
  CONSTRAINT fk_venda_cliente1
    FOREIGN KEY (idcliente)
    REFERENCES cliente (idcliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table itemvenda
-- -----------------------------------------------------
DROP TABLE IF EXISTS itemvenda CASCADE;

CREATE TABLE IF NOT EXISTS itemvenda (
  iditemvenda INT NOT NULL,
  idvenda INT NOT NULL,
  idlivro INT NOT NULL,
  quantidade INT NOT NULL,
  valorunitario DECIMAL(14,2) NOT NULL,
  valortotal DECIMAL(14,2) NOT NULL,
  PRIMARY KEY (iditemvenda),
  CONSTRAINT fk_venda_has_livro_venda1
    FOREIGN KEY (idvenda)
    REFERENCES venda (idvenda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_venda_has_livro_livro1
    FOREIGN KEY (idlivro)
    REFERENCES livro (idlivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
