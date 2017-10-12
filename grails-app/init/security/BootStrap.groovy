package security

import com.example.security.Role
import com.example.security.User
import com.example.security.UserRole

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role()
		adminRole.authority = "ROLE_ADMIN"
		adminRole.save(flush:true, failOnError:true)

		def agentRole = new Role()
		agentRole.authority = "ROLE_AGENT"
		agentRole.save(flush:true, failOnError:true)

		def userRole = new Role()
		userRole.authority = "ROLE_USER"
		userRole.save(flush:true, failOnError:true)

		def adminUser = new User()

		adminUser.username = "admin"
		adminUser.password = "admin"
		adminUser.fullName = "Gerardo Andres Gutierrez Rodriguez"
		adminUser.email = "geangu@gmail.com"
		adminUser.phone = "3121234567"

		def agentUser = new User()

		agentUser.username = "agent"
		agentUser.password = "agent"
		agentUser.fullName = "agent"
		agentUser.email = "agent@example.com"
		agentUser.phone = "3121234568"

		adminUser.save(flush:true, failOnError:true)
		agentUser.save(flush:true, failOnError:true)

		UserRole.create(adminUser, adminRole, true)
		UserRole.create(agentUser, agentRole, true)
    }
    def destroy = {
    }
}
