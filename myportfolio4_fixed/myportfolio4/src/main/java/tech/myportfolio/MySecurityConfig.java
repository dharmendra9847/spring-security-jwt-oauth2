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
		http
				.csrf(csrf -> csrf.disable())

				.authorizeHttpRequests(auth -> auth
				.requestMatchers("/css/**", "/js/**", "/img/**", "/resume/**").permitAll()
				.requestMatchers("/client/login", "/client/logout",
						"/client/signup", "/client/register").permitAll()      // ← FIXED
				.requestMatchers("/client/home", "/client/about", "/client/services",
						"/client/contact", "/client/saveContact",
						"/client/downloadResume").permitAll()
				.requestMatchers("/admin/deleteService/**",
						"/admin/deleteContactById/**").hasRole("ADMIN")
				.requestMatchers("/admin/**").hasAnyRole("ADMIN", "MEMBER")
				.anyRequest().authenticated()
				)
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
