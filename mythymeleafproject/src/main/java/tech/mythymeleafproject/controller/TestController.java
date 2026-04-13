package tech.mythymeleafproject.controller;

import java.util.Arrays;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import tech.mythymeleafproject.dto.UserDTO;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@GetMapping("/home")
	public String homeView() {
		
		return "view/index";
	}
	
	@GetMapping("/page1")
	public String page1View(Model model) {
		
		model.addAttribute("data", "This is my page1.html");
		model.addAttribute("list", Arrays.asList("Raju", "Kaju", "Maju"));
		
		return "view/page1";
	}
	
	@GetMapping("/form")
	public String formView(Model model) {
		
		model.addAttribute("userDTO", new UserDTO());
		return "view/form";
	}
	
	@PostMapping("/form")
	public String formData(@Valid @ModelAttribute UserDTO userDTO, BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			return "view/form";
		}
		
		System.out.println(userDTO);
		return "view/form";
	}

}
