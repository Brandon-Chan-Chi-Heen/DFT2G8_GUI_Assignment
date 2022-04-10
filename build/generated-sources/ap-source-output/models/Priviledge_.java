package models;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import models.Staff;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-10T00:01:52")
@StaticMetamodel(Priviledge.class)
public class Priviledge_ { 

    public static volatile SingularAttribute<Priviledge, Boolean> raisePriv;
    public static volatile SingularAttribute<Priviledge, String> name;
    public static volatile SingularAttribute<Priviledge, Boolean> manageCustomer;
    public static volatile CollectionAttribute<Priviledge, Staff> staffCollection;
    public static volatile SingularAttribute<Priviledge, Boolean> manageStaff;
    public static volatile SingularAttribute<Priviledge, Integer> privId;
    public static volatile SingularAttribute<Priviledge, Boolean> manageProduct;

}