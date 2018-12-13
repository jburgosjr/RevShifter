package com.JairoBurgos.AutoSocial.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.JairoBurgos.AutoSocial.models.Follower;
import com.JairoBurgos.AutoSocial.models.Image;
import com.JairoBurgos.AutoSocial.services.ProfileService;

@Controller
public class ProfileController {
	
	private final ProfileService pS;
	
	public ProfileController(ProfileService pS) {
		this.pS = pS;
	}
	
	@GetMapping("/profile/{userId}")
	public String getProfileInfo(@Valid @ModelAttribute("follower")Follower fUser,BindingResult result,@PathVariable("userId")Long uId, HttpSession session, Model model) {
		if((Boolean)session.getAttribute("login") == true) {
			Follower check = pS.findIfFollowing(pS.findUserById((Long)session.getAttribute("user")),pS.findUserById(uId));
			model.addAttribute("check",check);
			model.addAttribute("user",pS.findUserById(uId));
			model.addAttribute("mainUser",pS.findUserById((Long)session.getAttribute("user")));
			

			return"jsp/profile.jsp";
		}
		else {
			return"redirect:/logout";
		}
	}
	
	@GetMapping("/profile/garage/{vId}")
	public String carInfo(HttpSession session,Model model,@PathVariable("vId")Long vId,@ModelAttribute("image")Image image) {
		if((Boolean)session.getAttribute("login") != true) {
			return"redirect:/";
		}
		else {
			model.addAttribute("vehicle",pS.findVehicleById(vId));
			model.addAttribute("user",pS.findUserById((Long)session.getAttribute("user")));
			return"jsp/profileCarInfo.jsp";
		}
	}
	
	@DeleteMapping("/unfollow")
	public String unfollowUser(@RequestParam("unfollowId")Long unfollowId,HttpSession session) {
		pS.unfollowUserbyId(pS.findUserById(unfollowId), pS.findUserById((Long)session.getAttribute("user")));
		return "redirect:/profile/"+unfollowId;
		
	}
}
