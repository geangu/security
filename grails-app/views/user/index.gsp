<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="pull-right">
            <g:link class="btn btn-default" action="create"><span class="icon-plus"></span> <g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1><span class="icon-users"></span> <g:message code="default.list.label" args="[entityName]" /></h1>
            <hr>
            <g:if test="${flash.message}">
                <div class="alert alert-dismissible alert-info">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    ${flash.message}
                </div>
            </g:if>
            <table style="width: 100%" class="display">
                <thead>
                    <tr>
                        <td>Username</td>
                        <td>Full Name</td>
                        <td>Email</td>
                        <td>Phone</td>
                        <td>Actions</td>
                    </tr>
                </thead>
                <g:each var="user" in="${userList}">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.fullName}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td><g:link class="btn btn-sm btn-info" action="show" id="${user.id}"><span class="icon-eye"></span> Ver</g:link></td>
                    </tr>
                </g:each>
            </table>
        </div>
    </body>
</html>