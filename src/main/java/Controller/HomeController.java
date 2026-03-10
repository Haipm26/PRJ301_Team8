/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Laptop;
import Service.LaptopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Pham Minh Hai
 */
@Controller
public class HomeController {

    @Autowired
    private LaptopService laptopService;

    @GetMapping("/")
    public String showHomePage(
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "size", defaultValue = "8") int size,
            @RequestParam(name = "sort", defaultValue = "id") String sortField,
            @RequestParam(name = "dir", defaultValue = "asc") String sortDir,
            Model model) {

        Sort sort = sortDir.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending()
                : Sort.by(sortField).descending();
        Pageable pageable = PageRequest.of(page - 1, size, sort);

        Page<Laptop> laptopPage;
        if (keyword != null && !keyword.isEmpty()) {
            laptopPage = laptopService.searchLaptops(keyword, pageable);
            model.addAttribute("keyword", keyword);
        } else {
            laptopPage = laptopService.getAllLaptopsPageable(pageable);
        }

        // Add categories (Featured, New, Best Selling)
        model.addAttribute("featuredLaptops", laptopService.getFeaturedLaptops());
        model.addAttribute("newArrivals", laptopService.getNewArrivals());
        model.addAttribute("bestSelling", laptopService.getBestSellingLaptops());

        model.addAttribute("laptops", laptopPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", laptopPage.getTotalPages());
        model.addAttribute("totalItems", laptopPage.getTotalElements());

        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        model.addAttribute("message", "Welcome to our Laptop Store!");

        return "index"; // Looks for /WEB-INF/views/index.jsp
    }

}
