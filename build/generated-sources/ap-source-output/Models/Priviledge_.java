package Models;

import Models.Staff;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-12T18:57:39")
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