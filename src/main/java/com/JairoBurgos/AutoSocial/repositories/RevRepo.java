package com.JairoBurgos.AutoSocial.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JairoBurgos.AutoSocial.models.Image;
import com.JairoBurgos.AutoSocial.models.Rev;
import com.JairoBurgos.AutoSocial.models.User;

@Repository
public interface RevRepo extends CrudRepository<Rev,Long> {
	Rev findByUserAndImage(User user, Image image);
}
