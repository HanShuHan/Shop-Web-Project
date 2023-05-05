package com.eeit138.webshop.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ProductDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@JsonProperty(value = "productId")
	private Integer id;
	@JsonProperty(value = "product_type")
	private String type;
	@JsonProperty(value = "userId")
	private Integer userId;
	@JsonProperty(value = "product_status_id")
	private Integer productStatusId;
	
	public ProductDto() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProductStatusId() {
		return productStatusId;
	}

	public void setProductStatusId(Integer productStatusId) {
		this.productStatusId = productStatusId;
	}

}
