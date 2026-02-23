/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Laptop;
import Service.LaptopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        @RequestParam("storage") String storage,
        @RequestParam("featured") boolean featured) 
    {
        System.out.println(">>> SERVER RECEIVED: " + name);
        Laptop laptop = new Laptop();
        laptop.setName(name);
        laptop.setBrand(brand);
        laptop.setPrice(price);
        laptop.setStorage(storage);
        laptop.setIsFeatured(featured);

        this.laptopService.handleCreateLaptop(laptop);
        return "redirect:/"; 
    }
}
