package tech.springsecurityformbasedcustomize;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class MySecurityConfig {
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		
		http
		.csrf().disable()
		.authorizeRequests()
		.antMatchers("/test/admin").hasRole("ADMIN")
		.antMatchers("/test/member").hasRole("MEMBER")
		.anyRequest().permitAll()
		.and()
		.formLogin()
		.loginPage("/test/mylogin")
		.loginProcessingUrl("/doLogin")
		.usernameParameter("user")
		.passwordParameter("pass")
		
		;
		
		return http.build();
	}
	
	@Bean
	InMemoryUserDetailsManager inMemory() {
		
		UserDetails admin = User.builder()
		.username("amdin")
		.password(passwordEncoder().encode("admin123"))
		.roles("ADMIN")
		.build(); 
		
		UserDetails member = User.builder()
		.username("member")
		.password(passwordEncoder().encode("member123"))
		.roles("MEMBER")
		.build();
		
		return new InMemoryUserDetailsManager(admin, member);
	}
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
