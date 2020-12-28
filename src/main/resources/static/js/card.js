/**
 * Delete flashCard by id.
 * @param id - flashCard id.
 */
function deleteCardRequest(id) { //TODO Нужно реализовать отправку _csrf токена!

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
        error: function() {
            console.log("Data didn't get sent!!");
        }
    });
}

function addCardTextInputRequest(front, back, _csrf) {

    $.ajax({
        url: 'http://localhost:8080/card/text',
        method: 'POST',
        data: {
            front: front,
            back: back,
            _csrf: _csrf
        },
        success: function (data) {
            console.log(data);
            $("#flash_cards").empty();
            $("#flash_cards").append(data);
        },
        error: function() {
            console.log("Data didn't get sent!!");
        }
    });
}

/**
 * Edit Card
 * @param id
 */
//TODO Нужно разобраться как посылать и обрабатывать formData или как посылать json
function editCardRequest(id) {
    const form = document.forms.namedItem('editCardForm' + id);
    const formData = new FormData(form);

    let front = formData.get("front");
    let back = formData.get("back");
    let _csrf = formData.get("_csrf");

    // Display the key/value pairs
    // for (const pair of formData.entries()) {
    //     console.log(pair[0]+ ', ' + pair[1]);
    // }

    $.ajax({
        url: 'http://localhost:8080/card/edit',
        method: 'POST',
        // data: formData,
        data: {
            id: id,
            front: front,
            back: back,
            _csrf: _csrf
        },
        success: function(data) {
            console.log(data);
            document.getElementById("front" + id).innerHTML = data.front;
            document.getElementById("back" + id).innerHTML = data.back;
        },
        error: function() {
            console.log('Bad edit response');
        }
    });
}

/**
 * Turn flash card without http response
 * @param id
 * @param current
 */
function turnCard(id, current) {
    current.style.display = 'none';
    document.getElementById(id).style.display = 'block';
}

/**
 * Close modal after create new task
 */
$(document).ready(function() {
    // Close modal on button click
    $('.btn').click(function(){
        $("*[id*='CardModal']:visible").modal('hide'); //TODO Доработать, чтобы диалоговок окно пропадало после редактиования
    });
});

/**
 * Just for fun
 */
function aliveFunc() {
    alert("Its alive!");
}

/**
 * Tooltip //TODO Не работает после ajax запроса
 */
// после загрузки страницы
$(function(){
    // инициализации подсказок для всех элементов на странице, имеющих атрибут data-toggle="tooltip"
    $('[data-toggle="tooltip"]').tooltip();
});
