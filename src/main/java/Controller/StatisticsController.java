package Controller;

import Service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @GetMapping("/statistics")
    public String statistics(
        @RequestParam(value = "brand", required = false) String brand,
        @RequestParam(value = "sort", required = false, defaultValue = "desc") String sort,
        Model model
    ) {
        model.addAttribute("maxPrice", statisticsService.getMaxPrice());
        model.addAttribute("minPrice", statisticsService.getMinPrice());
        model.addAttribute("avgPrice", statisticsService.getAvgPrice());
        model.addAttribute("sumPrice", statisticsService.getSumPrice());
        model.addAttribute("count",    statisticsService.getCount());
        model.addAttribute("brandStats", statisticsService.getStatsByBrand());
        model.addAttribute("brands", statisticsService.getAllBrands());
        model.addAttribute("selectedBrand", brand);
        model.addAttribute("sort", sort);

        if (brand != null && !brand.isEmpty()) {
            model.addAttribute("laptops", statisticsService.getLaptopsByBrand(brand, sort));
        }

        return "statistics";
    }
}