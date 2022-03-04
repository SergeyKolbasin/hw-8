<?php
/*
 * Файл для тестирования функций
 */
require_once '../config/config.php';

$sql = "SELECT * FROM `cart` WHERE `userid`=1 AND `productid`=6";
$q = getSingle($sql);
//$newID = getSingle($sql);
//var_dump((int)$newID['auto_increment']);
echo 'test';
var_dump($q);
