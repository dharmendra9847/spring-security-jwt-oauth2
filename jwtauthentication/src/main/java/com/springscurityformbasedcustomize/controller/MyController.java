package com.springscurityformbasedcustomize.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springscurityformbasedcustomize.JwtTokenGenerator;
import com.springscurityformbasedcustomize.payload.JwtAuthRequest;

@RestController
@RequestMapping("/api")
public class MyController {
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private JwtTokenGenerator jwtTokenGenerator;
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@GetMapping("/member")
	public String member() {
		return "member";
	}
	
	@PostMapping("/login") 	//USE TO TOKEN GENERATION
	public String login(@RequestBody JwtAuthRequest jwtAuthRequest) {
		
		//UsernamePasswordAuthenticationToken is child of Authentication
		Authentication auth= new UsernamePasswordAuthenticationToken(jwtAuthRequest.getUsername(), 
				jwtAuthRequest.getPassword());
		
		//AuthenticationManager
		Authentication authenticate = authenticationManager.authenticate(auth); //->loadUserByUsername
		UserDetails userDetails = (UserDetails) authenticate.getPrincipal();
		
		//GENERATE MY TOKEN
		String token = jwtTokenGenerator.generateToken(userDetails);
		
		return token;
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
}
