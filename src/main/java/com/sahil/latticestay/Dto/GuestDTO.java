package com.sahil.latticestay.Dto;

import com.sahil.latticestay.Entities.UserEntity;
import com.sahil.latticestay.Enums.Gender;
import lombok.Data;

@Data
public class GuestDTO {
    private Long id;
    private String name;
    private Gender gender;
    private Integer age;
}
