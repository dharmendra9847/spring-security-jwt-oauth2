package tech.myportfolio.services;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import tech.myportfolio.contactdto.ServiceDTO;
import tech.myportfolio.entities.ServiceEntity;

public interface ServicesService {
	
	ServiceEntity saveService(String realPath, MultipartFile multipartFile, ServiceDTO serviceDTO) throws Exception;
	List<ServiceEntity> reaServices();
	void deleteService(String realPath, int id, String filename);
	Optional<ServiceEntity> readService(int id);
	ServiceEntity updateService(String realPath, MultipartFile multipartFile, ServiceDTO serviceDTO, 
			int id, String oldFileName) throws Exception;

}
