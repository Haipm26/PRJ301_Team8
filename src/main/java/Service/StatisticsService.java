package Service;

import Repository.StatisticsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Model.Laptop;
import java.util.List;

@Service
public class StatisticsService {

    @Autowired
    private StatisticsRepository statisticsRepository;

    public Double getMaxPrice() { return statisticsRepository.findMaxPrice(); }
    public Double getMinPrice() { return statisticsRepository.findMinPrice(); }
    public Double getAvgPrice() { return statisticsRepository.findAvgPrice(); }
    public Double getSumPrice() { return statisticsRepository.findSumPrice(); }
    public Long getCount()      { return statisticsRepository.findCount(); }
    public List<Object[]> getStatsByBrand() { return statisticsRepository.findStatsByBrand(); }
    public List<String> getAllBrands() { return statisticsRepository.findAllBrands(); }

    public List<Laptop> getLaptopsByBrand(String brand, String sort) {
        if ("asc".equals(sort)) {
            return statisticsRepository.findByBrandOrderByPriceAsc(brand);
        }
        return statisticsRepository.findByBrandOrderByPriceDesc(brand);
    }
}