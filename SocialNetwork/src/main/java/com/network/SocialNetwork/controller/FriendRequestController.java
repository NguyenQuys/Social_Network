package com.network.SocialNetwork.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.network.SocialNetwork.entity.FriendRequest;
import com.network.SocialNetwork.entity.User;
import com.network.SocialNetwork.repository.FriendRequestRepository;
import com.network.SocialNetwork.repository.UserRepository;
import com.network.SocialNetwork.service.FriendBlockService;
import com.network.SocialNetwork.service.FriendRequestService;

@Controller
@RequestMapping("/add-friend")

public class FriendRequestController {
    @Autowired
    private FriendRequestService friendRequestService;

    @Autowired
    private FriendRequestRepository friendRequestRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private FriendBlockService friendBlockService;

    public String GetUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

    @PostMapping("/send-request")
    public String sendRequest(@RequestParam("requesterId") Long requesterId,
            @RequestParam("addresseeId") Long addresseeId) {
        FriendRequest friendRequest = friendRequestService.sendFriendRequest(requesterId, addresseeId);
        if (friendRequest != null) {
            return "redirect:/profile/" + addresseeId + "?success=true";
        } else {
            return "redirect:/profile/" + addresseeId + "?success=false";
        }
    }

    @PostMapping("/cancel-request")
    public String CancelRequest(@RequestParam("requesterId") Long requesterId,
            @RequestParam("addresseeId") Long addresseeId) {
        FriendRequest friendRequest = friendRequestRepository.findByRequesterAndAddressee(requesterId, addresseeId);
        friendRequestRepository.delete(friendRequest);

        return "redirect:/profile/" + addresseeId;
    }

    @PostMapping("/accept-request")
    public String AcceptRequest(@Param("idUserHasBeenAccepted") Long idUserHasBeenAccepted) {
        Long idCurrentlyUser = null;
        String username = GetUserName();
        Optional<User> currentlyUserOpt = userRepository.findByUsername(username);
        if (currentlyUserOpt.isPresent()) {
            User user = currentlyUserOpt.get();
            idCurrentlyUser = user.getId();
        }

        friendRequestService.AcceptFriendRequest(idUserHasBeenAccepted, idCurrentlyUser);
        return "redirect:/add-friend-request-list";
    }

    @PostMapping("/unfriend")
    public String Unfriend(@Param("idUserHasBeenUnfriend") Long idUserHasBeenUnfriend) {
        Long idCurrentlyUser = null;
        String username = GetUserName();
        Optional<User> currentlyUserOpt = userRepository.findByUsername(username);
        if (currentlyUserOpt.isPresent()) {
            User user = currentlyUserOpt.get();
            idCurrentlyUser = user.getId();
        }

        FriendRequest friendship = friendRequestRepository.findByRequesterAndAddressee(idUserHasBeenUnfriend,
                idCurrentlyUser);
        if (friendship == null) {
            friendship = friendRequestRepository.findByRequesterAndAddressee(idCurrentlyUser, idUserHasBeenUnfriend);
        }
        friendRequestRepository.delete(friendship);
        return "redirect:/profile/" + idUserHasBeenUnfriend;
    }

    @PostMapping("/reject-request")
    public String RejectAddFriendRequest(@Param("idUserHasBeenReject") Long idUserHasBeenReject) {
        Long idCurrentlyUser = null;
        String username = GetUserName();
        Optional<User> currentlyUserOpt = userRepository.findByUsername(username);
        if (currentlyUserOpt.isPresent()) {
            User user = currentlyUserOpt.get();
            idCurrentlyUser = user.getId();
        }

        FriendRequest friendRequest = friendRequestRepository.findByRequesterAndAddressee(idUserHasBeenReject,
                idCurrentlyUser);
        friendRequestRepository.delete(friendRequest);
        return "redirect:/add-friend-request-list";
    }

    @PostMapping("/block-and-unblock")
    public String BlockAndUnblockFriend(@Param("idUserBlocked") Long idUserBlocked) {
        Long idCurrentlyUser = null;
        String username = GetUserName();
        Optional<User> currentlyUserOpt = userRepository.findByUsername(username);
        if (currentlyUserOpt.isPresent()) {
            User user = currentlyUserOpt.get();
            idCurrentlyUser = user.getId();
        }

        friendBlockService.blockAndUnblock(idCurrentlyUser, idUserBlocked);
        return "redirect:/profile/" + idUserBlocked;
    }
    
}
