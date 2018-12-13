package com.JairoBurgos.AutoSocial.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JairoBurgos.AutoSocial.models.User;

@Repository
public interface UserRepo extends CrudRepository<User,Long> {

	User findByEmail(String email);
}
