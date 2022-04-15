package Models;

import Models.Orders;
import Models.Product;
import Models.Staff;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-12T18:57:39")
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Integer> quantity;
    public static volatile SingularAttribute<OrderDetail, Product> productId;
    public static volatile SingularAttribute<OrderDetail, Orders> orderId;
    public static volatile SingularAttribute<OrderDetail, BigDecimal> subtotal;
    public static volatile SingularAttribute<OrderDetail, Integer> orderDetailId;
    public static volatile SingularAttribute<OrderDetail, Staff> staffId;

}