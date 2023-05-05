package com.eeit138.webshop.dto;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CartListDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@JsonProperty(value = "cart_list_id")
	private Integer id;
	
	@JsonProperty(value = "quantity")
	private Integer quantity;
	
	@JsonProperty(value = "user_id")
	private Integer userId;
	
	public CartListDto() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
