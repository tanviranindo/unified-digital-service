package com.project.uds.dto;

import com.project.uds.validator.ValidEmail;
import com.project.uds.model.Role;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class UserUpdateDTO {

    private Long id;

    @NotBlank(message = "First name is required")
    private String name;

    @NotBlank(message = "Last name is required")
    private String Surname;

    @NotBlank(message = "Username is required")
    private String username;

    @ValidEmail
    @NotBlank(message = "Email is required")
    private String email;

    private List<Role> roles = new ArrayList<>();

    private boolean enabled;


}
