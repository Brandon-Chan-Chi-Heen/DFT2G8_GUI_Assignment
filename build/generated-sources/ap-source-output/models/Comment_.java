package models;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import models.Customers;
import models.Product;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-10T00:01:52")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, Product> productId;
    public static volatile SingularAttribute<Comment, Integer> rating;
    public static volatile SingularAttribute<Comment, Customers> customerId;
    public static volatile SingularAttribute<Comment, Integer> commentId;
    public static volatile SingularAttribute<Comment, String> content;

}