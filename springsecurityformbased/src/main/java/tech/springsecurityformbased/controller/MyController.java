package tech.springsecurityformbased.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class MyController {
	
	@GetMapping("/index")
	public String index() {
		
		return "index";
	}
	
	@GetMapping("/home")
	public String home() {
		
		return "home";
	}
}
