package com.springscurityformbasedcustomize;

import java.util.Base64;

import javax.crypto.SecretKey;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import io.jsonwebtoken.Jwts;

@SpringBootTest
class Springscurityformbasedcustomize1ApplicationTests {

	@Test
	void contextLoads() {
	}
	
//	@Test
//	void keyTest() {
//		
//		SecretKey secretKey = Jwts.SIG.HS512.key().build();	//A TYPE OF STAMP
//		String encodeFinalKey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
//		System.out.println("****************** "+ encodeFinalKey + " ********************");
//	}

}
