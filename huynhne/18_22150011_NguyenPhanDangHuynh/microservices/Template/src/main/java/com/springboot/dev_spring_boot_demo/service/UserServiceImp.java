package com.springboot.dev_spring_boot_demo.service;

import com.springboot.dev_spring_boot_demo.dao.UserDAO;
import com.springboot.dev_spring_boot_demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImp implements UserService {

    private final UserDAO userDAO;
    private final PasswordEncoder passwordEncoder;
    private final UserDetailsManager userDetailsManager;

    @Autowired
    public UserServiceImp(UserDAO userDAO, PasswordEncoder passwordEncoder, UserDetailsManager userDetailsManager) {
        this.userDAO = userDAO;
        this.passwordEncoder = passwordEncoder;
        this.userDetailsManager = userDetailsManager;
    }

    @Override
    public List<User> getAllUsers() {
        return userDAO.findAll();
    }

    @Override
    public User getUserByUsername(String username) {
        return userDAO.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found with username: " + username));
    }
    
    /**
     * Prepares the user's password before saving:
     * 1. For new users, encodes the provided password
     * 2. For existing users, keeps the current password if the new one is empty
     */
    private void preparePassword(User user) {
        // Check if it's an existing user (skip for new users)
        boolean isExistingUser = userDAO.existsByUsername(user.getUsername());
        
        if (isExistingUser) {
            // For updates, get existing user to compare
            User existingUser = getUserByUsername(user.getUsername());
            
            // If password hasn't been changed or is empty, use existing password
            // This helps bypass validation for update operations
            if (user.getPassword() == null || user.getPassword().isEmpty()) {
                user.setPassword(existingUser.getPassword());
            } else {
                // Only encode if password is not empty and has been changed
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
        } else {
            // For new users, always encode the password
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
        }
    }

    @Override
    @Transactional
    public void save(User user, List<String> roles) {
        preparePassword(user);
        user.setEnabled(true);

        user.setRoles(new HashSet<>(roles.stream()
                .map(role -> role.startsWith("ROLE_") ? role : "ROLE_" + role.toUpperCase())
                .collect(Collectors.toSet())));

        userDAO.save(user);
    }

    @Override
    @Transactional
    public void updateUserRole(String username, String role, boolean hasRole) {
        User user = getUserByUsername(username);
        String roleWithPrefix = role.startsWith("ROLE_") ? role : "ROLE_" + role.toUpperCase();

        if (hasRole) {
            user.getRoles().add(roleWithPrefix);
        } else {
            user.getRoles().remove(roleWithPrefix);
        }
        userDAO.save(user);
    }

    @Override
    public void deleteUser(String username) {
        userDAO.deleteByUsername(username);
    }

    @Override
    public long countUsers() {
        return userDAO.count();
    }

    @Override
    public boolean existsByUsername(String username) {
        return userDAO.existsByUsername(username);
    }
}
