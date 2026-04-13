package tech.mythymeleafproject.dto;

import javax.validation.constraints.NotBlank;

public class UserDTO {
	
	@NotBlank(message = "Name must be required!")
	private String name;
	
	@NotBlank(message = "EmaIl must be required!")
	private String email;
	
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "UserDTO [name=" + name + ", email=" + email + "]";
	}
}
