package com.eeit138.webshop.model;


import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Product_Status")
public class ProductStatus {

	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String status;
	@OneToMany(mappedBy = "productStatus")
	private Set<ProductBean> prducts = new LinkedHashSet<ProductBean>();
	
	public ProductStatus() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
