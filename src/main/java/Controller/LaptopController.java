/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Laptop;
import Service.LaptopService;
import java.io.IOException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Pham Minh Hai
 */
@Controller
public class LaptopController {
    private LaptopService laptopService;

    public LaptopController(LaptopService laptopService) {
        this.laptopService = laptopService;
    }
    
    @PostMapping("/laptops")
    public String createLaptop(
        @RequestParam("name") String name,
        @RequestParam("brand") String brand,
        @RequestParam("price") double price,
        @RequestParam("cpu") String cpu,
        @RequestParam("ram") String ram, 
        @RequestParam("storage") String storage,
        @RequestParam("color") String color,
        @RequestParam("imageFile") MultipartFile file,
        @RequestParam("featured") boolean isFeatured,
        @RequestParam("newArrival") boolean isNewArrival,
        @RequestParam("description") String description
    ) 
    {

        System.out.println(">>> SERVER RECEIVED: " + name);
        Laptop laptop = new Laptop();
        laptop.setName(name);
        laptop.setBrand(brand);
        laptop.setPrice(price);
        laptop.setStorage(storage);
        laptop.setColor(color);
        laptop.setCpu(cpu);
        laptop.setRam(ram);
        
        String base64;
        try {
            base64 = Base64.getEncoder().encodeToString(file.getBytes());
            laptop.setImage(base64);
        } catch (IOException ex) {
            System.out.println("loi lay anh");;
        }
        
        laptop.setDescription(description);
        laptop.setIsFeatured(isFeatured);
        laptop.setIsNewArrival(isNewArrival);

        this.laptopService.handleCreateLaptop(laptop);
        return "redirect:/"; 
    }
    
    @GetMapping("/laptops/{id}")
    public String getLaptop(@PathVariable("id") Long id, Model model) {
        Laptop laptop = this.laptopService.handleGetLaptopById(id);
        model.addAttribute("laptop", laptop);
        return "detailLaptop"; // You would need a detail.jsp for this
    }
    
    @GetMapping("/laptops/delete/{id}")
    public String deleteLaptop(@PathVariable("id") Long id) {
        this.laptopService.handleDeleteLaptop(id);
        return "redirect:/";
    }
    
    // UPDATE goi den trang update jsp de update
    @GetMapping("/laptops/update/{id}")
    public String getUpdatePage(@PathVariable("id") Long id, Model model) {
        Laptop currentLaptop = this.laptopService.handleGetLaptopById(id);
        model.addAttribute("laptop", currentLaptop);
        return "updateLaptop"; // You will need a update.jsp
    }

    // UPDATE logic
    @PostMapping("/laptops/update")
    public String updateLaptop(@ModelAttribute Laptop laptop, 
                               @RequestParam("imageFile") MultipartFile file) {
        try {
            if (!file.isEmpty()) {
                String base64 = Base64.getEncoder().encodeToString(file.getBytes());
                laptop.setImage(base64);
            } else {
                // If no new image uploaded, keep the old one
                Laptop oldLaptop = this.laptopService.handleGetLaptopById(laptop.getId());
                laptop.setImage(oldLaptop.getImage());
            }
        } catch (IOException ex) {
            System.out.println("Error updating image");
        }
        this.laptopService.handleUpdateLaptop(laptop);
        return "redirect:/";
    }
}
