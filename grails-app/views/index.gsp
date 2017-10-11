<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Welcome to Grails</h1>

            <sec:ifLoggedIn>

                <p>
                    Welcome Back <sec:loggedInUserInfo field='username'/>
                    <sec:access expression="hasRole('ROLE_ADMIN')">
                    <br>You're a admin
                    </sec:access>
                </p>

                <g:link class="btn btn-sm btn-danger" controller="logout" action="index">Salir</g:link>

                <ul>
                    <li><g:link class="btn btn-sm btn-default" controller="user" action="index">Usuarios</g:link></li>
                </ul>

            </sec:ifLoggedIn>

            <sec:ifNotLoggedIn>
                <g:link class="btn btn-sm btn-primary" controller="login" action="index">Iniciar</g:link>
            </sec:ifNotLoggedIn>

        </section>
    </div>

</body>
</html>
