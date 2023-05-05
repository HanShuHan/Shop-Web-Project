package com.eeit138.webshop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "orderlist")
public class OrderBean implements Serializable {
	
	private static final long serialVersionUID = 1L; 
	
	@Id
	private String merchantTradeNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "MerchantTradeDate")
	private Date merchantTradeDate;
	
	@Column(name = "TotalAmount")
	private Integer totalAmount;
	
	@Column(name = "ItemName")
	private String itemName;
	
	@Column(name = "TradeDesc")
	private String tradeDesc;
	
	@Column(name = "RtnCode")
	private int rtnCode;
	
	@Column(name = "TradeNo")
	private String tradeNo;
	
	@Column(name = "PaymentType")
	private String paymentType;
	
	@Column(name = "accountId")
	private Integer accountId;
	
	@Column(name = "LogisticsSubType")
	private String logisticsSubType;
	
	@Column(name = "CVSStoreID")
	private String cVSStoreID;
	
	@Column(name = "CVSStoreName")
	private String cVSStoreName;
	
	@Column(name = "CVSAddress")
	private String cVSAddress;
	
	@Column(name = "RtnMsgL")
	private String rtnMsgL;
	
	@Column(name = "AllPayLogisticsID")
	private String allPayLogisticsID;
	
	public OrderBean() {
	}

	public String getMerchantTradeNo() {
		return merchantTradeNo;
	}

	public void setMerchantTradeNo(String merchantTradeNo) {
		this.merchantTradeNo = merchantTradeNo;
	}

	public Date getMerchantTradeDate() {
		return merchantTradeDate;
	}

	public void setMerchantTradeDate(Date merchantTradeDate) {
		this.merchantTradeDate = merchantTradeDate;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getTradeDesc() {
		return tradeDesc;
	}

	public void setTradeDesc(String tradeDesc) {
		this.tradeDesc = tradeDesc;
	}

	public int getRtnCode() {
		return rtnCode;
	}

	public void setRtnCode(int rtnCode) {
		this.rtnCode = rtnCode;
	}

	public String getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public String getLogisticsSubType() {
		return logisticsSubType;
	}

	public void setLogisticsSubType(String logisticsSubType) {
		this.logisticsSubType = logisticsSubType;
	}

	public String getcVSStoreID() {
		return cVSStoreID;
	}

	public void setcVSStoreID(String cVSStoreID) {
		this.cVSStoreID = cVSStoreID;
	}

	public String getcVSStoreName() {
		return cVSStoreName;
	}

	public void setcVSStoreName(String cVSStoreName) {
		this.cVSStoreName = cVSStoreName;
	}

	public String getcVSAddress() {
		return cVSAddress;
	}

	public void setcVSAddress(String cVSAddress) {
		this.cVSAddress = cVSAddress;
	}

	public String getRtnMsgL() {
		return rtnMsgL;
	}

	public void setRtnMsgL(String rtnMsgL) {
		this.rtnMsgL = rtnMsgL;
	}

	public String getAllPayLogisticsID() {
		return allPayLogisticsID;
	}

	public void setAllPayLogisticsID(String allPayLogisticsID) {
		this.allPayLogisticsID = allPayLogisticsID;
	}
}