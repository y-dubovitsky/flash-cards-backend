/**
 * Удаляет задачу по id
 * @param taskId
 */
function deleteTaskRequest(id) {

    var token = $("meta[name='_csrf']").attr("content");
    // var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        url: 'http://localhost:8080/task', //TODO Можно вынести в отдельный файл или типа того?
        method: 'DELETE',
        data: {
            id: id,
            _csrf: token
        },
        success: function (data) {
            console.log(data);
            alert("Ta-da");
            // $("#flash_cards").empty();
            // $("#flash_cards").append(data); //TODO Можно не все удалять и добавлять, а только кусок
        },
        error: function() {
            console.log("Data didn't get sent!!");
        }
    });
}