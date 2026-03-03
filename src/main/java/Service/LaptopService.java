/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Model.Laptop;
import Repository.LaptopRepository;
import java.util.List;
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
    
    public void handleCreateLaptop(Laptop laptop){
        this.laptopRepository.save(laptop);
    }
    
    public List<Laptop> handleGetAllLaptops() {
        return this.laptopRepository.findAll();
    }

    public Laptop handleGetLaptopById(Long id) {
        return this.laptopRepository.findById(id).orElse(null);
    }

    public void handleDeleteLaptop(Long id) {
        this.laptopRepository.deleteById(id);
    }

    public void handleUpdateLaptop(Laptop laptop) {
        this.laptopRepository.save(laptop);
    }
}
