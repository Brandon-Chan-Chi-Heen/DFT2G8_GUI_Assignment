package Models;

import Models.OrderDetail;
import Models.Priviledge;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-12T18:57:39")
@StaticMetamodel(Staff.class)
public class Staff_ { 

    public static volatile SingularAttribute<Staff, String> password;
    public static volatile SingularAttribute<Staff, Character> gender;
    public static volatile CollectionAttribute<Staff, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Staff, Priviledge> privId;
    public static volatile SingularAttribute<Staff, Integer> staffId;
    public static volatile SingularAttribute<Staff, String> email;
    public static volatile SingularAttribute<Staff, String> username;
    public static volatile SingularAttribute<Staff, String> contactNo;

}