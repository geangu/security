package com.example.security

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_AGENT", "ROLE_USER"])
class HomeController {

	def springSecurityService

    def index() { 
    	def principal = springSecurityService.principal
    	def user = User.get(principal.id)
    	render view: 'index', model: [user: user]
    }
}
