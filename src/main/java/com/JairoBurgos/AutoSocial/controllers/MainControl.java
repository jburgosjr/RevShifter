package com.JairoBurgos.AutoSocial.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.services.LogRegServices;
import com.JairoBurgos.AutoSocial.validator.UserValidate;

@Controller
public class MainControl {
	private final LogRegServices lRS;
	private final UserValidate uV;
	
	public MainControl(LogRegServices lRS, UserValidate uV) {
		this.lRS = lRS;
		this.uV = uV;
	}

	@GetMapping("/")
	public String logReg(@ModelAttribute("userReg")User user,HttpSession session) {
		if(session.isNew()) {
			session.setAttribute("login", false);
		}
		return"jsp/logReg.jsp";
	}
	
	@PostMapping("/register")
	public String registerProcess(@Valid @ModelAttribute("userReg")User user,BindingResult result,RedirectAttributes rA ,Model model) {
		uV.validate(user, result);
		if(result.hasErrors()) {
			model.addAttribute("error","visibility:visible");
			model.addAttribute("color","red");
			return"jsp/logReg.jsp";
		}
		else {
			lRS.registerUser(user);
			rA.addFlashAttribute("error","visibility:visible;");
			rA.addFlashAttribute("color","green");
			rA.addFlashAttribute("successText","<p>Registered Sucessfully, you may now log in</p>");
			return"redirect:/";
			
		}
	}
	
	@PostMapping("/Login")
	public String loginProcess(@RequestParam("email")String email,@RequestParam("password")String password,HttpSession session,RedirectAttributes rA) {
		if(lRS.checkLogin(email, password) == false) {
			rA.addFlashAttribute("error","visibility:visible;");
			rA.addFlashAttribute("error2Text","<p>Invalid Credentials<p>");
			rA.addFlashAttribute("color","red");
			return "redirect:/";
		}
		else {
			session.setAttribute("login", true);
			session.setAttribute("user",lRS.findUserByEmail(email).getId());
			return"redirect:/home";
			
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return"redirect:/";
	}

}
