package tech.jwtauth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class JwtFilter extends OncePerRequestFilter{
	
	@Autowired
	private JwtTokenGenerator jwtTokenGenerator;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		
		String authHeader = request.getHeader("Authorization");
		
		if(authHeader != null && authHeader.startsWith("Bearer")) {
			
			//TOKEN START WITH "BEARER" : LENGTH-> 7
			String token = authHeader.substring(7);
			
			// TO CKECK EXPIRATION DATA : 1st Findout payload
			if(!jwtTokenGenerator.isExpired(token)) {
				
				//TokenIsAlive
				String username = jwtTokenGenerator.getUsername(token);
				
				List<String> allRoles = jwtTokenGenerator.getAllRoles(token);
				
				ArrayList<SimpleGrantedAuthority> arrayList = new ArrayList<SimpleGrantedAuthority>();
				
				for(String role : allRoles) {
					arrayList.add(new SimpleGrantedAuthority(role));
				}
				
				UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(username, null, arrayList);
				
				SecurityContextHolder.getContext().setAuthentication(auth);
			}
		}
		
		
		
		
		
		filterChain.doFilter(request, response);
		
	}

}
