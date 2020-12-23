/**
 * Delete flashCard by id.
 * @param id - flashCard id.
 */
function deleteCardRequest(id) {
    $.ajax({
        url: 'http://localhost:8080/card', //TODO Можно вынести в отдельный файл или типа того?
        method: 'DELETE',
        data: {
            id: id
        },
        success: function (data) {
            console.log(data);
            $("#flash_cards").empty();
            $("#flash_cards").append(data); //TODO Можно не все удалять и добавлять, а только кусок
        },
        error: function () {
            console.log("Data didn't get sent!!");
        }
    });
}

function addCardTextInputRequest(front, back) {

    $.ajax({
        url: 'http://localhost:8080/card/text',
        method: 'POST',
        data: {
            front: front,
            back: back
        },
        success: function (data) {
            console.log(data);
            $("#flash_cards").empty();
            $("#flash_cards").append(data);
        },
        error: function () {
            console.log("Data didn't get sent!!");
        }
    });
}

/**
 * Close modal after create new task
 */
$(document).ready(function(){
    // Close modal on button click
    $(".btn").click(function(){
        $("#exampleModal").modal('hide');
    });
});

/**
 * Just for fun
 */
function aliveFunc() {
    alert("Its alive!");
}
