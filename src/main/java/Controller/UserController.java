/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.User;
import Service.UserService;
import Utils.RoleEnum;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Pham Minh Hai
 */
@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // Displays the list of all users
    @GetMapping("/users")
    public String getAllUsers(Model model) {
        model.addAttribute("users", this.userService.handleGetAllUsers());
        return "user/list"; 
    }

    // Handles the form submission to create a new user
    @PostMapping("/users/create")
    public String createUser(@ModelAttribute User user) {
        // Defaulting new users to a specific role if not selected
        if (user.getRole() == null) {
            user.setRole(RoleEnum.ROLE_USER);
        }
        this.userService.handleCreateUser(user);
        return "redirect:/users";
    }

    // Fetches a user and opens the update page
    @GetMapping("/users/update/{id}")
    public String getUpdateUserPage(@PathVariable("id") Long id, Model model) {
        User user = this.userService.handleGetUserById(id);
        model.addAttribute("user", user);
        return "user/update";
    }

    // Handles the actual update logic
    @PostMapping("/users/update")
    public String updateUser(@ModelAttribute User user) {
        this.userService.handleUpdateUser(user);
        return "redirect:/users";
    }

    // Deletes a user by ID
    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        this.userService.handleDeleteUser(id);
        return "redirect:/users";
    }
}
