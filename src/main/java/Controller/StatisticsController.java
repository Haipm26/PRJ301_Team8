package Controller;

import Service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @GetMapping("/statistics")
    public String statistics(Model model) {
        model.addAttribute("maxPrice", statisticsService.getMaxPrice());
        model.addAttribute("minPrice", statisticsService.getMinPrice());
        model.addAttribute("avgPrice", statisticsService.getAvgPrice());
        model.addAttribute("sumPrice", statisticsService.getSumPrice());
        model.addAttribute("count",    statisticsService.getCount());
        model.addAttribute("brandStats", statisticsService.getStatsByBrand());
        return "statistics";
    }
}