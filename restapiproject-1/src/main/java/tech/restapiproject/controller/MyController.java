package tech.restapiproject.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import tech.restapiproject.pojo.User;
import tech.restapiproject.services.MyService;

@RestController
@RequestMapping("/test")
public class MyController {
	
	@Autowired
	private MyService myService;
	
	@GetMapping("/sales1")
//	@ResponseBody
	public Map<Integer, Integer> readSales1(){
		
		return myService.readSales();
	}
	
	@GetMapping("/sales2")
//	@ResponseBody
	public String readSales2(){
		
		return "Hello";
	}
	
	
	@GetMapping("/sales3")
	@CrossOrigin(origins = "*")
//	@ResponseBody
	public List<User> readSales3(){
		
		User user1 = new User(11, "Raju", "raju2025@gmail.com");
		User user2 = new User(12, "Kaju", "kaju2026@gmail.com");
		User user3 = new User(13, "Maju", "maju2027@gmail.com");
		
		return Arrays.asList(user1, user2, user3);
	}
}
