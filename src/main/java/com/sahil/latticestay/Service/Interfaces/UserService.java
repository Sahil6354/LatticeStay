package com.sahil.latticestay.Service.Interfaces;

import com.sahil.latticestay.Dto.ProfileUpdateRequestDTO;
import com.sahil.latticestay.Dto.UserDTO;
import com.sahil.latticestay.Entities.UserEntity;

public interface UserService {
    UserEntity getUserById(Long id);

    void updateProfile(ProfileUpdateRequestDTO profileUpdateRequestDto);

    UserDTO getMyProfile();
}
