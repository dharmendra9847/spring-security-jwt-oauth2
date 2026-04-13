package tech.jwtauth.payload;

import lombok.Data;

@Data
public class UserDto {
	
	private String username;
	private String password;
}
