package com.JairoBurgos.AutoSocial.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.services.HomiesService;

@Controller
public class HomiesController {
	private final HomiesService hMS;
	
	public HomiesController(HomiesService hMS) {
		this.hMS = hMS;
	}
	
	@GetMapping("/following/{userId}")
	public String followingList(@PathVariable("userId")Long uId, HttpSession session, Model model) {
		if((Boolean)session.getAttribute("login") == true) {
			if((Long)session.getAttribute("user") == uId) {
				model.addAttribute("user",hMS.findUserById(uId));
				model.addAttribute("following",hMS.allFollowers(hMS.findUserById(uId)));
				return"jsp/homies.jsp";
			}
			else {
				return"redirect:/logout";
			}

		}
		else {
			return"redirect:/logout";
		}
	}
	
	@GetMapping("/explore")
	public String explore(HttpSession session, Model model) {
		if((Boolean)session.getAttribute("login") == true) {
			
			User user = hMS.findUserById((Long)session.getAttribute("user"));
			model.addAttribute("user",user);
			model.addAttribute("images",hMS.ListfindAll());
			return "jsp/explore.jsp";
		}
		else {
			return "redirect:/logout";
			
		}
		
	}
	
	@GetMapping("/followers/{userId}")
	public String followerList(@PathVariable("userId")Long uId, HttpSession session, Model model) {
		if((Boolean)session.getAttribute("login") == true) {
			if((Long)session.getAttribute("user") == uId) {
				model.addAttribute("user",hMS.findUserById(uId));
				model.addAttribute("following",hMS.allFollowing(hMS.findUserById(uId)));
				return"jsp/followers.jsp";
			}
			else {
				return"redirect:/logout";
			}

		}
		else {
			return"redirect:/logout";
		}
	}
}
