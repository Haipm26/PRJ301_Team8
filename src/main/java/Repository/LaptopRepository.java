/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Repository;

import Model.Laptop;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Pham Minh Hai
 */
@Repository
public interface LaptopRepository extends JpaRepository<Laptop, Long> {
    List<Laptop> findByIsFeaturedTrue();
    List<Laptop> findByIsNewArrivalTrue();
    List<Laptop> findByBrand(String brand);
}
