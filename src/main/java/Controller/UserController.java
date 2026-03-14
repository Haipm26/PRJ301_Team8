/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.User;
import Service.UserService;
import Utils.RoleEnum;
import jakarta.servlet.http.HttpSession;
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
        return "user/updateUser";
    }

    // Handles the actual update logic
    @PostMapping("/users/update")
    public String updateUser(@ModelAttribute User user) {
        this.userService.handleUpdateUser(user);
        return "redirect:/users/manage";
    }

    // Deletes a user by ID
    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        this.userService.handleDeleteUser(id);
        return "redirect:/users/manage";
    }
    
    // redirect sang listUser
    @GetMapping("/users/manage")
    public String showManageUsers(Model model) {
        // Fetch all users from database
        model.addAttribute("users", this.userService.handleGetAllUsers());
        return "user/listUser"; 
    }

    // Promote User to ADMIN
    @GetMapping("/users/promote/{id}")
    public String promoteUser(@PathVariable("id") Long id) {
        User user = this.userService.handleGetUserById(id);
        if (user != null) {
            user.setRole(RoleEnum.ROLE_ADMIN); // Using your Utils Enum
            this.userService.handleUpdateUser(user);
        }
        return "redirect:/users/manage";
    }
    
    @GetMapping("/users/demote/{id}")
    public String demoteUser(@PathVariable("id") Long id) {
        User user = this.userService.handleGetUserById(id);
        
        if (user != null && "ADMIN".equals(user.getUsername())) {
            // Skip demotion for the main admin
            return "redirect:/users/manage?error=protected";
        }
        
        if (user != null) {
            // Change role back to standard User
            user.setRole(RoleEnum.ROLE_USER); 
            this.userService.handleUpdateUser(user);
        }
        return "redirect:/users/manage";
    }
    
    
    @GetMapping("/profile")
    public String showProfilePage(HttpSession session, Model model) {
        // 1. Get the current user from the session
        User currentUser = (User) session.getAttribute("user");

        // 2. Safety Check: If session expired or not logged in, go to login
        if (currentUser == null) {
            return "redirect:/login";
        }

        // 3. Send the user object to the JSP
        model.addAttribute("userProfile", currentUser);
        return "user/profileUser"; // Path: /WEB-INF/views/user/profileUser.jsp
    }
    
    
    // 1. Show the self-update page
    @GetMapping("/profile/edit")
    public String showSelfUpdatePage(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return "redirect:/login";
        }

        // Protection check for master account
        if ("ADMIN".equalsIgnoreCase(currentUser.getUsername())) {
            return "redirect:/profile?error=protected";
        }

        model.addAttribute("user", currentUser);
        return "user/self-update"; 
    }

    // 2. Handle the self-update logic
    @PostMapping("/profile/update")
    public String handleSelfUpdate(@ModelAttribute("user") User updateData, HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("user");
        
        String phoneRegex = "^0[0-9]{9}$";
        if (updateData.getPhone() != null && !updateData.getPhone().matches(phoneRegex)) {
            model.addAttribute("error", "Invalid phone number! It must be 10 digits starting with 0.");
            model.addAttribute("user", updateData); 
            return "user/self-update";
        }
        
        // Security: Block master account and ensure user only updates themselves
        if (currentUser == null || "ADMIN".equalsIgnoreCase(currentUser.getUsername())) {
            return "redirect:/profile";
        }

        // Map allowed fields from the form to the session user
        currentUser.setName(updateData.getName());
        currentUser.setPhone(updateData.getPhone());
        currentUser.setAddress(updateData.getAddress());
        currentUser.setGender(updateData.getGender());

        // Save to Database
        this.userService.handleUpdateUser(currentUser);

        // Sync the session so the UI updates (name in navbar, etc.)
        session.setAttribute("user", currentUser);

        return "redirect:/profile";
    }
}
