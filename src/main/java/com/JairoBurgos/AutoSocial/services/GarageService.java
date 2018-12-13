package com.JairoBurgos.AutoSocial.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.JairoBurgos.AutoSocial.models.Image;
import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.models.Vehicle;
import com.JairoBurgos.AutoSocial.repositories.CommentRepo;
import com.JairoBurgos.AutoSocial.repositories.ImageRepo;
import com.JairoBurgos.AutoSocial.repositories.UserRepo;
import com.JairoBurgos.AutoSocial.repositories.VehicleRepo;

@Service
@Transactional
public class GarageService {
	
	private final UserRepo uR;
	private final VehicleRepo vR;
	private final ImageRepo iR;
	private final CommentRepo cR;
	private final AmazonClient aC;
	
	public GarageService(UserRepo uR, VehicleRepo vR,ImageRepo iR, CommentRepo cR, AmazonClient aC) {
		this.uR = uR;
		this.vR = vR;
		this.iR = iR;
		this.cR = cR;
		this.aC =aC;
	}
	
	public User findUserById(Long id) {
		return uR.findById(id).get();
	}
	
	public Vehicle addVehicle(Vehicle vehicle) {
		return vR.save(vehicle);
	}
	
	public Vehicle findVehicleById(Long id) {
		return vR.findById(id).get();
	}
	
	public void saveImage(Image image) {
		iR.save(image);
	}
	
	public Image findImageById(Long id) {
		return iR.findById(id).get();
	}
	
	public void deleteAllImageComments(Image image) {
		cR.deleteAllByImage(image);
	}
	
	public void deleteImageById(Long id) {
		iR.deleteById(id);
	}
	
	public void deleteVehicleById(Long Id){
		Vehicle vehicle = findVehicleById(Id);
		for(Image image: vehicle.getImages()) {
			deleteAllImageComments(image);
			aC.deleteFileFromS3Bucket(image.getUrl());
			deleteImageById(image.getId());
		}
		vR.deleteById(Id);
	}

}
