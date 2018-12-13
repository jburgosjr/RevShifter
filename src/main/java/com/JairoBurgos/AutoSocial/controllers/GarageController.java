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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.JairoBurgos.AutoSocial.models.Image;
import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.models.Vehicle;
import com.JairoBurgos.AutoSocial.services.AmazonClient;
import com.JairoBurgos.AutoSocial.services.GarageService;

@Controller
public class GarageController {
	private final GarageService gS;
	private final AmazonClient aC;
	
	public GarageController(GarageService gS, AmazonClient aC) {
		this.gS = gS;
		this.aC = aC;
	}
	
	@GetMapping("/myGarage")
	public String myGarage(@ModelAttribute("addVehicle")Vehicle vehicle,HttpSession session, Model model) {
		if((Boolean)session.getAttribute("login") == true) {
			model.addAttribute("user",gS.findUserById((Long)session.getAttribute("user")));
			return"jsp/garage.jsp";
		}
		else {
			return"redirect:/";
		}
	}
	
	@PostMapping("/addVehicle")
	public String addToGarage(@Valid @ModelAttribute("addVehicle")Vehicle vehicle,BindingResult result,@RequestPart(value = "file") MultipartFile file,HttpSession session,Model model) {
		if(result.hasErrors()) {
			model.addAttribute("user",gS.findUserById((Long)session.getAttribute("user")));
			model.addAttribute("error","visibility:visible");
			model.addAttribute("color","red");
			return"jsp/garage.jsp";
		}
		else {
			String coverPic = aC.uploadFile(file);
			User user = gS.findUserById((Long)session.getAttribute("user"));
			vehicle.setUser(user);
			vehicle.setCoverImage(coverPic);
			gS.addVehicle(vehicle);
			return"redirect:/home";
		}
	}
	
	@GetMapping("/myGarage/{vId}")
	public String carInfo(HttpSession session,Model model,@PathVariable("vId")Long vId,@ModelAttribute("image")Image image) {
		if((Boolean)session.getAttribute("login") != true || (Long)session.getAttribute("user") != gS.findVehicleById(vId).getUser().getId()) {
			return"redirect:/";
		}
		else {
			model.addAttribute("vehicle",gS.findVehicleById(vId));
			model.addAttribute("user",gS.findUserById((Long)session.getAttribute("user")));
			return"jsp/carInfo.jsp";
		}
	}
	
	@PostMapping("/myGarage/addPhoto")
	public String addPhotoToCar(HttpSession session,@RequestPart(value = "file") MultipartFile file,@ModelAttribute("image")Image image) {
		String photo=aC.uploadFile(file);
		User user = gS.findUserById((Long)session.getAttribute("user"));
		image.setUser(user);
		image.setUrl(photo);
		gS.saveImage(image);
		
		return "redirect:/myGarage/"+image.getVehicle().getId();
		
	}
	
	@DeleteMapping ("/delImage")
	public String deleteImage(@RequestParam("imageId")Long iId,@RequestParam("vehicleId")Long vId, HttpSession session) {
		if((Boolean)session.getAttribute("login") != true || gS.findImageById(iId).getUser().getId() != (Long)session.getAttribute("user")) {
			return "redirect:/logout";
		}
		else {
			Image image =  gS.findImageById(iId);
			gS.deleteAllImageComments(image);
			aC.deleteFileFromS3Bucket(image.getUrl());
			gS.deleteImageById(iId);
			return "redirect:/myGarage/"+vId;
		}
	}
	
	@DeleteMapping ("/delVehicle")
	public String deleteVehicle(@RequestParam("vehicleId")Long vId,HttpSession session) {
		if((Boolean)session.getAttribute("login") != true || gS.findVehicleById(vId).getUser().getId() != (Long)session.getAttribute("user")) {
			return "redirect:/logout";
		}
		else {
			gS.deleteVehicleById(vId);
			return "redirect:/myGarage";
		}
	}
	
	
	
	
	
	
}
