package com.springscurityformbasedcustomize;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class MySecurityConfig {
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
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
		.and()
		.logout()
		.logoutUrl("doLogout")
		.logoutSuccessUrl("/test/logout")
		.and()
		.exceptionHandling()
		.accessDeniedPage("/test/unauthorized")
		;
		
		return http.build();
	}
		
	@Bean
	BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
