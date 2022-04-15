package Models;

import Models.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-12T18:57:39")
@StaticMetamodel(Subcategory.class)
public class Subcategory_ { 

    public static volatile SingularAttribute<Subcategory, String> subcategoryName;
    public static volatile CollectionAttribute<Subcategory, Product> productCollection;
    public static volatile SingularAttribute<Subcategory, Integer> subcategoryId;

}