package Controller;

import Model.Laptop;
import Model.OrderDetail;
import Model.User;
import Service.LaptopService;
import Service.OrderService;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Pham Minh Hai
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private LaptopService laptopService;

    private User getCurrentUser(HttpSession session) {
        // Assume user is stored in session as "loggedInUser"
        return (User) session.getAttribute("loggedInUser");
    }

    @GetMapping
    public String viewCart(Model model, HttpSession session) {
        User user = getCurrentUser(session);
        if (user == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        List<OrderDetail> cartItems = orderService.getCartItems(user);

        double totalAmount = 0;
        for (OrderDetail item : cartItems) {
            totalAmount += item.getPrice();
        }

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalAmount", totalAmount);
        return "cart"; // Looks for /WEB-INF/views/cart.jsp
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam("laptopId") Long laptopId,
            @RequestParam("quantity") int quantity,
            HttpSession session) {
        User user = getCurrentUser(session);
        if (user == null) {
            return "redirect:/login";
        }

        Laptop laptop = laptopService.getLaptopById(laptopId); // Assuming we have this
        if (laptop != null) {
            orderService.addToCart(user, laptop, quantity);
        }

        return "redirect:/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam("orderDetailId") Long orderDetailId,
            @RequestParam("quantity") int quantity,
            HttpSession session) {
        User user = getCurrentUser(session);
        if (user != null) {
            orderService.updateCartItem(orderDetailId, quantity);
        }
        return "redirect:/cart";
    }

    @GetMapping("/remove")
    public String removeFromCart(@RequestParam("orderDetailId") Long orderDetailId,
            HttpSession session) {
        User user = getCurrentUser(session);
        if (user != null) {
            orderService.removeFromCart(orderDetailId);
        }
        return "redirect:/cart";
    }

    @PostMapping("/checkout")
    public String checkout(HttpSession session, Model model) {
        User user = getCurrentUser(session);
        if (user != null) {
            orderService.checkout(user);
            model.addAttribute("message", "Checkout successful!");
        }
        return "redirect:/cart";
    }
}
