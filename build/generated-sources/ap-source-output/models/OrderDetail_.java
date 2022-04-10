package models;

import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import models.Orders;
import models.Product;
import models.Staff;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-10T00:01:52")
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Integer> quantity;
    public static volatile SingularAttribute<OrderDetail, Product> productId;
    public static volatile SingularAttribute<OrderDetail, Orders> orderId;
    public static volatile SingularAttribute<OrderDetail, BigDecimal> subtotal;
    public static volatile SingularAttribute<OrderDetail, Integer> orderDetailId;
    public static volatile SingularAttribute<OrderDetail, Staff> staffId;

}