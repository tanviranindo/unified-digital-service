package com.project.uds.dto;

import com.project.uds.validator.PasswordValidate;
import com.project.uds.validator.ValidEmail;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.sql.Blob;

@Getter
@Setter
@PasswordValidate
public class UserDTO {

    private Long id;

    @NotBlank(message = "First name is required")
    private String name;

    @NotBlank(message = "Last name is required")
    private String surname;

    @NotBlank(message = "Username is required")
    private String username;

    @ValidEmail
    @NotBlank(message = "Email is required")
    private String email;

    @NotBlank(message = "Password is required")
    private String password;

//    private String photo;

    @NotBlank(message = "Matching password is required")
    private String matchingPassword;

    private boolean enabled;
}
