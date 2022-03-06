<?php

require_once '../config/config.php';
// Вывод сообщения об  ошибке
function error($error_text)
{
    // без json
    echo "Ошибка: $error_text";
    exit();
}
// Успешный ответ
function success($data = true)
{
    // без json
    echo 'OK';
    exit();
}


// Проверка передачи api-метода
if (empty($_POST['apiMethod'])) {
    error('не передан apiMethod');
}

// Обработка логина
if ($_POST['apiMethod'] === 'login') {
    // Получение логина с паролем
    $login = $_POST['postData']['login'] ?? '';
    $password = $_POST['postData']['password'] ?? '';
    // Проверка того, что значения логина и пароля не пусты
    if (!$login || !$password) {
        error('логин или пароль не переданы');
    }
    // Создадим запрос и получим пользователя из БД, если он есть
    $sql = "SELECT * FROM `users` WHERE `login` = '$login'";
    $user = getSingle($sql);
    // Если существует такая пара логин/пароль, запишем в сессию, если нет - ошибка
    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['login'] = $user;
        success();
    } else {
        error('неверная пара логин/пароль');
    }
}
