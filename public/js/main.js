// Функция авторизации с ajax
function login() {
    //Получаем значение login и password
    const $login_input = $('[name="login"]');
    const $password_input = $('[name="password"]');
    const login = $login_input.val();
    const password = $password_input.val();
    console.log(login, password);

    $.post({
        url: '/api.php',
        data: {
            apiMethod: 'login',
            postData: {
                login: login,
                password: password
            }
        }
    });

}