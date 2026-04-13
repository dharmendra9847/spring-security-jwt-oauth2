package tech.jwtauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class JwtSecurityConfig {
	
	@Autowired
	private JwtFilter jwtFilter;
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		
		http
		.csrf(csrf -> csrf.disable())
//		.csrf(csrf -> csrf
//	            .ignoringRequestMatchers("/api/login") // ✅ allow login without CSRF
//	        )
		.authorizeHttpRequests(auth -> auth
		.requestMatchers("/admin").hasRole("ADMIN")
		.requestMatchers("/member").hasRole("MEMBER")
		.anyRequest()
		.permitAll()
		)
		.sessionManagement(session -> session
		.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
		);
		
		http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);
				
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
