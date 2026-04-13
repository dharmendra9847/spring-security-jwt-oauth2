package tech.myportfolio.services;

import java.time.LocalDateTime;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.myportfolio.contactdto.ContactDTO;
import tech.myportfolio.entities.ContactEntity;
import tech.myportfolio.repositories.ContactRepository;

@Service
public class ContactServicesImpl implements ContactService{
	
	@Autowired
	private ContactRepository contactRepository;
	
	@Autowired
	private ModelMapper modelMapper;

	@Override
	public ContactEntity saveContact(ContactDTO contactDTO) {
		
//		ContactEntity contactEntity = new ContactEntity();
//		contactEntity.setName(contactDTO.getName());
//		contactEntity.setEmail(contactDTO.getEmail());
//		contactEntity.setSubject(contactDTO.getSubject());
//		contactEntity.setMessage(contactDTO.getMessage());
//		contactEntity.setDatetime(LocalDateTime.now());
		
		
		ContactEntity contactEntity = modelMapper.map(contactDTO, ContactEntity.class);
		contactEntity.setDatetime(LocalDateTime.now());
		return contactRepository.save(contactEntity);
	}

	@Override
	public boolean isContactEmailExist(String email) { 
		return contactRepository.existsByEmail(email);
	}

	@Override
	public List<ContactEntity> readAllContacts() {
		return contactRepository.findAll();
	}

	@Override
	public void deleteContactById(int id) {
		contactRepository.deleteById(id);
	}

}
