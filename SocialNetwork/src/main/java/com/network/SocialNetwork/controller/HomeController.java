package com.network.SocialNetwork.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.network.SocialNetwork.eenum.Status;
import com.network.SocialNetwork.entity.FriendBlock;
import com.network.SocialNetwork.entity.FriendRequest;
import com.network.SocialNetwork.entity.Statistic;
import com.network.SocialNetwork.entity.User;
import com.network.SocialNetwork.repository.FriendBlockRepository;
import com.network.SocialNetwork.repository.FriendRequestRepository;
import com.network.SocialNetwork.repository.StatisticRepository;
import com.network.SocialNetwork.repository.UserRepository;
import com.network.SocialNetwork.service.UserService;

@Controller
@RequestMapping
public class HomeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private FriendRequestRepository friendRequestRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private FriendBlockRepository friendBlockRepository;

    @Autowired
    private StatisticRepository statisticRepository;

    public String GetUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

    @GetMapping
    public String home(Model model) {

        Long idUserCurrently = null;
        List<Long> listIdFriendUser = new ArrayList<>();
        List<User> listInfoFriendCurrently = new ArrayList<>();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()
                && !(authentication instanceof AnonymousAuthenticationToken)) {
            Optional<User> optionalUser = userRepository.findByUsername(authentication.getName());
            if (optionalUser.isPresent()) {
                User currentlyUser = optionalUser.get();
                idUserCurrently = currentlyUser.getId();
                model.addAttribute("currentlyUser", currentlyUser);

                List<FriendRequest> friendRequestList = friendRequestRepository
                        .findAllAddFriendRequestToUser(idUserCurrently);
                friendRequestList
                        .removeIf(m -> m.getStatus().equals(Status.ACCEPTED) || m.getStatus().equals(Status.REJECTED));
                model.addAttribute("amountFriendRequests", friendRequestList.size());

                User userChosen = optionalUser.get();
                model.addAttribute("userChosen", userChosen);
                userChosen.setActiveStatus(true);
                userRepository.save(userChosen);

                Statistic newsStatistic = new Statistic();
                newsStatistic.setVisitors(idUserCurrently);
                newsStatistic.setVisitAt(LocalDate.now());
                statisticRepository.save(newsStatistic);

                var getListFriend = friendRequestRepository.getListFriend(idUserCurrently);

                // Lấy IdUserFriend
                for (FriendRequest idFriendUser : getListFriend) {
                    if (idFriendUser.getRequester().getId().equals(idUserCurrently)) {
                        listIdFriendUser.add(idFriendUser.getAddressee().getId());
                    } else {
                        listIdFriendUser.add(idFriendUser.getRequester().getId());
                    }
                }

                // Lấy thông tin User
                for (Long friendId : listIdFriendUser) {
                    Optional<User> friendUserOptional = userRepository.findById(friendId);
                    friendUserOptional.ifPresent(listInfoFriendCurrently::add);
                }

                model.addAttribute("listInfoFriendCurrently", listInfoFriendCurrently);

                return "index";
            }
        }
        return "redirect:/login";
    }

    // Để xuất ra kết quả tìm kiếm
    @GetMapping("/search")
    public String searchProducts(@RequestParam("query") String query, Model model) {
        String username = GetUserName();
        Optional<User> currentlyUserOpt = userRepository.findByUsername(username);
        currentlyUserOpt.ifPresent(value -> model.addAttribute("currentlyUser", value));

        model.addAttribute("query", query);

        if (currentlyUserOpt.isPresent()) {
            User currentlyUser = currentlyUserOpt.get();
            Long idCurrentlyUser = currentlyUser.getId();

            List<FriendBlock> friendBlockList = friendBlockRepository.findByAddressee(idCurrentlyUser);

            List<Long> blockedRequesterIds = friendBlockList.stream()
                    .map(friendBlock -> friendBlock.getRequester().getId())
                    .collect(Collectors.toList());

            List<User> userResults = userService.search(query);

            userResults.removeIf(user -> user.getId().equals(currentlyUser.getId()) ||
                    user.getRole().getName().equals("ADMIN") ||
                    blockedRequesterIds.contains(user.getId()));

            model.addAttribute("usersResult", userResults);
        } else {
            model.addAttribute("usersResult", Collections.emptyList());
        }

        return "users/search-list-result";
    }

    // Để xuất ra kết quả tìm kiếm nhưng ghi đè lên ở trang Home
    @GetMapping("/search-override")
    public ResponseEntity<List<User>> searchUsers(
            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
        List<User> users = userService.search(keyword);
        return ResponseEntity.ok(users);
    }

    @GetMapping("/add-friend-request-list")
    public String AddFriendRequestList(Model model) {
        Long idUserCurrently = null;
        // Navigation Bar
        String username = GetUserName();
        Optional<User> currentlyUserOpt = userRepository.findByUsername(username);
        if (currentlyUserOpt.isPresent()) {
            User user = currentlyUserOpt.get();
            idUserCurrently = user.getId();
            model.addAttribute("currentlyUser", user);
        }

        List<FriendRequest> friendRequestList = friendRequestRepository.findAllAddFriendRequestToUser(idUserCurrently);
        friendRequestList.removeIf(m -> m.getStatus().equals(Status.ACCEPTED));
        model.addAttribute("friendRequestList", friendRequestList);
        return "users/list-friend-request";
    }

    // --------------------ERROR AREA STARTS------------------------------
    @GetMapping("/403_error")
    public String Error403() {
        return "errors/403_error";
    }

    @GetMapping("/not-found-error")
    public String NotFoundError() {
        return "errors/notFound_error";

    }
    // --------------------ERROR AREA ENDS------------------------------
}
