package com.JairoBurgos.AutoSocial.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JairoBurgos.AutoSocial.models.Comment;
import com.JairoBurgos.AutoSocial.models.Image;

@Repository
public interface CommentRepo extends CrudRepository<Comment,Long> {
	void deleteAllByImage(Image image);
}
