package com.JairoBurgos.AutoSocial.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.JairoBurgos.AutoSocial.models.Follower;
import com.JairoBurgos.AutoSocial.models.Image;
import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.repositories.FollowerRepo;
import com.JairoBurgos.AutoSocial.repositories.ImageRepo;
import com.JairoBurgos.AutoSocial.repositories.UserRepo;

@Service
public class HomiesService {
	
	private final UserRepo userRepo;
	private final ImageRepo imageRepo;
	private final FollowerRepo followerRepo;
	
	public HomiesService(UserRepo userRepo, ImageRepo imageRepo, FollowerRepo followerRepo) {
		this.userRepo = userRepo;
		this.imageRepo = imageRepo;
		this.followerRepo = followerRepo;
	}

	public User findUserById(Long Id) {
		return userRepo.findById(Id).get();
	}
	
	public List<Image> ListfindAll() {
		return  imageRepo.findAllByOrderByCreatedAtDesc();
		
	}
	
	public List<Follower> allFollowers(User user){
		return followerRepo.findAllByUserOrderByCreatedAtDesc(user);
		
	}
	
	public List<Follower> allFollowing(User user){
		return followerRepo.findAllByFollowerOrderByCreatedAtDesc(user);
		
	}
	
}
