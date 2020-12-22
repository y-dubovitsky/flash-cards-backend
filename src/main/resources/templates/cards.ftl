<!doctype html>
<html lang="en">
<head>
    <title>FlashCard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar" class="active">
        <h1><a href="#" class="logo">M.</a></h1>
        <ul class="list-unstyled components mb-5">
            <li class="active">
                <a href="#"><span class="fa fa-home"></span> Home</a>
            </li>
            <li>
                <a href="#"><span class="fa fa-user"></span> About</a>
            </li>
            <li>
                <a href="#"><span class="fa fa-sticky-note"></span> Cards</a>
            </li>
            <li>
                <a href="#"><span class="fa fa-cogs"></span> Settings</a>
            </li>
            <li>
                <a href="#"><span class="fa fa-paper-plane"></span> Contacts</a>
            </li>
        </ul>

        <div class="footer">
            <p>
                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                All rights reserved | This application is made with <i class="icon-heart"></i> by <a
                        href="#" target="_blank">Dubovitsky.space</a>
            </p>
        </div>
    </nav>

    <#------------------------------------------ Page Content ------------------------------------------>

    <div id="content" class="p-4 p-md-5">

        <#------------------------------------------ Navbar ------------------------------------------>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-primary">
                    <i class="fa fa-bars"></i>
                    <span class="sr-only">Toggle Menu</span>
                </button>

                <#------------------------------------------ Add Card Start ------------------------------------------>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary fa fa-plus ml-2" data-toggle="modal"
                        data-target="#exampleModal">
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Create new card</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="/card/add" method="post" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <input type="file" name="file">
                                    <input type="text" name="front" placeholder="front side">
                                    <input type="text" name="back" placeholder="back side">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-success">Create</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <#------------------------------------------ Add Card End ------------------------------------------>

                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Portfolio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <#------------------------------------------ Navbar ------------------------------------------>

        <#------------------------------------------ Flash Card ------------------------------------------>

        <#list cards as card>
            <div class="card text-center mt-2 mb-2">
                <div class="card-header">
                    <ul class="nav nav-pills card-header-pills">
                        <li class="nav-item">
                            <a class="nav-link fa fa-check-square-o" href="#"></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fa fa-pencil-square-o" href="#" tabindex="-1" aria-disabled="true"></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fa fa-question-circle" href="#" tabindex="-1" aria-disabled="true"></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fa fa-trash-o" tabindex="-1" aria-disabled="true"></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fa fa-star" aria-hidden="true" href="#" tabindex="-1"
                               aria-disabled="true"></a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <h2 class="card-title m-5">${card.front}</h2>
                    <#--                Prompt-->
                    <div class="collapse" id="collapseExample">
                        <div class="card card-body">
                            <#if card.prompt??>
                                <p class="card-text">${card.prompt}</p>
                            <#else>
                                <p class="card-text">Ooops, no prompt</p>
                            </#if>
                        </div>
                    </div>
                    <#--                Prompt-->
                    <button type="button" class="btn btn-success">Know</button>
                    <button type="button" class="btn btn-danger">Unknown</button>
                </div>
            </div>
        </#list>

        <#------------------------------------------ Flash Card ------------------------------------------>

        <#------------------------------------------ Pagination ------------------------------------------>

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>

        <#------------------------------------------ Pagination ------------------------------------------>


    </div>

    <#------------------------------------------ Page Content ------------------------------------------>

</div>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/popper.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/main.js"></script>
<script>
    var myModal = document.getElementById('myModal');
    var myInput = document.getElementById('myInput');

    myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus()
    })
</script>
</body>
</html>
