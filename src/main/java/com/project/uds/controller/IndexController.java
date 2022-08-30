package com.project.uds.controller;

import com.project.uds.dto.UserDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping
public class IndexController {

    @GetMapping(value = {"/", "/index"})
    public String index() {
        return "public/index";
    }

}
