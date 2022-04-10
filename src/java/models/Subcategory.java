/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package models;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * 
 */
@Entity
@Table(name = "SUBCATEGORY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subcategory.findAll", query = "SELECT s FROM Subcategory s"),
    @NamedQuery(name = "Subcategory.findBySubcategoryId", query = "SELECT s FROM Subcategory s WHERE s.subcategoryId = :subcategoryId"),
    @NamedQuery(name = "Subcategory.findBySubcategoryName", query = "SELECT s FROM Subcategory s WHERE s.subcategoryName = :subcategoryName")})
public class Subcategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "SUBCATEGORY_ID")
    private Integer subcategoryId;
    @Size(max = 50)
    @Column(name = "SUBCATEGORY_NAME")
    private String subcategoryName;
    @OneToMany(mappedBy = "subcategoryId")
    private Collection<Product> productCollection;

    public Subcategory() {
    }

    public Subcategory(Integer subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public Integer getSubcategoryId() {
        return subcategoryId;
    }

    public void setSubcategoryId(Integer subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public String getSubcategoryName() {
        return subcategoryName;
    }

    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    @XmlTransient
    public Collection<Product> getProductCollection() {
        return productCollection;
    }

    public void setProductCollection(Collection<Product> productCollection) {
        this.productCollection = productCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (subcategoryId != null ? subcategoryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Subcategory)) {
            return false;
        }
        Subcategory other = (Subcategory) object;
        if ((this.subcategoryId == null && other.subcategoryId != null) || (this.subcategoryId != null && !this.subcategoryId.equals(other.subcategoryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Subcategory[ subcategoryId=" + subcategoryId + " ]";
    }

}
