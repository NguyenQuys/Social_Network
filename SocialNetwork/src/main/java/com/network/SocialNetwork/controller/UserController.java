package com.network.SocialNetwork.controller;

import com.network.SocialNetwork.entity.User;
import com.network.SocialNetwork.service.UserService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;

import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String login() {
        return "users/login";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "users/login";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("user") User user,
                            BindingResult bindingResult,
                            Model model) 
    {       
        if (bindingResult.hasErrors()) 
        {
            var errors = bindingResult.getAllErrors()  
                        .stream() 
                        .map(DefaultMessageSourceResolvable::getDefaultMessage) 
                        .toArray(String[]::new);
            model.addAttribute("errors", errors); 
            return "users/login";
        }

        try {
            user.setCreated_at(LocalDate.now()); 
            userService.registerUser(user, passwordEncoder);
        } catch (Exception e) {
            model.addAttribute("errors", e.getMessage());
            return "users/login";
        }

        return "redirect:/login"; 
    }
}
