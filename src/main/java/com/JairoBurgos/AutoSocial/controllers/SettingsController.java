package com.JairoBurgos.AutoSocial.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.services.AmazonClient;
import com.JairoBurgos.AutoSocial.services.HomeService;

@Controller
public class SettingsController {
	private final HomeService hS;
	private final AmazonClient amazonClient;
	
	public SettingsController(HomeService hS,AmazonClient amazonClient) {
		this.hS = hS;
		this.amazonClient = amazonClient;
	}
	
	@GetMapping("/user/{uId}/settings")
	public String settings(@PathVariable("uId")Long uId,HttpSession session,Model model,@ModelAttribute("user")User user) {
		if((Boolean)session.getAttribute("login") == false) {
			return"redirect:/logout";
		}
		else {
			if((Long)session.getAttribute("user") != uId ) {
				return"redirect:/logout";
			}
			else {
				model.addAttribute("user",hS.findUserById((Long)session.getAttribute("user")));
				return"jsp/settings.jsp";
			}
		}
	}
	
	@PostMapping("/settings/addDefaultPic")
	public String addDefaultPic(@RequestPart(value = "file") MultipartFile file,HttpSession session) {
		String picUrl = amazonClient.uploadFile(file);
		User user = hS.findUserById((Long)session.getAttribute("user"));
		user.setDefaultImage(picUrl);
		hS.saveDefaultImage(user);
		return("redirect:/home");
		
	}
	@PostMapping("/updateUserInfo/{id}")
	public String updateInfo(@Valid @ModelAttribute("user")User user,BindingResult result,Model model,@PathVariable("id")Long id) {
			if(result.hasErrors()) {
				model.addAttribute("error","visibility:visible");
				model.addAttribute("color","red");
				return"jsp/settings.jsp";
			}
			else {
				hS.saveUser(user);
				return"redirect:/home";
			}
			
		}
	
}
