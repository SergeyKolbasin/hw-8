/*
 *  Выборка данных для корзины активного юзера
 */
/* Первый вариант
SELECT gallery.id, gallery.name, gallery.price, basket.amount FROM gallery
    INNER JOIN basket ON basket.productid=gallery.id
    WHERE basket.userid=7                  -- 7 - это идентификатор пользователя, соответствующий полю users.id
        ORDER BY gallery.name ASC
*/
SELECT basket.id, basket.productid, gallery.name, gallery.price, basket.amount FROM basket
    INNER JOIN gallery ON basket.productid=gallery.id
    WHERE basket.userid=7                  -- 7-это идентификатор пользователя, соответствующий полю users.id
        ORDER BY basket.id ASC