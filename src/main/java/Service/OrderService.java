package Service;

import Model.Laptop;
import Model.Order;
import Model.OrderDetail;
import Model.User;
import Repository.OrderRepository;
import Repository.OrderDetailRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Pham Minh Hai
 */
@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<OrderDetail> getCartItems(User user) {
        return orderDetailRepository.findByUserAndOrderIsNull(user);
    }

    public void addToCart(User user, Laptop laptop, int quantity) {
        // Check if already in cart
        List<OrderDetail> cartItems = getCartItems(user);
        for (OrderDetail item : cartItems) {
            if (item.getLaptop().getId() == laptop.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                item.setPrice(item.getLaptop().getPrice() * item.getQuantity());
                orderDetailRepository.save(item);
                return;
            }
        }

        OrderDetail newItem = new OrderDetail();
        newItem.setUser(user);
        newItem.setLaptop(laptop);
        newItem.setQuantity(quantity);
        newItem.setPrice(laptop.getPrice() * quantity);
        orderDetailRepository.save(newItem);
    }

    public void updateCartItem(Long orderDetailId, int newQuantity) {
        Optional<OrderDetail> itemOpt = orderDetailRepository.findById(orderDetailId);
        if (itemOpt.isPresent()) {
            OrderDetail item = itemOpt.get();
            item.setQuantity(newQuantity);
            item.setPrice(item.getLaptop().getPrice() * newQuantity);
            orderDetailRepository.save(item);
        }
    }

    public void removeFromCart(Long orderDetailId) {
        orderDetailRepository.deleteById(orderDetailId);
    }

    public Order checkout(User user) {
        List<OrderDetail> cartItems = getCartItems(user);
        if (cartItems.isEmpty()) {
            return null; // Nothing to checkout
        }

        double total = 0;
        for (OrderDetail item : cartItems) {
            total += item.getPrice();
        }

        Order order = new Order();
        order.setOrderDate(new Date());
        order.setStatus("COMPLETED"); // Or "PENDING"
        order.setTotalAmount(total);
        order = orderRepository.save(order);

        for (OrderDetail item : cartItems) {
            item.setOrder(order);
            orderDetailRepository.save(item);
        }

        return order;
    }
}
