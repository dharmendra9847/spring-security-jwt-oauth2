package tech.jwtauth;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class MySecurityConfig {
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    
	    http
	        // 1. Authorization Rules
	        .authorizeHttpRequests(auth -> auth
	            .requestMatchers("/restapi/admin").hasRole("ADMIN")
	            .requestMatchers("/restapi/member").hasRole("MEMBER")
	            .anyRequest().permitAll()            
	        )
	        .sessionManagement(session -> session
	        		.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
	        )
    		;
	        
	        // 2. Form Login Configuration
	        /*.formLogin(form -> form
	            .loginPage("/restapi/login")            // Custom login page URL
	            .loginProcessingUrl("/doLogin")         // The POST URL to submit credentials
	            .defaultSuccessUrl("/home", true)       // Where to go after successful login
	            .permitAll()
	        )*/
	        
	        // 3. Logout Configuration
				/*
				 * .logout(logout -> logout .logoutUrl("/doLogout") // Trigger URL for logout
				 * .logoutSuccessUrl("/restapi/login?logout") // Redirect after logout
				 * .invalidateHttpSession(true) // Kill the session .clearAuthentication(true)
				 * // Clear security context .deleteCookies("JSESSIONID") // Clean up cookies
				 * .permitAll() )
				 */

	        // 4. Handling Unauthorized Access
	        /*.exceptionHandling(ex -> ex
	            .accessDeniedPage("/restapi/access-denied") // URL for 403 Forbidden errors
	        );*/

	    return http.build();
	}
	
	@Bean
	AuthenticationManager authenticationManager(AuthenticationConfiguration ac) throws Exception {
		return ac.getAuthenticationManager();
	}
	
	@Bean
	BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
