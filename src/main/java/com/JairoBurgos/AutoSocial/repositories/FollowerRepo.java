package com.JairoBurgos.AutoSocial.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JairoBurgos.AutoSocial.models.Follower;
import com.JairoBurgos.AutoSocial.models.User;

@Repository
public interface FollowerRepo extends CrudRepository<Follower,Long> {
	List<Follower> findAllByUserOrderByCreatedAtDesc(User user);
	List<Follower> findAllByFollowerOrderByCreatedAtDesc(User user);
	Follower findByUserAndFollower(User user,User follower);
}
