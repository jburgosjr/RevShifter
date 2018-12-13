package com.JairoBurgos.AutoSocial.services;

import org.springframework.stereotype.Service;

import com.JairoBurgos.AutoSocial.models.Follower;
import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.repositories.FollowerRepo;
import com.JairoBurgos.AutoSocial.repositories.UserRepo;

@Service
public class InteractionService {
	
	private final UserRepo uR;
	private final FollowerRepo fR;
	
	public InteractionService(UserRepo uR,FollowerRepo fR) {
		this.uR = uR;
		this.fR = fR;
	}
	
	public User findUserById(Long id) {
		return uR.findById(id).get();
	}
	
	public Follower saveFollow(Follower follower) {
		return fR.save(follower);
	}
}
