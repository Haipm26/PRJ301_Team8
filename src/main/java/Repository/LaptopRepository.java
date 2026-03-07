/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Repository;

import Model.Laptop;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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

    // Pagination and Sort
    Page<Laptop> findAll(Pageable pageable);

    // Search by criteria (name, brand, color)
    @Query("SELECT l FROM Laptop l WHERE LOWER(l.name) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR LOWER(l.brand) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR LOWER(l.color) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<Laptop> searchLaptops(@Param("keyword") String keyword, Pageable pageable);
}
