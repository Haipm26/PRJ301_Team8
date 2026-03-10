package Service;

import Model.Order;
import Model.OrderDetail;
import Model.User;
import Repository.OrderRepository;
import Repository.OrderDetailRepository;
import java.util.Date;
import java.util.List;
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

    public Order checkoutSessionCart(List<OrderDetail> sessionCart, User user) {
        if (sessionCart == null || sessionCart.isEmpty()) {
            return null;
        }

        double total = 0;
        for (OrderDetail item : sessionCart) {
            total += item.getPrice();
        }

        Order order = new Order();
        order.setOrderDate(new Date());
        order.setStatus("COMPLETED");
        order.setTotalAmount(total);
        order.setUser(user);
        order = orderRepository.save(order);

        for (OrderDetail item : sessionCart) {
            item.setId(null);
            item.setOrder(order);
            orderDetailRepository.save(item);
        }

        return order;
    }
}
