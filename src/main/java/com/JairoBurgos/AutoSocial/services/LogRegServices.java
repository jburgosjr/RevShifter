package com.JairoBurgos.AutoSocial.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.repositories.UserRepo;

@Service
public class LogRegServices {
	private final UserRepo userRepo;

	
	public LogRegServices(UserRepo userRepo) {
		this.userRepo = userRepo;
		
	}
	
	public User findUserByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public User registerUser(User user) {
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hash);
		return userRepo.save(user);
	}
	
	public boolean checkLogin(String email,String password) {
		User user = userRepo.findByEmail(email);
		if(user == null) {
			return false;
		}
		else {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			}
			else {
				return false;
			}
		}
	}
	
	
}
