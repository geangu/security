<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="pull-right">
            <g:link class="btn btn-default" action="index"><span class="icon-users"></span> <g:message code="default.list.label" args="[entityName]" /></g:link>
        </div>
        <div id="create-user" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <hr>
            <g:if test="${flash.message}">
                <div class="alert alert-dismissible alert-info">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    ${flash.message}
                </div>
            </g:if>
            <g:hasErrors bean="${this.user}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.user}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form resource="${this.user}" method="POST" class="form">
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
                <div class="form-group">
                    <label>Password *</label>
                    <g:passwordField name="password" value="${this.user.password}" required="true" class="form-control"/>
                </div>
                <hr>
                <div class="text-center">
                    <g:link class="btn btn-default" action="index"><span class="icon-cross"></span> <g:message code="default.button.cancel.label" /></g:link>
                    <button type="submit" class="btn btn-info"><span class="icon-checkmark"></span> <g:message code="default.button.create.label" /></button>
                </div>
            </g:form>
        </div>
    </body>
</html>
