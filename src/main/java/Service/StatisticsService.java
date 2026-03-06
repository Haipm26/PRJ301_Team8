package Service;

import Repository.StatisticsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
}