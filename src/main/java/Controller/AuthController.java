
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.User;
import Service.UserService;
import Utils.RoleEnum;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Pham Minh Hai
 */
@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String showLoginPage(
            @CookieValue(value = "savedUsername", defaultValue = "") String savedUsername,
            Model model) {

        // Send the cookie value to the JSP value="${prefilledUsername}"
        model.addAttribute("prefilledUsername", savedUsername);
        return "user/login";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam(value = "rememberMe", required = false) String rememberMe,
            HttpServletResponse response,
            HttpSession session,
            Model model) {

        User user = this.userService.handleLogin(username, password);

        if (user != null) {
            session.setAttribute("user", user);

            // --- Remember Me Logic ---
            Cookie cookie = new Cookie("savedUsername", username);
            if (rememberMe != null) {
                // Save for 7 days (7 days * 24 hours * 60 mins * 60 secs)
                cookie.setMaxAge(7 * 24 * 60 * 60);
            } else {
                // Delete the cookie if not checked
                cookie.setMaxAge(0);
            }
            cookie.setPath("/"); // Important: makes cookie available on all pages
            response.addCookie(cookie);

            return "redirect:/";
        }

        model.addAttribute("error", "Invalid username or password");
        return "user/login";
    }

    @GetMapping("/register")
    public String showRegistrationPage(Model model) {
        model.addAttribute("newUser", new User()); // Binding object
        return "user/register"; // Points to /WEB-INF/views/user/register.jsp
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("newUser") User user, Model model) {
        // Set default role for new sign-ups
        
       if (this.userService.findByUsername(user.getUsername()) != null){
           model.addAttribute("errorText", "Username have been used");
           return "user/register";
       } 
        
        user.setRole(RoleEnum.ROLE_USER);

        // Save to DB via service
        this.userService.handleCreateUser(user);

        return "redirect:/login"; // Send them to login after signing up
    }

    @GetMapping("/logout")
    public String handleLogout(HttpSession session) {
        // 1. Clear all data from the session (user object, etc.)
        session.invalidate();

        // 2. Send the user back to the login page or home page
        return "redirect:/login";
    }

    @GetMapping("/change-password")
    public String showChangePasswordPage(HttpSession session) {
        // Security Check: If not logged in, send to login page
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        return "user/change-password";
    }

    @PostMapping("/change-password")
    public String handleChangePassword(@RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpSession session,
            Model model) {
        User currentUser = (User) session.getAttribute("user");

        if (currentUser != null && "ADMIN".equalsIgnoreCase(currentUser.getUsername())) {
            model.addAttribute("error", "The master ADMIN account is protected and its password cannot be changed.");
            return "user/change-password";
        }
        
        // 1. Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "New passwords do not match!");
            return "user/change-password";
        }

        // 2. Verify old password
        if (!currentUser.getPassword().equals(oldPassword)) {
            model.addAttribute("error", "Current password is incorrect!");
            return "user/change-password";
        }

        // 3. Update password in the object and database
        currentUser.setPassword(newPassword);
        this.userService.handleUpdateUser(currentUser);

        model.addAttribute("message", "Password updated successfully!");
        return "user/change-password";
    }
}
