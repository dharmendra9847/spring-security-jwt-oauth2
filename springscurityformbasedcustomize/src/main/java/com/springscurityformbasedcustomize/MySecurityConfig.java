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
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/test/admin").hasRole("ADMIN")
                .antMatchers("/test/member").hasRole("MEMBER")
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/test/login")
                .loginProcessingUrl("/doLogin")
                .usernameParameter("email")
                .passwordParameter("pass")
                .and()
                .logout()
                .logoutUrl("/doLogout")
                .logoutSuccessUrl("/test/logout")
                .permitAll()
                .and()
                .exceptionHandling()
                .accessDeniedPage("/test/unauthorized")
        ;
        return http.build();
    }

    @Bean
    InMemoryUserDetailsManager inMemory() {

        // Create a standard member user
        UserDetails member = User.builder()
                .username("member123@gmail.com")
                .password(bCryptPasswordEncoder().encode("member123"))
                .roles("MEMBER")
                .build();

        // Create an admin user
        UserDetails admin = User.builder()
                .username("admin123@gmail.com")
                .password(bCryptPasswordEncoder().encode("admin123"))
                .roles("ADMIN", "MEMBER") // Admins can access member areas too
                .build();

        return new InMemoryUserDetailsManager(member, admin);
    }

    @Bean
    BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
