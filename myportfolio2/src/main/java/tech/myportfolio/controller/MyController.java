package tech.myportfolio.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import tech.myportfolio.contactdto.ContactDTO;
import tech.myportfolio.services.ContactService;
import tech.myportfolio.services.ServicesService;

@Controller
@RequestMapping("/client")
public class MyController {
	
	@Autowired
	private ContactService contactService;
	
	@Autowired
	private ServicesService servicesService;
	
	@GetMapping("/home")
	public String home() {
		
		return "index";
	}
	
	
	@GetMapping("/about")
	public String about() {
		
		return "about";
	}
	
	
	@GetMapping("/contact")
	public String contact() {
		
		return "contact";
	}
	
	
	@GetMapping("/services")
	public String services( Model model) {
		model.addAttribute("listOfServices", servicesService.reaServices());
		return "services";
	}
	
		
	@PostMapping("/saveContact")
	public String saveContact(@Valid @ModelAttribute ContactDTO contactDTO, BindingResult bindingResult, 
			Model model, RedirectAttributes redirectAttributes) {
		
//		if(bindingResult.hasErrors()) {
//			List<FieldError> fieldErrors = bindingResult.getFieldErrors(); 
//			for(FieldError error: fieldErrors) {
//				
//				String field = error.getField();
//				if(field.equals("name")) {
//					String defaultMessage = error.getDefaultMessage();
//					System.out.println("NAME FIELD CONTAINS: " + defaultMessage);
//				}
//			}
//		}
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("result", "Invalid Input!");
			model.addAttribute("errors", bindingResult.getFieldErrors());
			return "contact"; 
		}
		
		if(contactService.isContactEmailExist(contactDTO.getEmail())) {
			redirectAttributes.addFlashAttribute("result", "You have already sent!");
			return "redirect:/client/contact";
		}
		 
		contactService.saveContact(contactDTO);
		redirectAttributes.addFlashAttribute("result", "Your Data Submitted Successfully!");
		return "redirect:/client/contact";
	}
	
	@GetMapping("/downloadResume")
	public void downloadResume(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//RealPath
		String realPath = request.getServletContext().getRealPath("/resume/");
		Path path = Paths.get(realPath, "MyResume.pdf");
		
		//file type
		response.setContentType("applictaion/pdf");
		
		//for download
		response.setHeader("Content-Disposition", "attachment; filename=Dharmendra_CV.pdf");
		
		//for pick-up to download
		ServletOutputStream outputStream = response.getOutputStream();
		
		//with the of outputStream you can download your resume
		Files.copy(path, outputStream);
		
		outputStream.flush();
		
	}

}
