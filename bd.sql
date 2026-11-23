CREATE DATABASE IF NOT EXISTS sistema_musical_v2
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE sistema_musical_v2;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS artistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    pais VARCHAR(50),
    imagem VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS musicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artista_id INT,
    titulo VARCHAR(100) NOT NULL,
    album VARCHAR(100),
    genero VARCHAR(50),
    youtube_link VARCHAR(255),
    letra TEXT,
    imagem_capa VARCHAR(255),
    CONSTRAINT fk_musicas_artistas
        FOREIGN KEY (artista_id) REFERENCES artistas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A senha do usuário admin é 123; somente o hash bcrypt é armazenado.
INSERT INTO usuarios (usuario, senha)
SELECT 'admin', '$2y$12$zw1c2aDgt4HHnAzXc3g3dOV6Mn96Dm2UaSIketIhYe1xmtuaJG6qa'
WHERE NOT EXISTS (
    SELECT 1 FROM usuarios WHERE usuario = 'admin'
);

-- Registros iniciais de demonstração. As imagens podem ser adicionadas pela aplicação.
INSERT INTO artistas (nome, genero, pais, imagem)
SELECT 'Estúdio Pixel', 'Aventura', 'Brasil', ''
WHERE NOT EXISTS (SELECT 1 FROM artistas WHERE nome = 'Estúdio Pixel');

INSERT INTO artistas (nome, genero, pais, imagem)
SELECT 'Arcade Nebula', 'Plataforma', 'Portugal', ''
WHERE NOT EXISTS (SELECT 1 FROM artistas WHERE nome = 'Arcade Nebula');

INSERT INTO musicas (artista_id, titulo, album, genero, youtube_link, letra, imagem_capa)
SELECT a.id, 'A Jornada do Pixel', 'PC', 'Aventura', '', 'Um jogo de demonstração para explorar o catálogo.', ''
FROM artistas a
WHERE a.nome = 'Estúdio Pixel'
  AND NOT EXISTS (
      SELECT 1 FROM musicas m
      WHERE m.artista_id = a.id AND m.titulo = 'A Jornada do Pixel'
  );

INSERT INTO musicas (artista_id, titulo, album, genero, youtube_link, letra, imagem_capa)
SELECT a.id, 'Salto Cósmico', 'Arcade', 'Plataforma', '', 'Um jogo de demonstração para explorar o catálogo.', ''
FROM artistas a
WHERE a.nome = 'Arcade Nebula'
  AND NOT EXISTS (
      SELECT 1 FROM musicas m
      WHERE m.artista_id = a.id AND m.titulo = 'Salto Cósmico'
  );