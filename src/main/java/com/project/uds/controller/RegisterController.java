package com.project.uds.controller;

import com.project.uds.dto.UserDTO;
import com.project.uds.model.User;
import com.project.uds.service.email.EmailService;
import com.project.uds.service.storage.StorageService;
import com.project.uds.service.user.UserService;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping
public class RegisterController {
    private final UserService userService;

    private final StorageService storageService;
    private final EmailService emailService;

    public RegisterController(UserService userService, StorageService storageService, EmailService emailService) {
        this.userService = userService;
        this.storageService = storageService;
        this.emailService = emailService;
    }

    @GetMapping(value = "/register")
    public String showRegistrationForm(WebRequest request, Model model) {
        UserDTO UserDTO = new UserDTO();
        model.addAttribute("UserDTO", UserDTO);
        return "public/register";
    }

    @PostMapping(value = "/process")
    public ModelAndView saveUser(ModelAndView modelAndView, @ModelAttribute("UserDTO") @Valid final UserDTO UserDTO, BindingResult bindingResult, HttpServletRequest request, Errors errors) {

        User emailExists = userService.findByEmail(UserDTO.getEmail());
        User userNameExists = userService.findByUsername(UserDTO.getUsername());

        if (emailExists != null) {
            modelAndView.setViewName("public/register");
            bindingResult.rejectValue("email", "emailExists");
        }

        if (userNameExists != null) {
            modelAndView.setViewName("public/register");
            bindingResult.rejectValue("username", "userNameExists");
        }

        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("public/register");
        } else {
            User user = userService.createNewAccount(UserDTO);
            user.setEnabled(true);
            userService.save(user);

            SimpleMailMessage registrationEmail = new SimpleMailMessage();
            registrationEmail.setTo(user.getEmail());
            registrationEmail.setSubject("UDS Account Created");
            registrationEmail.setText("Your account has been created. You can start using the storage service by " + "login to page. Thank you for using UDS.");
            emailService.sendEmail(registrationEmail);

            modelAndView.addObject("message", "Email has been sent to " + UserDTO.getEmail() + ".");
            modelAndView.setViewName("public/process");
        }
        return modelAndView;
    }
}
