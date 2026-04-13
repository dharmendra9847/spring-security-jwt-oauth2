package com.springscurityformbasedcustomize;

import com.springscurityformbasedcustomize.entities.AppUser;
import com.springscurityformbasedcustomize.repositories.UserRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class Springscurityformbasedcustomize1Application {

	public static void main(String[] args) {

		ConfigurableApplicationContext run = SpringApplication.run(Springscurityformbasedcustomize1Application.class,
				args);

		UserRepository userRepo = run.getBean(UserRepository.class);
		BCryptPasswordEncoder PassEncoder = run.getBean(BCryptPasswordEncoder.class);

		// admin & member
		if (userRepo.findByUsername("admin").isEmpty()) {

			AppUser appUser = new AppUser();

			// insert username for admin
			appUser.setUsername("admin");

			// insert password foe admin
			appUser.setPassword(PassEncoder.encode("admin1234"));

			// insert role foe admin
			appUser.setRole("ROLE_ADMIN");

			userRepo.save(appUser);

			System.out.println("ADMIN INSERTED SUCCESSFULL!");

		} else {
			System.out.println("ADMIN ALREADY EXIST!");
		}
		
		if (userRepo.findByUsername("member").isEmpty()) {

			AppUser appUser = new AppUser();

			// insert username for member
			appUser.setUsername("member");

			// insert password foe member
			appUser.setPassword(PassEncoder.encode("member1234"));

			// insert role foe member
			appUser.setRole("ROLE_MEMBER");

			userRepo.save(appUser);

			System.out.println("MEMBER INSERTED SUCCESSFULL!");

		} else {
			System.out.println("MEMBER ALREADY EXIST!");
		}
	}

}
