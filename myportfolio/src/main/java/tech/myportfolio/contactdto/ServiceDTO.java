package tech.myportfolio.contactdto;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class ServiceDTO {
	
	
	@NotBlank(message = "Title is required")
    @Size(min = 3, max = 30, message = "Title must be 3-30 characters")
    private String title;

    @NotBlank(message = "Description is required")
    @Size(min = 3, max = 600, message = "Description must be 3-600 characters")
    private String description;
    
    private MultipartFile serviceFile;
 
	public ServiceDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public MultipartFile getServiceFile() {
		return serviceFile;
	}

	public void setServiceFile(MultipartFile serviceFile) {
		this.serviceFile = serviceFile;
	}
	
	

}
