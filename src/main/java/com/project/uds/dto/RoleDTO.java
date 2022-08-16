package com.project.uds.dto;

import com.project.uds.validator.ValidRole;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class RoleDTO {
    Long id;

    @ValidRole
    @NotBlank(message = "Role is required") String name;
}
