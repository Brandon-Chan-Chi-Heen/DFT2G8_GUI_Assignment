package models;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import models.OrderDetail;
import models.Priviledge;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-10T00:01:52")
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