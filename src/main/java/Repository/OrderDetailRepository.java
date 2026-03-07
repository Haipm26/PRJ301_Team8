package Repository;

import Model.OrderDetail;
import Model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Pham Minh Hai
 */
@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    List<OrderDetail> findByUser(User user);

    List<OrderDetail> findByUserAndOrderIsNull(User user); // Cart items (not yet ordered)
}
