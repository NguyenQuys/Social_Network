package com.network.SocialNetwork.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.network.SocialNetwork.entity.ChatMessage;
import com.network.SocialNetwork.entity.User;
import com.network.SocialNetwork.repository.UserRepository;

@Controller
public class ChatController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/chat")
    public String chatIndex(Model model)
    {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String usernameCurrently = authentication.getName();
        Optional<User> currentlyUser = userRepository.findByUsername(usernameCurrently);
        currentlyUser.ifPresent(value -> model.addAttribute("currentlyUser", value));
        return "chat";
    }

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(
            @Payload ChatMessage chatMessage
    ) {
        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(
            @Payload ChatMessage chatMessage,
            SimpMessageHeaderAccessor headerAccessor
    ) {
        // Add username in web socket session
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }
}
