package tech.myportfolio;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class MySecurityConfig {

	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.csrf(csrf -> csrf.disable()).authorizeHttpRequests(auth -> auth
				// 1. Permitted static resources and registration
				.requestMatchers("/client/signup", "/client/register", "/client/login").permitAll()

				// 2. Specific Admin/Member Protections (Must come BEFORE anyRequest)
				.requestMatchers("/admin/deleteService/**", "/admin/deleteContactById/**").hasRole("ADMIN")
				.requestMatchers("/admin/**").hasAnyRole("ADMIN", "MEMBER")

				// 3. Catch-all: Everything else requires authentication
				// Note: I removed the second .anyRequest().permitAll() as it contradicts this.
				.anyRequest().authenticated())
				.formLogin(form -> form
						.loginPage("/client/login")
						.loginProcessingUrl("/doLogin")
						.usernameParameter("user")
						.passwordParameter("pass")
						.defaultSuccessUrl("/client/home", true) // Recommended:
																														// redirect
																														// after
																														// login
						.permitAll())
				.logout(logout -> logout
						.logoutUrl("/doLogout")
						.logoutSuccessUrl("/client/login?logout") // Redirect
																											// back to
																											// login
						.permitAll())
				.exceptionHandling(ex -> ex.accessDeniedPage("/client/unauthorized"));

		return http.build();
	}

	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
