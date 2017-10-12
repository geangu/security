<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Home</title>
    </head>
    <body>
    	<div class="row">
    		<form class="form">
	    		<h2>Personal Info</h2>
	    		<hr>
	    		<div class="col-sm-2 col-sm-offset-2 ">
	    			<div class="text-center">
	                    <gravatar:image email="${this.user.email}"/>
	                </div>
	            </div>
	    		<div class="col-sm-6">
	    			
						<div class="form-group">
							<label for="fullName">Full Name</label>
							<g:textField name="fullName" value="${user.fullName}" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<g:textField name="email" value="${user.email}" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="phone">Phone</label>
							<g:textField name="phone" value="${user.phone}" class="form-control"/>
						</div>
						<hr>
						<div class="text-center">
							<g:link controller="home" action="save" class="btn btn-primary">Guardar</g:link>
						</div>
    			</div>
    		</form>	
    	</div>
    </body>
</html>