package com.JairoBurgos.AutoSocial.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.JairoBurgos.AutoSocial.models.Comment;
import com.JairoBurgos.AutoSocial.models.Follower;
import com.JairoBurgos.AutoSocial.models.Image;
import com.JairoBurgos.AutoSocial.models.Rev;
import com.JairoBurgos.AutoSocial.models.User;
import com.JairoBurgos.AutoSocial.repositories.CommentRepo;
import com.JairoBurgos.AutoSocial.repositories.FollowerRepo;
import com.JairoBurgos.AutoSocial.repositories.ImageRepo;
import com.JairoBurgos.AutoSocial.repositories.RevRepo;
import com.JairoBurgos.AutoSocial.repositories.UserRepo;

@Service
public class HomeService {
	
	private final UserRepo userRepo;
	private final FollowerRepo followerRepo;
	private final ImageRepo imageRepo;
	private final CommentRepo commentRepo;
	private final RevRepo revRepo;
	
	public HomeService(UserRepo userRepo, FollowerRepo followerRepo, ImageRepo imageRepo, CommentRepo commentRepo, RevRepo revRepo) {
		this.userRepo = userRepo;
		this.followerRepo = followerRepo;
		this.imageRepo = imageRepo;
		this.commentRepo = commentRepo;
		this.revRepo = revRepo;
	}
	
	public User findUserById(Long Id) {
		return userRepo.findById(Id).get();
	}
	
	public void saveDefaultImage(User user) {
		userRepo.save(user);
	}
	
	public User saveUser(User user) {
		return userRepo.save(user);
	}
	
	public List<Follower> following(User user){
		return followerRepo.findAllByUserOrderByCreatedAtDesc(user);
	}
	
	public List<Image> allImages(){
		return imageRepo.findAllByOrderByCreatedAtDesc();
	}
	
	public void saveComment(Comment comment) {
		commentRepo.save(comment);
	}
	
	public Rev addingRev(Rev rev) {
		return revRepo.save(rev);
	}
	
	public void unRev(Long user, Long image) {
		Rev unrev = revRepo.findByUserAndImage(userRepo.findById(user).get(),imageRepo.findById(image).get());
		revRepo.deleteById(unrev.getId());
	}
	
	public void delCommentById(Long id) {
		commentRepo.deleteById(id);
	}
	

	

	

}
