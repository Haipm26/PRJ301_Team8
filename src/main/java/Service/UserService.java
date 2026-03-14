
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Model.User;
import Repository.UserRepository;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Pham Minh Hai
 */
@Service
public class UserService {
    
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    public void handleCreateUser(User user) {
        // In a real project, you would hash the password here before saving
        this.userRepository.save(user);
    }
    
    public List<User> handleGetAllUsers() {
        return this.userRepository.findAll();
    }

    public User handleGetUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }

    public void handleDeleteUser(Long id) {
        this.userRepository.deleteById(id);
    }

    public void handleUpdateUser(User user) {
        this.userRepository.save(user);
    }
    
    public User findByUsername(String username){
        return this.userRepository.findByUsername(username);
    }
    
    public User handleLogin(String username, String password) {
    // Find by username using the repository we discussed
        User user = this.userRepository.findByUsername(username);

        // Check if user exists and password matches (Hashing comes later!)
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

}

