package com.sahil.latticestay.Repositories;

import com.sahil.latticestay.Entities.HotelEntity;
import com.sahil.latticestay.Entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HotelRepository extends JpaRepository<HotelEntity,Long> {
    List<HotelEntity> findByOwner(UserEntity user);
}
