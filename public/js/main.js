// Функция получения значения куки по ее имени
function readCookie(name) {
    var name_cookie = name+"=";
    var spl = document.cookie.split(";");
    for(var i=0; i<spl.length; i++) {
        var c = spl[i];
        while(c.charAt(0) == " ") {
            c = c.substring(1, c.length);
        }
        if(c.indexOf(name_cookie) == 0) {
            return c.substring(name_cookie.length, c.length);
        }
    }
    return null;
}

// Функция авторизации с ajax
function login() {
    //Получаем значение login и password
    const $login_input = $('[name="login"]');
    const $password_input = $('[name="password"]');
    const login = $login_input.val();
    const password = $password_input.val();

    // инициализируем поле для сообщений
    const $message_field = $('.message');

    $.post({
        url: '/api.php',                // вызываемый url
        data: {                         // данные, передаваемые в PHP
            apiMethod: 'login',
            postData: {
                login: login,
                password: password
            }
        },
        success: function (data) {
            console.log(data);
            // контроль удачной/неудачной аутентификации
            if (data === 'OK') {
                window.location.href = '/editUser.php?id=' + readCookie('id');
            } else {
                $message_field.text(data);  // сообщение об ошибке
                //window.location.href = '/index.php';            // переход на главную страницу
            }
        }
    });

}

// Функция добавления в корзину
function insertToCart(id) {
    //Инициализируем поле для сообщений
    const $message_field = $('.message');

    $.get({
        url: '/api.php',
        data: {
            apiMethod: 'insertToCart',
            getData: {
                id: id
            }
        },
        success: function (data) {
            if(data === 'OK') {
                $message_field.text('Товар добавлен в корзину');
            } else {
                $message_field.text(data);
            }
            setTimeout(function () {
                $message_field.text('');
            }, 1000);
        }
    })
}
