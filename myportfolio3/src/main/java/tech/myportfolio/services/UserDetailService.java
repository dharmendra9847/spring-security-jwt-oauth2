package tech.myportfolio.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import tech.myportfolio.entities.UserEntity;
import tech.myportfolio.repositories.UserRepository;

@Service
public class UserDetailService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
    private PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Optional<UserEntity> opUser = userRepository.findByUsername(username);
		
		UserEntity appUser = null;
		
		if(opUser.isPresent()) {
			appUser = opUser.get();
		}else {
			throw new UsernameNotFoundException("USER NOT FOUND");
		}
		
		UserDetails userDetails = User.builder()
		.username(appUser.getUsername())
		.password(appUser.getPassword())
		.roles(appUser.getRole().replace("ROLE_", ""))
		.build();
		
		return userDetails;
	}
	
	
	public void saveUser(UserEntity user) {
        // Encode the password before saving
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        
        // Ensure role format is correct (e.g., ROLE_USER)
        if (!user.getRole().startsWith("ROLE_")) {
            user.setRole("ROLE_" + user.getRole().toUpperCase());
        }
        
        userRepository.save(user);
    }

}
