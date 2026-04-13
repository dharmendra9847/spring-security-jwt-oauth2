package com.springscurityformbasedcustomize;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.SecretKey;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtTokenGenerator {
	
	private static final String finalKey = "u524HHl7XGNcGbfXqWqki9S4tHnRXR/XrZD1QtlnKffOGzjuC63mcjju4AIUFgg4EuQa81k5jA+LSFRmZKU13w==";
	
	public String generateToken(UserDetails userDetails) {
		
		ArrayList<String> roles = new ArrayList<>();
		
		for(GrantedAuthority grantedAuthority : userDetails.getAuthorities()) {
			roles.add(grantedAuthority.getAuthority());
		}
		
		Map<String, Object> claims = new HashMap<>();
		claims.put("roles", roles);
		
		String token = Jwts.builder()
		.claims(claims)
		.subject(userDetails.getUsername())
		.issuedAt(new Date(System.currentTimeMillis()))
		.expiration(new Date(System.currentTimeMillis() + 5*60*60*1000))
		.signWith(generateKey(), Jwts.SIG.HS512)
		.compact();
		
		
		return token;
	}
	
	public SecretKey generateKey() {
		
		//String KEY -->512 bit
		SecretKey secretKey = Keys.hmacShaKeyFor(finalKey.getBytes());
		return secretKey;
	}
}
