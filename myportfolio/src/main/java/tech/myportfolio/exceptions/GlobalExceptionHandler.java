package tech.myportfolio.exceptions;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public String handleGerneralException(Exception e, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		String header = request.getHeader("referer");
//		System.out.println(header);
		
//		redirectAttributes.addFlashAttribute("msg", "Something Went Wrong " + e.getMessage());
//		return "redirect:/client/contact";
		
		redirectAttributes.addFlashAttribute("result", "Something Went Wrong!");
		return "redirect:" + header;
		
	}
	
	
	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public String handleMaxUploadSizeExceededException(Exception e, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		String header = request.getHeader("referer");
//		System.out.println(header);
		
//		redirectAttributes.addFlashAttribute("msg", "Something Went Wrong " + e.getMessage());
//		return "redirect:/client/contact";
		
		redirectAttributes.addFlashAttribute("result", "File size must not exceed 5MB!");
		return "redirect:" + header;
		
	}

}
