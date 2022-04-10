package models;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import models.Product;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-10T00:01:52")
@StaticMetamodel(Subcategory.class)
public class Subcategory_ { 

    public static volatile SingularAttribute<Subcategory, String> subcategoryName;
    public static volatile CollectionAttribute<Subcategory, Product> productCollection;
    public static volatile SingularAttribute<Subcategory, Integer> subcategoryId;

}