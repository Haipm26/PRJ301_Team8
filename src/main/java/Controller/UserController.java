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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import java.util.Base64;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/users")
    public String getAllUsers(Model model) {
        model.addAttribute("users", this.userService.handleGetAllUsers());
        return "user/list";
    }

    @PostMapping("/users/create")
    public String createUser(@ModelAttribute User user) {
        if (user.getRole() == null) {
            user.setRole(RoleEnum.ROLE_USER);
        }
        this.userService.handleCreateUser(user);
        return "redirect:/users";
    }

    @GetMapping("/users/update/{id}")
    public String getUpdateUserPage(@PathVariable("id") Long id, Model model) {
        User user = this.userService.handleGetUserById(id);
        model.addAttribute("user", user);
        return "user/updateUser";
    }

    @PostMapping("/users/update")
    public String updateUser(@ModelAttribute User user) {
        this.userService.handleUpdateUser(user);
        return "redirect:/users/manage";
    }

    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        this.userService.handleDeleteUser(id);
        return "redirect:/users/manage";
    }

    @GetMapping("/users/manage")
    public String showManageUsers(Model model) {
        model.addAttribute("users", this.userService.handleGetAllUsers());
        return "user/listUser";
    }

    @GetMapping("/users/promote/{id}")
    public String promoteUser(@PathVariable("id") Long id) {
        User user = this.userService.handleGetUserById(id);
        if (user != null) {
            user.setRole(RoleEnum.ROLE_ADMIN);
            this.userService.handleUpdateUser(user);
        }
        return "redirect:/users/manage";
    }

    @GetMapping("/users/demote/{id}")
    public String demoteUser(@PathVariable("id") Long id) {
        User user = this.userService.handleGetUserById(id);
        if (user != null && "ADMIN".equals(user.getUsername())) {
            return "redirect:/users/manage?error=protected";
        }
        if (user != null) {
            user.setRole(RoleEnum.ROLE_USER);
            this.userService.handleUpdateUser(user);
        }
        return "redirect:/users/manage";
    }

    @GetMapping("/profile")
    public String showProfilePage(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return "redirect:/login";
        }
        // Refresh từ DB để lấy avatar mới nhất
        User freshUser = this.userService.handleGetUserById(currentUser.getId());
        session.setAttribute("user", freshUser);
        model.addAttribute("userProfile", freshUser);
        return "user/profileUser";
    }

    // ===================== AVATAR UPLOAD =====================
    @PostMapping("/profile/update-avatar")
    public String updateAvatar(@RequestParam("avatarFile") MultipartFile file,
            HttpSession session,
            Model model) {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return "redirect:/login";
        }
        try {
            if (!file.isEmpty()) {
                String contentType = file.getContentType();
                String base64 = Base64.getEncoder().encodeToString(file.getBytes());
                String avatarData = "data:" + contentType + ";base64," + base64;
                currentUser.setAvatar(avatarData);
                this.userService.handleUpdateUser(currentUser);
                session.setAttribute("user", currentUser);
            }
        } catch (Exception e) {
            model.addAttribute("error", "Failed to upload image. Please try again.");
            model.addAttribute("userProfile", currentUser);
            return "user/profileUser";
        }
        return "redirect:/profile";
    }
}
