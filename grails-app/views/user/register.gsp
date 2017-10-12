<meta name="layout" content="main" />

<h1>Registro de Usuario</h1>
<hr>
<g:if test="${user.id != null}">
    
    <div class="alert alert-info">
        Usuario registrado con exito.
    </div>

</g:if>

<g:hasErrors bean="${this.user}">
    <ul class="errors" role="alert">
        <g:eachError bean="${this.user}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:form resource="${this.user}" method="POST" controller="user" action="register">
    
    <div class="form-group">
        <label>Full Name *</label>
        <g:textField name="fullName" value="${this.user.fullName}" required="true" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Email *</label>
        <g:textField name="email" value="${this.user.email}" required="true" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Phone</label>
        <g:textField name="phone" value="${this.user.phone}" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Username *</label>
        <g:textField name="username" value="${this.user.username}" required="true" class="form-control"/>
    </div>
    <g:if test="${user.id == null}">
        <div class="form-group">
            <label>Password *</label>
            <g:passwordField name="password" value="${this.user.password}" required="true" class="form-control"/>
        </div>
    
        <div class="text-right">
            <a class="pull-left btn btn-default"><span class="icon-facebook"></span> Registrarse con facebook </a>
            <a href="/" class="btn btn-default"><span class="icon-home"></span> Volver</a>
            <button type="submit" class="btn btn-primary"><span class="icon-user-tie"></span> Register</button>
        </div>
    </g:if>
    <g:else>
        <div class="text-center">
            <g:link controller="login" class="btn btn-success btn-lg"><span class="icon-enter"></span> Ingresar</g:link>
        </div>
    </g:else>
</g:form>