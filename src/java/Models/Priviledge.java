
package Models;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "PRIVILEDGE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Priviledge.findAll", query = "SELECT p FROM Priviledge p")
    , @NamedQuery(name = "Priviledge.findByPrivId", query = "SELECT p FROM Priviledge p WHERE p.privId = :privId")
    , @NamedQuery(name = "Priviledge.findByName", query = "SELECT p FROM Priviledge p WHERE p.name = :name")
    , @NamedQuery(name = "Priviledge.findByManageStaff", query = "SELECT p FROM Priviledge p WHERE p.manageStaff = :manageStaff")
    , @NamedQuery(name = "Priviledge.findByManageProduct", query = "SELECT p FROM Priviledge p WHERE p.manageProduct = :manageProduct")
    , @NamedQuery(name = "Priviledge.findByManageCustomer", query = "SELECT p FROM Priviledge p WHERE p.manageCustomer = :manageCustomer")
    , @NamedQuery(name = "Priviledge.findByRaisePriv", query = "SELECT p FROM Priviledge p WHERE p.raisePriv = :raisePriv")})
public class Priviledge implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PRIV_ID")
    private Integer privId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "NAME")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MANAGE_STAFF")
    private Boolean manageStaff;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MANAGE_PRODUCT")
    private Boolean manageProduct;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MANAGE_CUSTOMER")
    private Boolean manageCustomer;
    @Basic(optional = false)
    @NotNull
    @Column(name = "RAISE_PRIV")
    private Boolean raisePriv;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "privId")
    private Collection<Staff> staffCollection;

    public Priviledge() {
    }

    public Priviledge(Integer privId) {
        this.privId = privId;
    }

    public Priviledge(Integer privId, String name, Boolean manageStaff, Boolean manageProduct, Boolean manageCustomer, Boolean raisePriv) {
        this.privId = privId;
        this.name = name;
        this.manageStaff = manageStaff;
        this.manageProduct = manageProduct;
        this.manageCustomer = manageCustomer;
        this.raisePriv = raisePriv;
    }

    public Integer getPrivId() {
        return privId;
    }

    public void setPrivId(Integer privId) {
        this.privId = privId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getManageStaff() {
        return manageStaff;
    }

    public void setManageStaff(Boolean manageStaff) {
        this.manageStaff = manageStaff;
    }

    public Boolean getManageProduct() {
        return manageProduct;
    }

    public void setManageProduct(Boolean manageProduct) {
        this.manageProduct = manageProduct;
    }

    public Boolean getManageCustomer() {
        return manageCustomer;
    }

    public void setManageCustomer(Boolean manageCustomer) {
        this.manageCustomer = manageCustomer;
    }

    public Boolean getRaisePriv() {
        return raisePriv;
    }

    public void setRaisePriv(Boolean raisePriv) {
        this.raisePriv = raisePriv;
    }

    @XmlTransient
    public Collection<Staff> getStaffCollection() {
        return staffCollection;
    }

    public void setStaffCollection(Collection<Staff> staffCollection) {
        this.staffCollection = staffCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (privId != null ? privId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Priviledge)) {
            return false;
        }
        Priviledge other = (Priviledge) object;
        if ((this.privId == null && other.privId != null) || (this.privId != null && !this.privId.equals(other.privId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Models.Priviledge[ privId=" + privId + " ]";
    }

}
