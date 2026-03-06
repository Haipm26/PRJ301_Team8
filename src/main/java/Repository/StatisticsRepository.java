package Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import Model.Laptop;
import java.util.List;

@Repository
public interface StatisticsRepository extends JpaRepository<Laptop, Long> {

    @Query("SELECT MAX(l.price) FROM Laptop l")
    Double findMaxPrice();

    @Query("SELECT MIN(l.price) FROM Laptop l")
    Double findMinPrice();

    @Query("SELECT AVG(l.price) FROM Laptop l")
    Double findAvgPrice();

    @Query("SELECT SUM(l.price) FROM Laptop l")
    Double findSumPrice();

    @Query("SELECT COUNT(l) FROM Laptop l")
    Long findCount();

    @Query("SELECT l.brand, COUNT(l), MAX(l.price), MIN(l.price), AVG(l.price) FROM Laptop l GROUP BY l.brand ORDER BY AVG(l.price) DESC")
    List<Object[]> findStatsByBrand();
}