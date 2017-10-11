package security

import com.example.security.Role
import com.example.security.User
import com.example.security.UserRole

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role()
		adminRole.authority = "ROLE_ADMIN"
		adminRole.save(flush:true, failOnError:true)

		def adminUser = new User()

		adminUser.username = "admin"
		adminUser.password = "admin"
		adminUser.fullName = "administrator"
		adminUser.email = "admin@example.com"
		adminUser.phone = "3121234567"

		adminUser.save(flush:true, failOnError:true)

		UserRole.create(adminUser, adminRole, true)
    }
    def destroy = {
    }
}
