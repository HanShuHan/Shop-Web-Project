package com.eeit138.webshop.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Receipts")
public class Receipt {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer productId1;
	private String productName1;
	private Integer productPrice1;
	private Integer productQuantity1;
	private Integer subtotal1;
	
	private Integer productId2;
	private String productName2;
	private Integer productPrice2;
	private Integer productQuantity2;
	private Integer subtotal2;
	
	private Integer productId3;
	private String productName3;
	private Integer productPrice3;
	private Integer productQuantity3;
	private Integer subtotal3;
	
	private Integer productId4;
	private String productName4;
	private Integer productPrice4;
	private Integer productQuantity4;
	private Integer subtotal4;
	
	private Integer productId5;
	private String productName5;
	private Integer productPrice5;
	private Integer productQuantity5;
	private Integer subtotal5;
	
	private Integer productId6;
	private String productName6;
	private Integer productPrice6;
	private Integer productQuantity6;
	private Integer subtotal6;
	
	private Integer productId7;
	private String productName7;
	private Integer productPrice7;
	private Integer productQuantity7;
	private Integer subtotal7;
	
	private Integer productId8;
	private String productName8;
	private Integer productPrice8;
	private Integer productQuantity8;
	private Integer subtotal8;
	
	private Integer productId9;
	private String productName9;
	private Integer productPrice9;
	private Integer productQuantity9;
	private Integer subtotal9;
	
	private Integer productId10;
	private String productName10;
	private Integer productPrice10;
	private Integer productQuantity10;
	private Integer subtotal10;
	
	private Integer totalQuantity;
	private String productsNameString;
	private Integer total;
	private boolean paidOrNot;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date paidTime;
	private String paidMethod;
	private String statusOfTheOrder;
	private String ecpayId;
	
//	@OneToMany(mappedBy = "productStatus")
//	private Set<ProductBean> prducts = new LinkedHashSet<ProductBean>();
	
	public Receipt() {
		// TODO Auto-generated constructor stub
	}

//	@PrePersist
//	public void addPaidTime() {
//		if(paidTime == null)
//			paidTime = new Date();
//	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductId1() {
		return productId1;
	}

	public void setProductId1(Integer productId1) {
		this.productId1 = productId1;
	}

	public String getProductName1() {
		return productName1;
	}

	public void setProductName1(String productName1) {
		this.productName1 = productName1;
	}

	public Integer getProductPrice1() {
		return productPrice1;
	}

	public void setProductPrice1(Integer productPrice1) {
		this.productPrice1 = productPrice1;
	}

	public Integer getProductQuantity1() {
		return productQuantity1;
	}

	public void setProductQuantity1(Integer productQuantity1) {
		this.productQuantity1 = productQuantity1;
	}

	public Integer getSubtotal1() {
		return subtotal1;
	}

	public void setSubtotal1(Integer subtotal1) {
		this.subtotal1 = subtotal1;
	}

	public Integer getProductId2() {
		return productId2;
	}

	public void setProductId2(Integer productId2) {
		this.productId2 = productId2;
	}

	public String getProductName2() {
		return productName2;
	}

	public void setProductName2(String productName2) {
		this.productName2 = productName2;
	}

	public Integer getProductPrice2() {
		return productPrice2;
	}

	public void setProductPrice2(Integer productPrice2) {
		this.productPrice2 = productPrice2;
	}

	public Integer getProductQuantity2() {
		return productQuantity2;
	}

	public void setProductQuantity2(Integer productQuantity2) {
		this.productQuantity2 = productQuantity2;
	}

	public Integer getSubtotal2() {
		return subtotal2;
	}

	public void setSubtotal2(Integer subtotal2) {
		this.subtotal2 = subtotal2;
	}

	public Integer getProductId3() {
		return productId3;
	}

	public void setProductId3(Integer productId3) {
		this.productId3 = productId3;
	}

	public String getProductName3() {
		return productName3;
	}

	public void setProductName3(String productName3) {
		this.productName3 = productName3;
	}

	public Integer getProductPrice3() {
		return productPrice3;
	}

	public void setProductPrice3(Integer productPrice3) {
		this.productPrice3 = productPrice3;
	}

	public Integer getProductQuantity3() {
		return productQuantity3;
	}

	public void setProductQuantity3(Integer productQuantity3) {
		this.productQuantity3 = productQuantity3;
	}

	public Integer getSubtotal3() {
		return subtotal3;
	}

	public void setSubtotal3(Integer subtotal3) {
		this.subtotal3 = subtotal3;
	}

	public Integer getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public String getProductsNameString() {
		return productsNameString;
	}

	public void setProductsNameString(String productsNameString) {
		this.productsNameString = productsNameString;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public boolean isPaidOrNot() {
		return paidOrNot;
	}

	public void setPaidOrNot(boolean paidOrNot) {
		this.paidOrNot = paidOrNot;
	}

	public Date getPaidTime() {
		return paidTime;
	}

	public void setPaidTime(Date paidTime) {
		this.paidTime = paidTime;
	}

	public String getPaidMethod() {
		return paidMethod;
	}

	public void setPaidMethod(String paidMethod) {
		this.paidMethod = paidMethod;
	}

	public String getStatusOfTheOrder() {
		return statusOfTheOrder;
	}

	public void setStatusOfTheOrder(String statusOfTheOrder) {
		this.statusOfTheOrder = statusOfTheOrder;
	}

	public String getEcpayId() {
		return ecpayId;
	}

	public void setEcpayId(String ecpayId) {
		this.ecpayId = ecpayId;
	}

	public Integer getProductId4() {
		return productId4;
	}

	public void setProductId4(Integer productId4) {
		this.productId4 = productId4;
	}

	public String getProductName4() {
		return productName4;
	}

	public void setProductName4(String productName4) {
		this.productName4 = productName4;
	}

	public Integer getProductPrice4() {
		return productPrice4;
	}

	public void setProductPrice4(Integer productPrice4) {
		this.productPrice4 = productPrice4;
	}

	public Integer getProductQuantity4() {
		return productQuantity4;
	}

	public void setProductQuantity4(Integer productQuantity4) {
		this.productQuantity4 = productQuantity4;
	}

	public Integer getSubtotal4() {
		return subtotal4;
	}

	public void setSubtotal4(Integer subtotal4) {
		this.subtotal4 = subtotal4;
	}

	public Integer getProductId5() {
		return productId5;
	}

	public void setProductId5(Integer productId5) {
		this.productId5 = productId5;
	}

	public String getProductName5() {
		return productName5;
	}

	public void setProductName5(String productName5) {
		this.productName5 = productName5;
	}

	public Integer getProductPrice5() {
		return productPrice5;
	}

	public void setProductPrice5(Integer productPrice5) {
		this.productPrice5 = productPrice5;
	}

	public Integer getProductQuantity5() {
		return productQuantity5;
	}

	public void setProductQuantity5(Integer productQuantity5) {
		this.productQuantity5 = productQuantity5;
	}

	public Integer getSubtotal5() {
		return subtotal5;
	}

	public void setSubtotal5(Integer subtotal5) {
		this.subtotal5 = subtotal5;
	}

	public Integer getProductId6() {
		return productId6;
	}

	public void setProductId6(Integer productId6) {
		this.productId6 = productId6;
	}

	public String getProductName6() {
		return productName6;
	}

	public void setProductName6(String productName6) {
		this.productName6 = productName6;
	}

	public Integer getProductPrice6() {
		return productPrice6;
	}

	public void setProductPrice6(Integer productPrice6) {
		this.productPrice6 = productPrice6;
	}

	public Integer getProductQuantity6() {
		return productQuantity6;
	}

	public void setProductQuantity6(Integer productQuantity6) {
		this.productQuantity6 = productQuantity6;
	}

	public Integer getSubtotal6() {
		return subtotal6;
	}

	public void setSubtotal6(Integer subtotal6) {
		this.subtotal6 = subtotal6;
	}

	public Integer getProductId7() {
		return productId7;
	}

	public void setProductId7(Integer productId7) {
		this.productId7 = productId7;
	}

	public String getProductName7() {
		return productName7;
	}

	public void setProductName7(String productName7) {
		this.productName7 = productName7;
	}

	public Integer getProductPrice7() {
		return productPrice7;
	}

	public void setProductPrice7(Integer productPrice7) {
		this.productPrice7 = productPrice7;
	}

	public Integer getProductQuantity7() {
		return productQuantity7;
	}

	public void setProductQuantity7(Integer productQuantity7) {
		this.productQuantity7 = productQuantity7;
	}

	public Integer getSubtotal7() {
		return subtotal7;
	}

	public void setSubtotal7(Integer subtotal7) {
		this.subtotal7 = subtotal7;
	}

	public Integer getProductId8() {
		return productId8;
	}

	public void setProductId8(Integer productId8) {
		this.productId8 = productId8;
	}

	public String getProductName8() {
		return productName8;
	}

	public void setProductName8(String productName8) {
		this.productName8 = productName8;
	}

	public Integer getProductPrice8() {
		return productPrice8;
	}

	public void setProductPrice8(Integer productPrice8) {
		this.productPrice8 = productPrice8;
	}

	public Integer getProductQuantity8() {
		return productQuantity8;
	}

	public void setProductQuantity8(Integer productQuantity8) {
		this.productQuantity8 = productQuantity8;
	}

	public Integer getSubtotal8() {
		return subtotal8;
	}

	public void setSubtotal8(Integer subtotal8) {
		this.subtotal8 = subtotal8;
	}

	public Integer getProductId9() {
		return productId9;
	}

	public void setProductId9(Integer productId9) {
		this.productId9 = productId9;
	}

	public String getProductName9() {
		return productName9;
	}

	public void setProductName9(String productName9) {
		this.productName9 = productName9;
	}

	public Integer getProductPrice9() {
		return productPrice9;
	}

	public void setProductPrice9(Integer productPrice9) {
		this.productPrice9 = productPrice9;
	}

	public Integer getProductQuantity9() {
		return productQuantity9;
	}

	public void setProductQuantity9(Integer productQuantity9) {
		this.productQuantity9 = productQuantity9;
	}

	public Integer getSubtotal9() {
		return subtotal9;
	}

	public void setSubtotal9(Integer subtotal9) {
		this.subtotal9 = subtotal9;
	}

	public Integer getProductId10() {
		return productId10;
	}

	public void setProductId10(Integer productId10) {
		this.productId10 = productId10;
	}

	public String getProductName10() {
		return productName10;
	}

	public void setProductName10(String productName10) {
		this.productName10 = productName10;
	}

	public Integer getProductPrice10() {
		return productPrice10;
	}

	public void setProductPrice10(Integer productPrice10) {
		this.productPrice10 = productPrice10;
	}

	public Integer getProductQuantity10() {
		return productQuantity10;
	}

	public void setProductQuantity10(Integer productQuantity10) {
		this.productQuantity10 = productQuantity10;
	}

	public Integer getSubtotal10() {
		return subtotal10;
	}

	public void setSubtotal10(Integer subtotal10) {
		this.subtotal10 = subtotal10;
	}

}
