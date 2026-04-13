package tech.jwtauth.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tech.jwtauth.entities.UserEntity;
import tech.jwtauth.repositories.UserRepository;

@Service
public class UserInfoDetails implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
			
		Optional<UserEntity> optionalUser = userRepository.findByUsername(username);
		
		UserEntity userEntity = null; 
		
		if(optionalUser.isPresent()) {
			userEntity = optionalUser.get();
		}else {
			throw new UsernameNotFoundException("USER NOT FOUND");
		}
		
		UserDetails userDetails = User.builder()
		.username(userEntity.getUsername())
		.password(userEntity.getPassword())
		.roles(userEntity.getRole().replace("ROLE_", ""))
		.build();
		
		return userDetails;
	}

}
