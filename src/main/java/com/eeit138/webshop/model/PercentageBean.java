package com.eeit138.webshop.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="percentage_amount")
public class PercentageBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="percentageId")
	private Integer percentageId;
	
	@Column(name="percentageName")
	private String percentageName;
	
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@JsonFormat(pattern = "MM/dd/yyyy", timezone = "GMT+8")
	private Date percentageTime;
	
	@Column(name="percentageOnOff")
	private Integer percentageOnOff;
	
	@Transient
	private MultipartFile percentageImage;
	private Blob percentagePhoto;

	@Column(name="percentageMinimumCharge")
	private Integer percentageMinimumCharge;
	
	@Column(name="percentage")
	private Integer percentage;
	
	public PercentageBean() {
	}

	public Integer getPercentageId() {
		return percentageId;
	}


	public void setPercentageId(Integer percentageId) {
		this.percentageId = percentageId;
	}


	public String getPercentageName() {
		return percentageName;
	}


	public void setPercentageName(String percentageName) {
		this.percentageName = percentageName;
	}


	public Date getPercentageTime() {
		return percentageTime;
	}


	public void setPercentageTime(Date percentageTime) {
		this.percentageTime = percentageTime;
	}


	public Integer getPercentageOnOff() {
		return percentageOnOff;
	}


	public void setPercentageOnOff(Integer percentageOnOff) {
		this.percentageOnOff = percentageOnOff;
	}


	public MultipartFile getPercentageImage() {
		return percentageImage;
	}


	public void setPercentageImage(MultipartFile percentageImage) {
		this.percentageImage = percentageImage;
	}


	public Blob getPercentagePhoto() {
		return percentagePhoto;
	}


	public void setPercentagePhoto(Blob percentagePhoto) {
		this.percentagePhoto = percentagePhoto;
	}


	public Integer getPercentageMinimumCharge() {
		return percentageMinimumCharge;
	}


	public void setPercentageMinimumCharge(Integer percentageMinimumCharge) {
		this.percentageMinimumCharge = percentageMinimumCharge;
	}


	public Integer getPercentage() {
		return percentage;
	}


	public void setPercentage(Integer percentage) {
		this.percentage = percentage;
	}
	
}
