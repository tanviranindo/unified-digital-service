package com.project.uds.config;

import com.project.uds.model.Role;
import com.project.uds.model.User;
import com.project.uds.service.role.RoleService;
import com.project.uds.service.user.UserService;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Component
public class DataLoader implements ApplicationListener<ContextRefreshedEvent> {
    private boolean alreadySetup = false;
    private final UserService userService;
    private final RoleService roleService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public DataLoader(UserService userService, RoleService roleService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Override
    @Transactional
    public void onApplicationEvent(final ContextRefreshedEvent event) {
        if (alreadySetup) return;

        Role roleAdmin = createRoleIfNotFound("ROLE_ADMIN");
        Role roleUser = createRoleIfNotFound("ROLE_USER");
        List<Role> adminRoles = Collections.singletonList(roleAdmin);
        List<Role> userRoles = Collections.singletonList(roleUser);

        createUserIfNotFound("admin@gmail.com", "Admin", "Admin", "admin", "admin", adminRoles);

        for (int i = 1; i < 20; i++)
            createUserIfNotFound("user" + i + "@gmail.com", "User" + i, "User" + i, "user" + i, "user" + i, userRoles);
        alreadySetup = true;
    }

    @Transactional
    Role createRoleIfNotFound(final String name) {
        Role role = roleService.findByName(name);
        if (role == null) {
            role = new Role(name);
            roleService.save(role);
        }
        return role;
    }

    @Transactional
    void createUserIfNotFound(final String email, final String name, final String surname, final String username, final String password, final List<Role> userRoles) {
        User user = userService.findByEmail(email);
        if (user == null) {
            user = new User();
            user.setName(name);
            user.setSurname(surname);
            user.setUsername(username);
            user.setPassword(bCryptPasswordEncoder.encode(password));
            user.setEmail(email);
            user.setRoles(userRoles);
            user.setEnabled(true);
            userService.save(user);
        }
    }
}
