package tech.jwtauth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import tech.jwtauth.entities.UserEntity;
import tech.jwtauth.repositories.UserRepository;

@SpringBootApplication
public class Jwtauth1Application {

	public static void main(String[] args) {
		
		ConfigurableApplicationContext caContext = SpringApplication.run(Jwtauth1Application.class, args);
		
		UserRepository userRepo = caContext.getBean(UserRepository.class);
		BCryptPasswordEncoder bcpassword = caContext.getBean(BCryptPasswordEncoder.class);
		
		if(userRepo.findByUsername("admin").isEmpty()) {
			
			UserEntity userEntity = new UserEntity();
			
			userEntity.setUsername("admin");
			userEntity.setPassword(bcpassword.encode("admin123"));
			userEntity.setRole("ROLE_ADMIN");
			userRepo.save(userEntity);
			
			System.out.println("ADMIN INSERTED SUCCESSFULL!");

		} else {
			System.out.println("ADMIN ALREADY EXIST!");
		}
		
		if(userRepo.findByUsername("member").isEmpty()) {
			UserEntity userEntity = new UserEntity();
			
			userEntity.setUsername("member");
			userEntity.setPassword(bcpassword.encode("member123"));
			userEntity.setRole("ROLE_MEMBER");
			userRepo.save(userEntity);
			
			System.out.println("MEMBER INSERTED SUCCESSFULL!");

		} else {
			System.out.println("MEMBER ALREADY EXIST!");
		}
	}

}
