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
                location.reload();          // перезагружаем страницу
            } else {
                $message_field.text(data);  // сообщение об ошибке
            }
        }
    });

}