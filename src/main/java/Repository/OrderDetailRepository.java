package Repository;

import Model.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Pham Minh Hai
 */
@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}
