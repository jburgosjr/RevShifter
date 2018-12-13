package com.JairoBurgos.AutoSocial.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JairoBurgos.AutoSocial.models.Image;

@Repository
public interface ImageRepo extends CrudRepository<Image,Long> {

	List<Image> findAllByOrderByCreatedAtDesc();
}
