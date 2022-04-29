<?php
/*
 * Выход из системы
 */
require_once '../config/config.php';
// echo 'До свидания, ' . $_SESSION['login']['login'];
$_SESSION['login'] = [];                             // очишаем массив login, тем самым разлогиниваем юзера
unset($_COOKIE['id']);                               // удаляем кукис с id юзера
setcookie('id', null, -1, '/');

if (isset($_SESSION['originalURL'])) {
    header('location: ' . $_SESSION['originalURL']); // возврат на прежнее место сайта
}else{
    header('location: "index.php"');                 // возврат на стартовую страницу
}
