package com.sahil.latticestay.Repositories;

import com.sahil.latticestay.Dto.GuestDTO;
import com.sahil.latticestay.Entities.GuestEntity;
import com.sahil.latticestay.Entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GuestRepository extends JpaRepository<GuestEntity, Long> {
    List<GuestDTO> findByUser(UserEntity user);
}