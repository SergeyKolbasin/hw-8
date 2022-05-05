// Функция получения значения куки по ее имени
function getCookie(name) {
    var matches = document.cookie.match(new RegExp("(?:^|; )" +
        name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"));
    return matches ? decodeURIComponent(matches[1]) : undefined;
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
            //console.log(data);
            // контроль удачной/неудачной аутентификации
            if (data === 'OK') {
                userID = getCookie('user');
                window.location.href = '/editUser.php?id=' + userID;
            } else {
                $message_field.text(data);  // сообщение об ошибке
                //window.location.href = '/index.php';            // переход на главную страницу
            }
        }
    });

}
// Функция добавления в корзину
function insertToBasket(id) {
    //Инициализируем поле для сообщений
    const $message_field = $('.message');

    $.post({
        url: '/api.php',
        data: {
            apiMethod: 'insertToBasket',
            postData: {
                id: id
            }
        },
        success: function (data) {
            console.log(data);
            if(data === 'OK') {
                //$message_field.text('Товар добавлен в корзину');
                alert("Товар добавлен в корзину");
            } else {
                //$message_field.text(data);
                alert(data);
            }
        }
    })
}
