DROP DATABASE IF EXISTS employify;
CREATE DATABASE IF NOT EXISTS employify;
USE employify;


-- ENTRADA

-- Tabela principal para os usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('Aluno', 'Instrutor') NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela alunos
CREATE TABLE IF NOT EXISTS alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
	progresso TINYINT UNSIGNED CHECK (progresso BETWEEN 0 AND 100),
    cursos VARCHAR(100),
    semestre INT,
    FOREIGN KEY (id_aluno) REFERENCES usuarios(id_usuario)
);

-- Tabela instrutores
CREATE TABLE IF NOT EXISTS instrutores (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
	nome_usuario VARCHAR(100) NOT NULL,
    formacao VARCHAR(100),
    cursos_oferecidos VARCHAR(100),
	progresso TINYINT UNSIGNED CHECK (progresso BETWEEN 0 AND 100),
    anos_experiencia INT,
    FOREIGN KEY (id_instrutor) REFERENCES usuarios(id_usuario)
);


-- PROCESSAMENTO

-- Tabela avaliação
CREATE TABLE IF NOT EXISTS avaliacao (
	id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    nota DECIMAL(3, 1),
    id_usuario INT,
	id_curso INT,
    comentario varchar(2000),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario), 
	FOREIGN KEY (id_curso) REFERENCES curso(id_curso)  
);

-- Tabela curso
CREATE TABLE IF NOT EXISTS curso (
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    id_instrutor INT,
    titulo VARCHAR(100),
    descricao VARCHAR(2000),
    tema VARCHAR(100),
	FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

-- Tabela perfil
CREATE TABLE IF NOT EXISTS perfil (
	id_usuario INT PRIMARY KEY,
    historico_cursos VARCHAR(100),
	progresso TINYINT UNSIGNED CHECK (progresso BETWEEN 0 AND 100),
    certificados VARCHAR(100),
    avaliacoes VARCHAR(100)
);