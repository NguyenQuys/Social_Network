package com.network.SocialNetwork.entity;

import com.network.SocialNetwork.eenum.MessageType;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatMessage {

    private MessageType type;
    private String content;
    private String sender;

}