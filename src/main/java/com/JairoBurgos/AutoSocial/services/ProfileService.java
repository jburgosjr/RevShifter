package com.JairoBurgos.AutoSocial.services;

import org.springframework.stereotype.Service;

import com.JairoBurgos.AutoSocial.models.Follower;
import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.models.Vehicle;
import com.JairoBurgos.AutoSocial.repositories.FollowerRepo;
import com.JairoBurgos.AutoSocial.repositories.UserRepo;
import com.JairoBurgos.AutoSocial.repositories.VehicleRepo;

@Service
public class ProfileService {
	
	private final UserRepo userRepo;
	private final VehicleRepo vehicleRepo;
	private final FollowerRepo followRepo;
	
	public ProfileService(UserRepo userRepo,VehicleRepo vehicleRepo, FollowerRepo followRepo) {
		this.userRepo=userRepo;
		this.vehicleRepo=vehicleRepo;
		this.followRepo=followRepo;
	}
	
	public User findUserById(Long Id) {
		return userRepo.findById(Id).get();
	}
	
	public Vehicle findVehicleById(Long id) {
		return vehicleRepo.findById(id).get();
	}
	
	public Follower findIfFollowing(User user, User follower) {
		return followRepo.findByUserAndFollower(user, follower);
	}
	
	public void unfollowUserbyId(User unfollow, User user) {
		Follower delete = followRepo.findByUserAndFollower(user, unfollow);
		followRepo.deleteById(delete.getId());
	}
	

}
