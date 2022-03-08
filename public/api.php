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
/*
        if (isset($_SESSION['login'])) {
            header('location: editUser.php?id=' . $user['id']);   // перенаправим юзера в его личный кабинет
            //header('location: ' . $_SESSION['originalURL']);    // возврат на прежнее место сайта
        }else{
            header('location: index.php');                      // возврат на стартовую страницу
        }
*/
        success();
    } else {
        error('неверная пара логин/пароль');
    }
}

// Обработка добавления в корзину
if($_GET['apiMethod'] === 'insertToCart') {
    $id = $_GET['postData']['id'] ?? 0;
    if(!$id) {
        error('ID не передан');
    }
    //Получаем данные корзины
    $cart = $_COOKIE['cart'] ?? [];
    //если в корзине товара еще нет, то получаем 0
    $count = $cart[$id] ?? 0;
    //увеличиваем количество в корзине
    $count++;

    //устанавливаем новое куки
    setcookie("cart[$id]", $count);

    success();
}
