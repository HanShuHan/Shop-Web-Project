package com.eeit138.webshop.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="coupon_amount")
public class CouponBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="couponId")
	private Integer couponId;
	
	@Column(name="couponName")
	private String couponName;
	
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@JsonFormat(pattern = "MM/dd/yyyy", timezone = "GMT+8")
	private Date couponTime;
	
	@Column(name="couponOnOff")
	private Integer couponOnOff;
	
	@Column(name="couponMinimumCharge")
	private Integer couponMinimumCharge;
	
	@Column(name="coupon")
	private Integer coupon;
	
	@Column(name="couponShow")
	private Integer couponShow;
	
	public CouponBean() {
	}

	public Integer getCouponShow() {
		return couponShow;
	}


	public void setCouponShow(Integer couponShow) {
		this.couponShow = couponShow;
	}


	public Integer getCouponId() {
		return couponId;
	}


	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}


	public String getCouponName() {
		return couponName;
	}


	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}


	public Date getCouponTime() {
		return couponTime;
	}


	public void setCouponTime(Date couponTime) {
		this.couponTime = couponTime;
	}


	public Integer getCouponOnOff() {
		return couponOnOff;
	}


	public void setCouponOnOff(Integer couponOnOff) {
		this.couponOnOff = couponOnOff;
	}


	public Integer getCouponMinimumCharge() {
		return couponMinimumCharge;
	}


	public void setCouponMinimumCharge(Integer couponMinimumCharge) {
		this.couponMinimumCharge = couponMinimumCharge;
	}


	public Integer getCoupon() {
		return coupon;
	}


	public void setCoupon(Integer coupon) {
		this.coupon = coupon;
	}

}
