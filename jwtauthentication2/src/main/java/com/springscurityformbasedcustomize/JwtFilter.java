package com.springscurityformbasedcustomize;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class JwtFilter extends OncePerRequestFilter{
	
	@Autowired
	private JwtTokenGenerator jwtTokenGenerator;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		
		String authHeader = request.getHeader("Authorization");
		System.out.println("My AuthHeader is: " + authHeader);
		
		if(authHeader != null && authHeader.startsWith("Bearer")) {
			
			//TOKEN( IS PERSENT here) Than--->>> TOKEN CHECKING HERE......
			String token = authHeader.substring(7);
			
			// IS TOKEN EXPIRED (isTokenExpired)
			if(!jwtTokenGenerator.isExpired(token)) {
				
				//TokenIsAlive
				String username = jwtTokenGenerator.getUsername(token);
				
				List<String> allRoles = jwtTokenGenerator.getAllRoles(token);
				
				ArrayList<SimpleGrantedAuthority> arrayList = new ArrayList<SimpleGrantedAuthority>();
				
				for(String roll : allRoles) {
					arrayList.add(new SimpleGrantedAuthority(roll));
				}
				
				UsernamePasswordAuthenticationToken uPAToken = new UsernamePasswordAuthenticationToken(username, null, arrayList);
				
				SecurityContextHolder.getContext().setAuthentication(uPAToken);
				
			}
			
			
			
		}
				
		filterChain.doFilter(request, response);
		 
	}

}
