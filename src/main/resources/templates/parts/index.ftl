<#macro page title style js>
    <!doctype html>
    <html lang="en">
        <head>
            <title>${title}</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href="/static/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="/static/js/jquery-3.5.1.min.js"></script>

            <link rel="stylesheet" href="${style}">
        </head>
        <body>
            <div class="wrapper d-flex align-items-stretch">
                <#nested>
            </div>
            <script src="/static/js/popper.js"></script>
            <script src="/static/js/bootstrap.min.js"></script>
            <script src="/static/js/main.js"></script>
            <script src="${js}"></script>
        </body>
    </html>
</#macro>