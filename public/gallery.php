<?php
require_once '../config/config.php';
$_SESSION['originalURL'] = $_SERVER['REQUEST_URI']; // сохранения для возврата на эту же страницу

// Отображение меню
mainMenu();
// Отображение галереи
echo render(TEMPLATES_DIR . 'gallery.tpl',[
        'title'     => 'Фото-зоопарк',
        'head'      => 'Фото-зоопарк',
        //'content'   => renderGallery($htmlGallery, 5)
        'content'   => renderGallery(getImages('SELECT * FROM gallery ORDER BY `views` DESC'), COLUMNS)
]);