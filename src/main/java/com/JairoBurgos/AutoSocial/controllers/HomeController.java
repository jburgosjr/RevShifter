package com.JairoBurgos.AutoSocial.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.JairoBurgos.AutoSocial.models.Comment;
import com.JairoBurgos.AutoSocial.models.Rev;
import com.JairoBurgos.AutoSocial.services.HomeService;

@Controller
public class HomeController {
	private final HomeService hS;
	
	public HomeController(HomeService hS) {
		this.hS = hS;
	}
	
	@GetMapping("/home")
	public String homePage(@ModelAttribute("addComment")Comment comment,@ModelAttribute("addRev")Rev rev,HttpSession session,Model model) {
		if((Boolean)session.getAttribute("login") == true) {
			model.addAttribute("user",hS.findUserById((Long)session.getAttribute("user")));
			model.addAttribute("images", hS.allImages());
			model.addAttribute("following",hS.following(hS.findUserById((Long)session.getAttribute("user"))));
			return"jsp/home.jsp";
		}
		else {
			return"redirect:/";
		}
	}
	
	@PostMapping("/addComment")
	public String addComment(@Valid @ModelAttribute("addComment")Comment comment,BindingResult result,@ModelAttribute("addRev")Rev rev,Model model,HttpSession session){
		if(result.hasErrors()) {
			model.addAttribute("user",hS.findUserById((Long)session.getAttribute("user")));
			model.addAttribute("images", hS.allImages());
			model.addAttribute("following",hS.following(hS.findUserById((Long)session.getAttribute("user"))));
			model.addAttribute("error","visibility:visible");
			model.addAttribute("color","red");
			return"jsp/home.jsp";
		}
		else {
			hS.saveComment(comment);
			return"redirect:/home";
		}
	}
	
	@PostMapping("/addRev")
	public String addRev(@ModelAttribute("addRev")Rev rev,BindingResult result) {
		hS.addingRev(rev);
		return"redirect:/home";
	}
	
	@DeleteMapping("/unRev")
	public String unRev(@RequestParam("user")Long user,@RequestParam("image")Long image) {
		hS.unRev(user, image);
		return"redirect:/home";
	}
	
	@DeleteMapping("/deleteComment")
	public String deleteComment(@RequestParam("commentId")Long cId) {
		hS.delCommentById(cId);
		return"redirect:/home";
	}
}
