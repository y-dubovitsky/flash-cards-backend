function logout() {

    var token = $("meta[name='_csrf']").attr("content");
    // var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        url: 'http://localhost:8080/logout', //TODO Можно вынести в отдельный файл или типа того?
        method: 'POST',
        data: {
            _csrf: token
        },
        success: function (data) {
            location.href = "http://localhost:8080/login"
        },
        error: function() {
            console.log("Data didn't get sent!!");
        }
    });
}
