<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="pull-right">
            <g:link class="btn btn-default" action="index"><span class="icon-users"></span> <g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link class="btn btn-default" action="create"><span class="icon-plus"></span> <g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><span class="icon-user-tie"></span> <g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="alert alert-dismissible alert-info">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    ${flash.message}
                </div>
            </g:if>
            <g:form resource="${this.user}" method="DELETE" class="form">
                <div class="text-center">
                    <gravatar:image email="${this.user.email}"/>
                </div>
                <div class="form-group">
                    <label>Full Name *</label>
                    <g:textField name="fullName" value="${this.user.fullName}" required="true" class="form-control" readonly="true"/>
                </div>
                <div class="form-group">
                    <label>Email *</label>
                    <g:textField name="email" value="${this.user.email}" required="true" class="form-control" readonly="true"/>
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <g:textField name="phone" value="${this.user.phone}" required="true" class="form-control" readonly="true"/>
                </div>
                <div class="form-group">
                    <label>Username *</label>
                    <g:textField name="username" value="${this.user.username}" required="true" class="form-control" readonly="true"/>
                </div>
                <div class="checkbox">
                    <table style="width: 100%">
                        <tr>
                            <td><label> <g:checkBox disabled="true" name="passwordExpired" value="${this.user.passwordExpired}" /> Password Expired </label></td>
                            <td><label> <g:checkBox disabled="true" name="accountLocked" value="${this.user.accountLocked}" /> Account Locked </label></td>
                            <td><label> <g:checkBox disabled="true" name="accountExpired" value="${this.user.accountExpired}" /> Acount Expired </label></td>
                            <td><label> <g:checkBox disabled="true" name="enabled" value="${this.user.enabled}" /> Enabled </label></td>
                        </tr>
                    </table>
                </div>
                <hr>
                <div class="text-center">
                    <g:link class="btn btn-default" action="index"><span class="icon-cross"></span> <g:message code="default.button.cancel.label" /></g:link>
                    <g:link action="edit" class="btn btn-info" resource="${this.user}"><span class="icon-pencil"></span> <g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input type="submit" class="btn btn-danger" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </div>
            </g:form>
        </div>
    </body>
</html>
