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

	    http.csrf(csrf -> csrf.disable());

	    http.authorizeHttpRequests(auth -> auth
	            .requestMatchers("/css/**", "/js/**", "/img/**", "/resume/**").permitAll()

	            .requestMatchers("/client/login", "/client/signup", "/client/register").permitAll()

	            .requestMatchers("/client/home", "/client/about", "/client/services", "/client/contact").permitAll()

	            // ✅ FIXED
	            .requestMatchers("/admin/**").hasRole("ADMIN")

	            .anyRequest().authenticated()
	    );

	    http.formLogin(form -> form
	            .loginPage("/client/login")
	            .loginProcessingUrl("/doLogin")
	            .usernameParameter("user")
	            .passwordParameter("pass")
	            .defaultSuccessUrl("/client/home", true)
	            .permitAll()
	    );

	    http.logout(logout -> logout
	            .logoutUrl("/logout")
	            .logoutSuccessUrl("/client/login?logout")
	    );

	    return http.build();
	}

	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
