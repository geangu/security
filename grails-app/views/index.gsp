<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>

    <div class="row">
        <div class="col-sm-12">
            
            <div class="jumbotron">
                <h1><span class="icon-shield"></span> Welcome to Security App</h1>
                <hr>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquet porta metus, non aliquet quam commodo quis. Duis pretium egestas ullamcorper. Suspendisse ac nunc ac mauris vehicula venenatis eget eu dolor. 
                </p>
                <hr>
                <p class="text-center">
                    <sec:ifLoggedIn>
                        <g:link controller="home" class="btn btn-success btn-lg"><span class="icon-home"></span> Home</g:link>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <a class="btn btn-default btn-lg" data-toggle="modal" data-target="#sign-up"><span class="icon-user-tie"></span> Sign Up</a>
                        <a class="btn btn-success btn-lg" data-toggle="modal" data-target="#sign-in"><span class="icon-enter"></span> Sign In</a>
                    </sec:ifNotLoggedIn>
                </p>
            </div>
            <div class="modal fade" id="sign-up" tabindex="-1" role="dialog" aria-labelledby="sign-up-label">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <g:form method="POST" class="form" controller="user" action="register">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="sign-up-label"><span class="icon-user-tie"></span> Sign Up</h4>
                            </div>
                            <div class="modal-body">
                            
                                <div class="form-group">
                                    <label>Full Name *</label>
                                    <g:textField name="fullName" required="true" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Email *</label>
                                    <g:textField name="email" required="true" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <g:textField name="phone" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Username *</label>
                                    <g:textField name="username" required="true" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Password *</label>
                                    <g:passwordField name="password" required="true" class="form-control"/>
                                </div>
                                <hr>
                            </div>
                            <div class="modal-footer">
                                <a class="pull-left btn btn-default"><span class="icon-facebook"></span> Registrarse con facebook </a>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="icon-cross"></span> Close</button>
                                <button type="submit" class="btn btn-primary"><span class="icon-user-tie"></span> Register</button>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="sign-in" tabindex="-1" role="dialog" aria-labelledby="sign-un-label">
                <div class="modal-dialog" role="document">
                    <div >
                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="modal-content" autocomplete="off">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="sign-un-label"><span class="icon-enter"></span> Sign In</h4>
                        </div>
                        <div class="modal-body">

                            
                                <div class="form-group">
                                    <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                                    <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username"/>
                                </div>

                                <div class="form-group">
                                    <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                                    <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
                                </div>

                                <p id="remember_me_holder">
                                    <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                                    <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                                </p>                           


                        </div>
                        <div class="modal-footer">
                            <a class="pull-left btn btn-default"><span class="icon-facebook"></span> Iniciar con facebook </a>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><span class="icon-cross"></span> Close</button>
                            <button type="submit" class="btn btn-primary"><span class="icon-enter"></span> <g:message code='springSecurity.login.button'/></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



</body>
</html>
