package tech.myportfolio.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import tech.myportfolio.contactdto.ServiceDTO;
import tech.myportfolio.entities.ServiceEntity;
import tech.myportfolio.services.ContactService;
import tech.myportfolio.services.ServicesService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ContactService contactService;
	
	@Autowired
	private ServicesService servicesService;
	
	@GetMapping("/home")
	public String home() {
		
		return "admin/adminHome";
	}
	
	@GetMapping("/readAllContacts")
	public String readAllContacts(Model model) {
				
		model.addAttribute("contactData", contactService.readAllContacts());
		
		return "admin/readAllContacts";
	}
	
	@GetMapping("/deleteContactById")
	public String deleteContactById(@RequestParam int id) {
			
		contactService.deleteContactById(id);
		return "redirect:/admin/readAllContacts";
	}
	
	@GetMapping("/addService")
	public String addServiceView() {
		
		return "admin/addService";
	}
	
	@PostMapping("/addService")
	public String addService(@Valid @ModelAttribute ServiceDTO serviceDTO, BindingResult result, 
			Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
		
		if(result.hasErrors()) {
			model.addAttribute("result", "Invalid Input");
			model.addAttribute("errors", result.getFieldErrors());
			return "admin/addService";
		}
		
		if(serviceDTO.getServiceFile() == null || serviceDTO.getServiceFile().isEmpty()) {
			model.addAttribute("result", "File must be uploaded!");
			return "admin/addService";
		}
		
		MultipartFile multipartFile = serviceDTO.getServiceFile();
		long size = multipartFile.getSize();
		if(size > (1*1024*1024)) {
			model.addAttribute("fileError", "File size must not exceed 1MB!");
			return "admin/addService";
		}
		
		/* Here, We Upload File	*/
		String realPath = request.getServletContext().getRealPath("img/services/");
		
//		String originalFileName = UUID.randomUUID().toString() + LocalDateTime.now().toString().replace(":", "s") + multipartFile.getOriginalFilename();
//		
//		Path path = Paths.get(realPath, originalFileName);
//		File file = path.toFile();
//		multipartFile.transferTo(file);
		
		servicesService.saveService(realPath, multipartFile, serviceDTO);
		redirectAttributes.addFlashAttribute("result", "Service Added Successfully!");
		
		return "redirect:/admin/addService";
		
	}
	
	@GetMapping("/readAllServices")
	public String readAllServices( Model model) {
		model.addAttribute("listOfServices", servicesService.reaServices());
		
		return "admin/readAllServices";
	}
	
	@GetMapping("/deleteService")
	public String deleteServicesById(@RequestParam int id, @RequestParam String filename, 
			RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		String realPath = request.getServletContext().getRealPath("img/services/");
		servicesService.deleteService(realPath, id, filename);
		
		redirectAttributes.addFlashAttribute("result", "File Deleted Successfully!");
		
		return "redirect:/admin/readAllServices";
	}
	
	@GetMapping("/updateService")
	public String updateServiceView(@RequestParam int id, Model model) {
		
		
		Optional<ServiceEntity> service = servicesService.readService(id);
		ServiceEntity serviceEntity = service.get();
		model.addAttribute("serviceData", serviceEntity);
		
		return "admin/updateService";
	}
	
	@PostMapping("/updateService")
	public String updateServiceView(@ModelAttribute ServiceDTO serviceDTO, @RequestParam int id, 
			@RequestParam String oldFileName, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		
		String realPath = request.getServletContext().getRealPath("img/services/");
		MultipartFile serviceFile = serviceDTO.getServiceFile();
		servicesService.updateService(realPath, serviceFile, serviceDTO, id, oldFileName);
		
		
		redirectAttributes.addFlashAttribute("result", "File Updated Successfully!");
		
		return "redirect:/admin/readAllServices";
	}
	
	@GetMapping("/uploadResume")
	public String uploadResumeView() {
		
		return "admin/uploadResume";
	}
	
	@PostMapping("/uploadResume")
	public String uploadResume(@RequestParam MultipartFile resume, 
			RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
		
		//file not empty
		if(resume == null || resume.isEmpty()) {
			
			redirectAttributes.addFlashAttribute("result", "Resume must be uploaded!");
			return "redirect:/admin/uploadResume";
		}
		
		//file size not exceed
		long size = resume.getSize();
		if(size > (2*1024*1024)) {
			redirectAttributes.addFlashAttribute("fileError", "Resume/File size must not exceed 2MB!");
			return "redirect:/admin/uploadResume";
		}
		
		//file contains only pdf
		String contentType = resume.getContentType();
		if(!contentType.contains("pdf")) {
			redirectAttributes.addFlashAttribute("fileError", "Upload Resume/File should be in pdf format only!");
			return "redirect:/admin/uploadResume";
		}
		
		//RealPath
		String realPath = request.getServletContext().getRealPath("/resume/");
		
		//Resume Upload
		Path path = Paths.get(realPath, "MyResume.pdf");
		File file = path.toFile();
		
		//check if old resume exist
		if(file.exists()) {
			file.delete();
		}
		
		resume.transferTo(file);
		
		redirectAttributes.addFlashAttribute("result", "Your Resume Uploaded Successfully!");
		return "redirect:/admin/uploadResume";
	}
}
