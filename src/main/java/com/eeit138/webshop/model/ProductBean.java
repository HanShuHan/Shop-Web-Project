package com.eeit138.webshop.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Products")
public class ProductBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	private String name;
	private Integer price;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	private Date addedTime;
	
	private String detail1;
	private String detail2;
	
	private String type;
	@Transient
	private Integer categoryId;
	@ManyToOne()
	@JoinColumn(name = "FK_Categories_id")
	private Category category;
	
	@Transient
	private MultipartFile image1;
	private Blob coverImage1;
	
	@Transient
	private MultipartFile image2;
	private Blob coverImage2;
	
	@Transient
	private MultipartFile image3;
	private Blob coverImage3;
	
	@Transient
	private Integer productStatusId;
	@ManyToOne()
	@JoinColumn(name = "FK_ProductStatus_id")
	private ProductStatus productStatus;
	
	@OneToMany(mappedBy = "product")
	private Set<CartList> cartLists = new LinkedHashSet<CartList>();
	
	@OneToMany(mappedBy = "product")
	private Set<OrderDetail> OrderDetail = new LinkedHashSet<OrderDetail>();
	
	public ProductBean() {
	}

	@PrePersist
	public void addDate() {
		if(addedTime == null)
			addedTime = new Date();
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail1() {
		return detail1;
	}

	public void setDetail1(String detail1) {
		this.detail1 = detail1;
	}

	public String getDetail2() {
		return detail2;
	}

	public void setDetail2(String detail2) {
		this.detail2 = detail2;
	}

	public MultipartFile getImage1() {
		return image1;
	}

	public void setImage1(MultipartFile image1) {
		this.image1 = image1;
	}

	public Blob getCoverImage1() {
		return coverImage1;
	}

	public void setCoverImage1(Blob coverImage1) {
		this.coverImage1 = coverImage1;
	}

	public MultipartFile getImage2() {
		return image2;
	}

	public void setImage2(MultipartFile image2) {
		this.image2 = image2;
	}

	public Blob getCoverImage2() {
		return coverImage2;
	}

	public void setCoverImage2(Blob coverImage2) {
		this.coverImage2 = coverImage2;
	}

	public MultipartFile getImage3() {
		return image3;
	}

	public void setImage3(MultipartFile image3) {
		this.image3 = image3;
	}

	public Blob getCoverImage3() {
		return coverImage3;
	}

	public void setCoverImage3(Blob coverImage3) {
		this.coverImage3 = coverImage3;
	}

	public Integer getProductId() {
		return productId;
	}

	public Date getAddedTime() {
		return addedTime;
	}

	public void setAddedTime(Date addedTime) {
		this.addedTime = addedTime;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public ProductStatus getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(ProductStatus productStatus) {
		this.productStatus = productStatus;
	}

	public Integer getProductStatusId() {
		return productStatusId;
	}

	public void setProductStatusId(Integer productStatusId) {
		this.productStatusId = productStatusId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Set<CartList> getCartLists() {
		return cartLists;
	}

	public void setCartLists(Set<CartList> cartLists) {
		this.cartLists = cartLists;
	}
	
	public Set<OrderDetail> getOrderDetail() {
		return OrderDetail;
	}

	public void setOrderDetail(Set<OrderDetail> OrderDetail) {
		this.OrderDetail = OrderDetail;
	}

}
