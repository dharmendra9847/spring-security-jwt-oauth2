package tech.myportfolio.contactdto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class ContactDTO {
	
	
	@NotBlank(message = "Name is required")
    @Size(min = 3, max = 30, message = "Name must be 3-30 characters")
    private String name;

    @NotBlank(message = "Email is required")
    @Size(min = 3, max = 30, message = "Enter a valid email (example: abc@gmail.com)")
    private String email;

    @NotBlank(message = "Subject is required")
    @Size(min = 5, max = 50, message = "Subject must be 5-50 characters")
    private String subject;

    @NotBlank(message = "Message is required")
    @Size(min = 10, max = 1000, message = "Message must be at least 10 characters")
    private String message;

	
	public ContactDTO() {
		// TODO Auto-generated constructor stub
	}


	public ContactDTO(String name, String email, String subject, String message) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}


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


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}

}
