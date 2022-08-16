package com.project.uds.validator;

import com.project.uds.dto.UserDTO;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordMValidate implements ConstraintValidator<PasswordValidate, Object> {

    @Override
    public void initialize(PasswordValidate passwordValidate) {
    }

    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext context) {
        UserDTO UserDTO = (UserDTO) obj;
        return UserDTO.getPassword().equals(UserDTO.getMatchingPassword());

    }

}
