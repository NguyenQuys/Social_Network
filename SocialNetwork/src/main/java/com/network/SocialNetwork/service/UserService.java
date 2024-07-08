package com.network.SocialNetwork.service;

import jakarta.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.network.SocialNetwork.eenum.Role;
import com.network.SocialNetwork.entity.User;
import com.network.SocialNetwork.repository.RoleRepository;
import com.network.SocialNetwork.repository.UserRepository;

import java.util.Optional;
import java.util.List;

@Service
@Transactional
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public void save(@NotNull User user, PasswordEncoder passwordEncoder) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        com.network.SocialNetwork.entity.Role userRole = roleRepository.findRoleById(Role.USER.value);
        user.setRole(userRole);
        userRepository.save(user);
    }

    public void saveButNotHash(User user) {
        userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        var user = userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        return org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(user.getPassword())
                .authorities(user.getAuthorities())
                .accountExpired(!user.isAccountNonExpired())
                .accountLocked(!user.isAccountNonLocked())
                .credentialsExpired(!user.isCredentialsNonExpired())
                .disabled(!user.isEnabled())
                .build();
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public Optional<User> findByPhone(String phone) {
        return userRepository.findByPhone(phone);
    }

    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    public List<User> search(String keyword) {
        return userRepository.findByUsernameContainingIgnoreCase(keyword);
    }

    public User registerUser(User user, PasswordEncoder passwordEncoder) throws Exception {
        if (findByUsername(user.getUsername()).isPresent()) {
            throw new Exception("Username already exists");
        }
        if (findByEmail(user.getEmail()).isPresent()) {
            throw new Exception("Email already exists");
        }
        if (findByPhone(user.getPhone()).isPresent()) {
            throw new Exception("Phone number already exists");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        com.network.SocialNetwork.entity.Role userRole = roleRepository.findRoleById(Role.USER.value);
        user.setRole(userRole);
        return userRepository.save(user);
    }
}
