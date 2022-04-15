package Models;

import Models.Comment;
import Models.Orders;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-12T18:57:39")
@StaticMetamodel(Customers.class)
public class Customers_ { 

    public static volatile SingularAttribute<Customers, String> password;
    public static volatile CollectionAttribute<Customers, Comment> commentCollection;
    public static volatile SingularAttribute<Customers, Integer> customerId;
    public static volatile SingularAttribute<Customers, String> fullname;
    public static volatile CollectionAttribute<Customers, Orders> ordersCollection;
    public static volatile SingularAttribute<Customers, String> email;
    public static volatile SingularAttribute<Customers, String> username;

}