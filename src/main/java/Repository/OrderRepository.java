package Repository;

import Model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Pham Minh Hai
 */
@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}
