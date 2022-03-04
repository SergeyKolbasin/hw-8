<?php
require_once '../config/config.php';
// Если юзер вошел в систему
if (!empty($_SESSION['login'])) {
    $id = $_SESSION['login']['id'];
    $sql = "SELECT cart.id, cart.productid, gallery.name, gallery.url, gallery.price, cart.amount FROM cart
                INNER JOIN gallery ON cart.productid=gallery.id
                WHERE cart.userid=$id";                  // это идентификатор пользователя, соответствующий полю users.id
    $basket = getAssocResult($sql);
}else{
    header('location: login.php');
}
mainMenu();
$smarty = new Smarty();
$smarty->assign('basket', $basket);
$smarty->display(SMARTY_TPL_DIR . 'basketProduct.tpl');
