package com.network.SocialNetwork.entity;


import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;

import com.network.SocialNetwork.eenum.Action;

import groovyjarjarantlr4.v4.runtime.misc.NotNull;

@Setter
@Getter
@RequiredArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "FriendshipHistory")
public class FriendshipHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "history_id")
    private Long historyId;

    @ManyToOne
    @JoinColumn(name = "user1_id", nullable = false)
    private User user1;

    @ManyToOne
    @JoinColumn(name = "user2_id", nullable = false)
    private User user2;

    @Enumerated(EnumType.STRING)
    @Column(name = "action", nullable = false, columnDefinition = "ENUM('BEFRIENDED', 'UNFRIENDED')")
    private Action action;

    @Column(name = "action_at", nullable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Timestamp actionAt;
}
