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
            // без json
            if (data === 'OK') {
                //window.location.href = '/editUser.php?id=';
                //alert('123');
                alert("$.cookie(id)");
                //window.location.href = '/index.php';            // переход на главную страницу
            } else {
                $message_field.text(data);  // сообщение об ошибке
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
