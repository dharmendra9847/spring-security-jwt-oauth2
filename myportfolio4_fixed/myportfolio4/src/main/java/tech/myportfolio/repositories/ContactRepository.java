package tech.myportfolio.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.myportfolio.entities.ContactEntity;

@Repository
public interface ContactRepository extends JpaRepository<ContactEntity, Integer>{
	
	boolean existsByEmail(String email);

}
