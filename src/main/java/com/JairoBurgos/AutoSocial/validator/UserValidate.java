package com.JairoBurgos.AutoSocial.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.services.LogRegServices;

@Component
public class UserValidate implements Validator {
	
	private LogRegServices lRS;
	
	

	public UserValidate(LogRegServices lRS) {
		
		this.lRS = lRS;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		if(!user.getPasswordConfirmation().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirmation", "Match");
		}
		
		if(lRS.findUserByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "Registered");
		}
		
	}

	
}
