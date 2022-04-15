package Models;

import Models.Category;
import Models.Comment;
import Models.OrderDetail;
import Models.Subcategory;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-12T18:57:39")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile ListAttribute<Product, Comment> commentList;
    public static volatile SingularAttribute<Product, String> image;
    public static volatile SingularAttribute<Product, Integer> sold;
    public static volatile ListAttribute<Product, OrderDetail> orderDetailList;
    public static volatile SingularAttribute<Product, Integer> quantity;
    public static volatile SingularAttribute<Product, Integer> productId;
    public static volatile SingularAttribute<Product, BigDecimal> price;
    public static volatile SingularAttribute<Product, BigDecimal> averageRating;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Subcategory> subcategoryId;
    public static volatile SingularAttribute<Product, String> productName;
    public static volatile SingularAttribute<Product, Category> categoryId;

}