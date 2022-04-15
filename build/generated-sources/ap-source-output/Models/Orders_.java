package Models;

import Models.Customers;
import Models.OrderDetail;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-12T18:57:39")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, BigDecimal> totalAmount;
    public static volatile CollectionAttribute<Orders, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Orders, Integer> orderId;
    public static volatile SingularAttribute<Orders, Customers> customerId;
    public static volatile SingularAttribute<Orders, String> shippingAddress;
    public static volatile SingularAttribute<Orders, Date> deliveryDate;
    public static volatile SingularAttribute<Orders, Date> orderDate;
    public static volatile SingularAttribute<Orders, String> status;

}