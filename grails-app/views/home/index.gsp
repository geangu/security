<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Home</title>
    </head>
    <body>
    	<div class="row">
    		<g:form class="form" method="post" controller="user" action="updateInfo" id="${user.id}">
	    		<h2>Personal Info</h2>
	    		<hr>
	    		<div class="col-sm-2 col-sm-offset-2 ">
	    			<div class="text-center">
	                    <gravatar:image email="${this.user.email}"/>
	                </div>
	            </div>
	    		<div class="col-sm-6">
	    				<g:if test="${flash.message}">
			                <div class="alert alert-dismissible alert-info">
			                    <button type="button" class="close" data-dismiss="alert">&times;</button>
			                    ${flash.message}
			                </div>
			            </g:if>
						<div class="form-group">
							<label for="fullName">Full Name</label>
							<g:textField name="fullName" value="${user.fullName}" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<g:textField name="email" value="${user.email}" class="form-control" readonly="true"/>
						</div>
						<div class="form-group">
							<label for="phone">Phone</label>
							<g:textField name="phone" value="${user.phone}" class="form-control"/>
						</div>
						<hr>
						<div class="text-center">
							<button type="submit" class="btn btn-info">Guardar</button>
						</div>
    			</div>
    		</g:form>	
    	</div>
    </body>
</html>