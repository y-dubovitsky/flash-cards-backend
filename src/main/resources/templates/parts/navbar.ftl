<#macro navbar>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
                <i class="fa fa-bars"></i>
                <span class="sr-only">Toggle Menu</span>
            </button>

            <#--            Button -->
            <#nested>

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
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li>
<#--                        <form class="nav-item" id="logout" method="post" action="/logout">-->
<#--                            <input type="hidden" name="_csrf" value="{{_csrf.token}}"/>-->
<#--                            <input class="nav-link nav-item" type="submit" value="Logout"/>-->
<#--                        </form>-->
                        <a onclick="logout()" class="nav-link">Logout</a>

                    </li>
                </ul>
            </div>
        </div>
        <script src="js/logout.js"></script>
    </nav>
</#macro>
