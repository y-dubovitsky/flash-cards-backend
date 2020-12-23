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
                            <form
                                    action="javascript:addCardTextInputRequest(
                                            $('input[name=front]').val(),
                                            $('input[name=back]').val()
                                    );"
                                    method="post"
                                    enctype="multipart/form-data"
                            >
                                <div class="modal-body">
                                    <input type="file" name="file">
                                    <input type="text" name="front" placeholder="front side">
                                    <input type="text" name="back" placeholder="back side">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="createBtn" type="submit" class="btn btn-success">Create</button>
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

        <div id="flash_cards">
            <#include "parts/flash-cards.ftl">
        </div>

        <#------------------------------------------ Flash Card ------------------------------------------>

    </div>

    <#------------------------------------------ Page Content ------------------------------------------>

</div>

<script src="/static/js/jquery-3.5.1.min.js"></script>
<script src="/static/js/popper.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/main.js"></script>
<script src="/static/js/cards.js"></script>

</body>
</html>
