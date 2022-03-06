<?php
/*
 * Вход в систему
 */
require_once '../config/config.php';
?>

<html lang="ru">
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Вход в систему</title>
</head>
<body>
<h3>Вход в систему</h3>
<hr>
<div class="message"></div>     <!-- место для сообщения об ошибке -->
<div>
        <p><label>Пользователь:  <input type="text" name="login"></label></p>
        <p><label>Пароль: <input type="password" name="password"></label></p>
        <button onclick="login()">Войти</button>
        <br><br>
</div>
<a href="gallery.php"><< В зоопарк</a><br>
<a href="index.php">На главную</a>
<br><br>

<script src="js/jquery-3.6.0.js"></script>
<script src="js/main.js"></script>
</body>
</html>
