<?php
/*
 * =============================================
 * ARQUIVO: index.php
 * FUNÇÃO: Menu principal do sistema
 * =============================================
 *
 * Primeira página após o login.
 * valida_sessao.php garante que apenas usuários
 * logados chegam até aqui.
 */
include('valida_sessao.php');
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal — Arcade Dev</title>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%27http://www.w3.org/2000/svg%27 viewBox=%270 0 100 100%27><text y=%27.9em%27 font-size=%2790%27>🕹️</text></svg>">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">

    <!-- Botão de sair alinhado à direita -->
    <div class="topbar">
        <a href="logout.php" class="btn-back">🚪 Game Over</a>
    </div>

    <!-- Cabeçalho de boas-vindas -->
    <div class="page-header">
        <h1>🎮 Arcade Dev</h1>
        <!--
            $_SESSION['usuario'] contém o nome salvo no login.
            htmlspecialchars() protege contra XSS na exibição.
        -->
        <p>Player 1: <strong><?php echo htmlspecialchars($_SESSION['usuario']); ?></strong>! Escolha sua fase!</p>
    </div>

    <!-- Grade de cards do menu -->
    <div class="menu-grid">

        <div class="menu-card">
            <a href="cadastro_artista.php">
                <div class="menu-card-icon">👾</div>
                <div class="menu-card-title">Gerenciar Desenvolvedoras</div>
                <div class="menu-card-desc">Cadastre e edite estúdios de jogos</div>
            </a>
        </div>

        <div class="menu-card">
            <a href="cadastro_jogo.php">
                <div class="menu-card-icon">🎮</div>
                <div class="menu-card-title">Cadastrar Jogos</div>
                <div class="menu-card-desc">Adicione jogos ao sistema</div>
            </a>
        </div>

        <div class="menu-card">
            <a href="listagem_musicas.php">
                <div class="menu-card-icon">🏆</div>
                <div class="menu-card-title">Biblioteca de Jogos</div>
                <div class="menu-card-desc">Visualize e filtre todos os jogos</div>
            </a>
        </div>

    </div>

</div>
</body>
</html>