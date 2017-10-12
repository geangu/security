<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Menu</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/"><span class="icon-shield"></span> Security</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <sec:ifLoggedIn>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/home"><span class="icon-home"></span> Home</a></li>
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_AGENT">
                            <li><g:link controller="user" action="index"><span class="icon-users"></span> Administrar Usuarios</g:link></li>
                        </sec:ifAnyGranted>
                        <li>
                            <g:link controller="logout" action="index"><span class="icon-exit"></span> Salir</g:link>
                        </li>
                    </ul>
                </sec:ifLoggedIn>
            </div>

        </div>
    </nav>

    <div class="container">
        <g:layoutBody/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
