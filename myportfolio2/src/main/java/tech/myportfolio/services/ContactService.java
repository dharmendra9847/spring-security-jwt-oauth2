package tech.myportfolio.services;

import java.util.List;

import tech.myportfolio.contactdto.ContactDTO;
import tech.myportfolio.entities.ContactEntity;

public interface ContactService {
	
	ContactEntity saveContact(ContactDTO contactDTO);
	boolean isContactEmailExist(String email);
	
    List<ContactEntity> readAllContacts();
    void deleteContactById(int id);
}
