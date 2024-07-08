package com.network.SocialNetwork.controller;

import com.network.SocialNetwork.eenum.Status;
import com.network.SocialNetwork.entity.FriendBlock;
import com.network.SocialNetwork.entity.FriendRequest;
import com.network.SocialNetwork.entity.User;
import com.network.SocialNetwork.repository.FriendBlockRepository;
import com.network.SocialNetwork.repository.FriendRequestRepository;
import com.network.SocialNetwork.repository.UserRepository;
import com.network.SocialNetwork.service.FriendBlockService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;

import java.util.*;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private FriendRequestRepository friendRequestRepository;

    @Autowired
    private FriendBlockService friendBlockService;

    @Autowired
    private FriendBlockRepository friendBlockRepository;

    public String GetUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

    // Để chuyển đổi các tab about/ photos/ friends mà ko reload trang
    @GetMapping("/profileTab/{idUserChosen}")
    public String ProfileTab(@RequestParam(name = "tab", required = false, defaultValue = "tab1") String tab,
            Model model, @PathVariable Long idUserChosen) 
    {
        Long idUsercurrently = null;
        List<Long> listIdFriendUser = new ArrayList<>();
        List<User> listInfoFriendUserChosen = new ArrayList<>();
        
        var getListFriend = friendRequestRepository.getListFriend(idUserChosen);
        // Lấy IdUserFriend
        for (FriendRequest idFriendUser : getListFriend) {
            if(idFriendUser.getRequester().getId().equals(idUserChosen))
            {
                listIdFriendUser.add(idFriendUser.getAddressee().getId());
            }
            else
            {
                listIdFriendUser.add(idFriendUser.getRequester().getId());
            }
        }

        // Lấy thông tin User
        for (Long friendId : listIdFriendUser) {
            Optional<User> friendUserOptional = userRepository.findById(friendId);
            friendUserOptional.ifPresent(listInfoFriendUserChosen::add);
        }

        switch (tab) {
            case "timeline":
                return "profile :: contentFragment";
            case "about":
                Optional<User> userChosen =  userRepository.findById(idUserChosen);
                userChosen.ifPresent(value -> model.addAttribute("userChosen", value));
                return "about :: contentFragment";
            case "photos":
                return "photos :: contentFragment";
            case "friends":
                model.addAttribute("listInfoFriendUserChosen", listInfoFriendUserChosen);
                return "friends :: contentFragment";
            default:
                return "profile :: contentFragment";
        }
    }

    @GetMapping("/{id}")
    public String UserProfile(@PathVariable Long id, Model model) {

        Long idUser1Currently = null, idUserChosen = null;
        String usernameCurrently = GetUserName();
        Optional<User> currentlyUser = userRepository.findByUsername(usernameCurrently);
        if (currentlyUser.isPresent()) {
            User user1 = currentlyUser.get();
            idUser1Currently = user1.getId();
            model.addAttribute("currentlyUser", user1);
        }

        Optional<User> userChosen = userRepository.findById(id);
        if (userChosen.isPresent()) {
            User user2 = userChosen.get();
            idUserChosen = user2.getId();
            model.addAttribute("userChosen", user2);
        }
        else
        {
            return "redirect:/not-found-error";
        }

        FriendBlock friendBlockFindByURL = friendBlockRepository.findByRequesterAndAddressee(idUserChosen, idUser1Currently);
        if(friendBlockFindByURL != null)
        {
            return "redirect:/not-found-error";
        }

        FriendRequest friendRequest = null;
        friendRequest = friendRequestRepository.findByRequesterAndAddressee(idUser1Currently, idUserChosen);
        if (friendRequest == null) {
            friendRequest = friendRequestRepository.findByRequesterAndAddressee(idUserChosen, idUser1Currently);
        }

        if (friendRequest != null && friendRequest.getStatus().equals(Status.PENDING)) 
        {
            model.addAttribute("checkIfExistInListFriendRequest", "pending");
        } 
        
        else if (friendRequest != null && friendRequest.getStatus().equals(Status.ACCEPTED)) {
            model.addAttribute("checkIfExistInListFriendRequest", "accepted");
        }
        else
        {
            model.addAttribute("checkIfExistInListFriendRequest");
        }

        FriendBlock friendBlock = friendBlockRepository.findByRequesterAndAddressee(idUser1Currently, idUserChosen);
        if(friendBlock == null)
        {
            model.addAttribute("blockFunction",true);
        }
        else if(idUser1Currently == friendBlock.getRequester().getId())
        {
            model.addAttribute("blockFunction",false);
        }
        return "profile";
    }

    @PostMapping("/changeAvatar")
    public String changeAvatar(@RequestParam("avatarFile") MultipartFile avatarFile, BindingResult result,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "redirect:/profile";
        }

        String username = GetUserName();
        Optional<User> optionalUser = userRepository.findByUsername(username);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            if (!avatarFile.isEmpty()) {
                String fileName = StringUtils.cleanPath(avatarFile.getOriginalFilename());
                user.setAvatar(fileName);

                // Lưu ảnh vào thư mục lưu trữ (ví dụ: trong thư mục resources/static/images/)
                String uploadDir = "src/main/resources/static/images/";
                try {
                    Path uploadPath = Paths.get(uploadDir);
                    if (!Files.exists(uploadPath)) {
                        Files.createDirectories(uploadPath);
                    }
                    try (InputStream inputStream = avatarFile.getInputStream()) {
                        Path filePath = uploadPath.resolve(fileName);
                        Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                    } catch (IOException e) {
                        redirectAttributes.addFlashAttribute("message",
                                "Could not save avatar image: " + e.getMessage());
                        return "redirect:/profile";
                    }
                } catch (IOException e) {
                    redirectAttributes.addFlashAttribute("message",
                            "Could not create upload directory: " + e.getMessage());
                    return "redirect:/profile";
                }

                userRepository.save(user);
            }
        }

        redirectAttributes.addFlashAttribute("message", "Avatar updated successfully.");
        return "redirect:/profile";
    }
}
