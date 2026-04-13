package tech.myportfolio.services;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.transaction.Transactional;
import tech.myportfolio.contactdto.ServiceDTO;
import tech.myportfolio.entities.ServiceEntity;
import tech.myportfolio.repositories.ServiceRepository;


@Service
public class ServicesServiceImpl implements ServicesService{
	
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Autowired
	private ModelMapper modelMapper;

	@Override
	@Transactional(rollbackOn = Exception.class)
	public ServiceEntity saveService(String realPath, MultipartFile multipartFile, ServiceDTO serviceDTO) throws Exception {

		//Database Logic (Here, Store data in Database)
		String filename = UUID.randomUUID().toString() + LocalDateTime.now().toString().replace(":", "s") + multipartFile.getOriginalFilename();
		ServiceEntity serviceEntity = modelMapper.map(serviceDTO, ServiceEntity.class);
		serviceEntity.setFilename(filename);
		serviceEntity.setDatetime(LocalDateTime.now());
		
		ServiceEntity entity = serviceRepository.save(serviceEntity);
		
		//File Logic
		Path path = Paths.get(realPath, filename);
		File file = path.toFile();
		multipartFile.transferTo(file);
		
		return entity;
		

	}

	@Override
	public List<ServiceEntity> reaServices() {
		return serviceRepository.findAll();
	}

	@Override
	@Transactional(rollbackOn = Exception.class)
	public void deleteService(String realPath, int id, String filename) {
		
		serviceRepository.deleteById(id);
		File file = new File(realPath + File.separator + filename);
		file.delete();
		
	}

	@Override
	public Optional<ServiceEntity> readService(int id) {
		
		return serviceRepository.findById(id);
	}

	@Override
	@Transactional(dontRollbackOn = Exception.class)
	public ServiceEntity updateService(String realPath, MultipartFile multipartFile, ServiceDTO serviceDTO, int id,
			String oldFileName) throws Exception {
		
		if(multipartFile != null && !multipartFile.isEmpty()) {
			
			//New File Database Logic (Here, Store data in Database)
			String filename = UUID.randomUUID().toString() + LocalDateTime.now().toString().replace(":", "s") + multipartFile.getOriginalFilename();
			ServiceEntity serviceEntity = modelMapper.map(serviceDTO, ServiceEntity.class);
			serviceEntity.setId(id);
			serviceEntity.setFilename(filename);
			serviceEntity.setDatetime(LocalDateTime.now());
			ServiceEntity entity = serviceRepository.save(serviceEntity);
			
			//Old File Deleted
			new File(realPath + File.separator + oldFileName).delete(); 
			
			//New File Updated
			Path path = Paths.get(realPath, filename);
			File file = path.toFile();
			multipartFile.transferTo(file);
			
			return entity;
			
		}else {
			//Old File Logic (Here, Store data in Database)
			ServiceEntity serviceEntity = modelMapper.map(serviceDTO, ServiceEntity.class);
			serviceEntity.setId(id);
			serviceEntity.setFilename(oldFileName);
			serviceEntity.setDatetime(LocalDateTime.now());
			ServiceEntity entity = serviceRepository.save(serviceEntity);
			return entity;
		}
		
	}


}
