/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Repository.LaptopRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



/**
 *
 * @author Pham Minh Hai
 */
@Controller
public class HomeController {

    @Autowired
    private LaptopRepository laptopRepo;

    @GetMapping("/")
    public String showHomePage(Model model) {
        
        model.addAttribute("laptops", laptopRepo.findAll());
        model.addAttribute("message", "Welcome to our Laptop Store!");
        
        return "index"; // Looks for /WEB-INF/views/index.jsp
    }
}
