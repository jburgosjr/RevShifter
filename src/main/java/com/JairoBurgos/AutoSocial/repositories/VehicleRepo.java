package com.JairoBurgos.AutoSocial.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.JairoBurgos.AutoSocial.models.Vehicle;

@Repository
public interface VehicleRepo extends CrudRepository<Vehicle,Long>{

}
