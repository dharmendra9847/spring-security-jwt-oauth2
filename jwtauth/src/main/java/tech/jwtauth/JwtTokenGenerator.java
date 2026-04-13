package tech.jwtauth;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.SecretKey;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtTokenGenerator {
	
	private static final String finalKey = "1F08U5mBOGhlThc9kNiFycapYNlSxT8xaoR3b/4KEUBqHg0UqHdCx5IPmel+SXtVTuE7lcEINbCW5yC9f0GaVg==";
	
	public String generateToken(UserDetails userDetails) {
		
		ArrayList<String> roles = new ArrayList<>();
		
		for(GrantedAuthority grantedAuthority : userDetails.getAuthorities()) {
			roles.add(grantedAuthority.getAuthority());
		}
		
		Map<String, Object> claims = new HashMap<>();
		
		// If you are on JJWT 0.12.x+
		String token = Jwts.builder()
			.addClaims(claims)
	        .setSubject(userDetails.getUsername())
		    .setIssuedAt(new Date(System.currentTimeMillis()))
		    .setExpiration(new Date(System.currentTimeMillis() + 5 * 60 * 60 * 1000))
		    .signWith(generatedKey(), SignatureAlgorithm.HS512) 
		    .compact();
		
		return token;
	}
	
	public SecretKey generatedKey() {
		
		SecretKey finalSecretKey = Keys.hmacShaKeyFor(finalKey.getBytes());
		return finalSecretKey;
	}

}
