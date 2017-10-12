package com.example.security

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured


@Secured("ROLE_ADMIN")
class UserController {

    UserService userService
    def exportService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY']) 
    def register(){
        def userRole = Role.findByAuthority("ROLE_USER")
        def user = new User(params)
        user.save(flush:true)
        if(user.id != null){
            UserRole.create(user, userRole, true)
            message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
        }
        render view:'register', model: [user: user]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def updateInfo(){
        def user = User.get(params.id)
        user.fullName = params.fullName
        user.phone = params.phone
        user.save(flush:true)
        flash.message = "Usuario actualizado"
        redirect controller:'home', action:'index'
    }

    @Secured(["ROLE_ADMIN", "ROLE_AGENT"])
    def index(Integer max) {
        params.max = Math.min(max ?: 1000, 100000)

        if(params?.f && params.f != "html"){
            if(f.equals('xls')) {
                response.contentType = "application/vnd.ms-excel"
            } else if(f.equals('csv')) {
                response.contentType = "application/vnd.ms-excel"
            } else {
                response.contentType = "application/octet-stream"
            }
            response.setHeader("Content-disposition", "attachment; filename=users.${params.extension}")
            exportService.export(params.f, response.outputStream,userService.list(params), [:], [:])
        } else {

        }

        respond userService.list(params), model:[userCount: userService.count()]
    }

    @Secured(["ROLE_ADMIN", "ROLE_AGENT"])
    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        
        def user = User.get(id)
        UserRole.removeAll(user)

        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
