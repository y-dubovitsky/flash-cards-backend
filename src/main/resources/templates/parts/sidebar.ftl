<#import "../security/security.ftl" as security>

<nav id="sidebar" class="active">
    <h1><a href="#" class="logo">${security.name}.</a></h1>
    <ul class="list-unstyled components mb-5">
        <li class="active">
            <a href="/home"><span class="fa fa-home"></span> Home</a>
        </li>
        <li>
            <a href="/card"><span class="fa fa-sticky-note"></span> Card</a>
        </li>
        <li>
            <a href="/task"><span class="fa fa-check"></span> Task</a>
        </li>
        <li>
            <a href="/settings"><span class="fa fa-cogs"></span> Settings</a>
        </li>
        <li>
            <a href="/contacts"><span class="fa fa-paper-plane"></span> Contacts</a>
        </li>
        <li>
            <a href="/about"><span class="fa fa-user"></span> About</a>
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
