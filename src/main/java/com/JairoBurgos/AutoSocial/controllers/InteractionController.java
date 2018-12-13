package com.JairoBurgos.AutoSocial.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.JairoBurgos.AutoSocial.models.Follower;
import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.services.InteractionService;

@Controller
public class InteractionController {
	private final InteractionService iS;
	
	public InteractionController(InteractionService iS) {
		this.iS = iS;
	}
	
	@PostMapping("/follow/{fId}")
	public String addFollow(@PathVariable("fId")Long fId,@Valid @ModelAttribute("follower")Follower fUser,BindingResult result,HttpSession session) {
		if(result.hasErrors()) {
			return"redirect:/profile/"+fId;
		}
		else {
			Long userId =(Long)session.getAttribute("user");
			User user = iS.findUserById(userId);
			fUser.setUser(user);
			iS.saveFollow(fUser);
			
			return"redirect:/profile/"+fId;
		}
	}
}
