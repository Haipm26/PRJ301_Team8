/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Model.Laptop;
import Repository.LaptopRepository;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 *
 * @author Pham Minh Hai
 */
@Service
public class LaptopService {

    private LaptopRepository laptopRepository;

    public LaptopService(LaptopRepository laptopRepository) {
        this.laptopRepository = laptopRepository;
    }

    public void handleCreateLaptop(Laptop laptop) {
        this.laptopRepository.save(laptop);
    }

    public List<Laptop> handleGetAllLaptops() {
        return this.laptopRepository.findAll();
    }

    public Laptop handleGetLaptopById(Long id) {
        return this.laptopRepository.findById(id).orElse(null);
    }

    public Laptop getLaptopById(Long id) {
        return handleGetLaptopById(id);
    }

    public void handleDeleteLaptop(Long id) {
        this.laptopRepository.deleteById(id);
    }

    public void handleUpdateLaptop(Laptop laptop) {
        this.laptopRepository.save(laptop);
    }

    public List<Laptop> getFeaturedLaptops() {
        return laptopRepository.findByIsFeaturedTrue();
    }

    public List<Laptop> getLaptopsByBrand(String brand) {
        return laptopRepository.findByBrand(brand);
    }

    public List<Laptop> getNewArrivals() {
        return laptopRepository.findByIsNewArrivalTrue();
    }

    public List<Laptop> getBestSellingLaptops() {
        // Without an elaborate order history grouping in DB, we can just return a fixed
        // list or reuse featured
        // Or if we have a top 5, we can do it. For now, let's just return a placeholder
        // (e.g., all laptops, limit 5)
        // Spring Data JPA doesn't have a direct "find top 5" without ordering.
        // Let's just return a few featured ones as "Best Selling" for UI demonstration
        return laptopRepository.findByIsFeaturedTrue();
    }

    public Page<Laptop> getAllLaptopsPageable(Pageable pageable) {
        return laptopRepository.findAll(pageable);
    }

    public Page<Laptop> searchLaptops(String keyword, Pageable pageable) {
        return laptopRepository.searchLaptops(keyword, pageable);
    }
}
