// Функция авторизации с ajax
function login() {
    const   $login = $('[name="login"]');
    const   $password = $('[password="password"]');
    const   login = $login.val();
    const   password = $password.val();

    console.log(login, password);

    $.post({
        url:    'api.php'
    });

    return;
}