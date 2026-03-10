package Controller;

import Model.Laptop;
import Model.OrderDetail;
import Model.User;
import Service.LaptopService;
import Service.OrderService;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    // Helper to get or create cart
    private List<OrderDetail> getSessionCart(HttpSession session) {
        List<OrderDetail> cart = (List<OrderDetail>) session.getAttribute("cartItems");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cartItems", cart);
        }
        return cart;
    }

    private void updateCartCount(HttpSession session, List<OrderDetail> cart) {
        int count = 0;
        for (OrderDetail item : cart) {
            count += item.getQuantity();
        }
        session.setAttribute("cartCount", count);
    }

    @GetMapping
    public String viewCart(Model model, HttpSession session) {
        List<OrderDetail> cartItems = getSessionCart(session);

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
        List<OrderDetail> cart = getSessionCart(session);
        Laptop laptop = laptopService.getLaptopById(laptopId);

        if (laptop != null) {
            boolean found = false;
            for (OrderDetail item : cart) {
                if (item.getLaptop().getId() == laptop.getId()) {
                    item.setQuantity(item.getQuantity() + quantity);
                    item.setPrice(item.getQuantity() * laptop.getPrice());
                    found = true;
                    break;
                }
            }

            if (!found) {
                OrderDetail newItem = new OrderDetail();
                // Assign temporary ID based on laptop ID to locate it for updates/removes
                newItem.setId(laptop.getId());
                newItem.setLaptop(laptop);
                newItem.setQuantity(quantity);
                newItem.setPrice(laptop.getPrice() * quantity);
                cart.add(newItem);
            }
        }

        session.setAttribute("cartItems", cart);
        updateCartCount(session, cart);

        return "redirect:/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam("orderDetailId") Long laptopId,
            @RequestParam("quantity") int quantity,
            HttpSession session) {
        List<OrderDetail> cart = getSessionCart(session);
        for (OrderDetail item : cart) {
            if (item.getLaptop().getId() == laptopId) {
                if (quantity > 0) {
                    item.setQuantity(quantity);
                    item.setPrice(item.getLaptop().getPrice() * quantity);
                } else {
                    cart.remove(item);
                }
                break;
            }
        }
        session.setAttribute("cartItems", cart);
        updateCartCount(session, cart);
        return "redirect:/cart";
    }

    @GetMapping("/remove")
    public String removeFromCart(@RequestParam("orderDetailId") Long laptopId,
            HttpSession session) {
        List<OrderDetail> cart = getSessionCart(session);
        cart.removeIf(item -> item.getLaptop().getId() == laptopId);
        session.setAttribute("cartItems", cart);
        updateCartCount(session, cart);
        return "redirect:/cart";
    }

    @PostMapping("/checkout")
    public String checkout(HttpSession session, RedirectAttributes redirectAttributes) {
        List<OrderDetail> cart = getSessionCart(session);
        User user = (User) session.getAttribute("user"); // Might be null, that's fine

        if (!cart.isEmpty()) {
            orderService.checkoutSessionCart(cart, user);
            cart.clear(); // Empty the cart
            session.setAttribute("cartItems", cart);
            updateCartCount(session, cart);
            redirectAttributes.addFlashAttribute("message", "Checkout successful!");
        }

        return "redirect:/cart";
    }
}
