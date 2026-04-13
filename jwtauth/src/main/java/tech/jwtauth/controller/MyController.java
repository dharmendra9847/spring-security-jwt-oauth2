package tech.jwtauth.controller;

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


import tech.jwtauth.JwtTokenGenerator;
import tech.jwtauth.payload.UserDto;

@RestController
@RequestMapping("/restapi")
public class MyController {
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private JwtTokenGenerator jwtTokenGenerator;
	
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@GetMapping("/member")
	public String member() {
		return "member";
	}
	
	@PostMapping("/login")
	public String login(@RequestBody UserDto userDto) {
		
	   Authentication auth = new UsernamePasswordAuthenticationToken(userDto.getUsername(), 
			   userDto.getPassword());
	   
	   Authentication authenticate = authenticationManager.authenticate(auth);
	   
	   UserDetails userDetails = (UserDetails) authenticate.getPrincipal();
	   
	   String token = jwtTokenGenerator.generateToken(userDetails);
		return token;
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
}
