package tech.jwtauth;

import java.util.Base64;

import javax.crypto.SecretKey;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import io.jsonwebtoken.Jwts;

@SpringBootTest
class JwtauthApplicationTests {

	@Test
	void contextLoads() {
	}

//	@Test
//	void generateSecretKey() {
//		
//		SecretKey secretKey = Jwts.SIG.HS512.key().build();
//		String finalSecretKey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
//		System.out.println("********** " + finalSecretKey + " **********");
//	}
}
