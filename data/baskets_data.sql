/*
 *  Выборка данных для корзины активного юзера
 */
/* Первый вариант
SELECT gallery.id, gallery.name, gallery.price, cart.amount FROM gallery
    INNER JOIN cart ON cart.productid=gallery.id
    WHERE cart.userid=7                  -- 7 - это идентификатор пользователя, соответствующий полю users.id
        ORDER BY gallery.name ASC
*/
SELECT cart.id, cart.productid, gallery.name, gallery.price, cart.amount FROM cart
    INNER JOIN gallery ON cart.productid=gallery.id
    WHERE cart.userid=7                  -- 7-это идентификатор пользователя, соответствующий полю users.id
        ORDER BY cart.id ASC