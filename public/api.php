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
        setcookie('id', $user['id'], time()+3600);
        success();
    } else {
        error('неверная пара логин/пароль');
    }
}

// Обработка добавления в корзину
if($_POST['apiMethod'] === 'insertToBasket') {
    var_dump($_POST);
    $id = $_POST['postData']['id'] ?? 0;
    if(!$id) {
        error('ID не передан');
    }
    //Получаем данные корзины
    $basket = $_COOKIE['basket'] ?? [];
    //если в корзине товара еще нет, то получаем 0
    $count = $basket[$id] ?? 0;
    //увеличиваем количество в корзине
    $count++;

    //устанавливаем новое куки
    setcookie("basket[$id]", $count);

    success();
}
