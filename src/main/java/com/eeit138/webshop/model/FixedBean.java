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
@Table(name="fixed_amount")
public class FixedBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="fixedId")
	private Integer fixedId;
	
	@Column(name="fixedName")
	private String fixedName;
	
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@JsonFormat(pattern = "MM/dd/yyyy", timezone = "GMT+8")
	private Date fixedTime;
	
	@Column(name="fixedOnOff")
	private Integer fixedOnOff;
	
	@Transient
	private MultipartFile fixedImage;
	private Blob fixedPhoto;

	@Column(name="fixedMinimumCharge")
	private Integer fixedMinimumCharge;
	
	@Column(name="fixed")
	private Integer fixed;
	
	
	public FixedBean() {
	}


	public Integer getFixedId() {
		return fixedId;
	}


	public void setFixedId(Integer fixedId) {
		this.fixedId = fixedId;
	}


	public String getFixedName() {
		return fixedName;
	}


	public void setFixedName(String fixedName) {
		this.fixedName = fixedName;
	}


	public Date getFixedTime() {
		return fixedTime;
	}


	public void setFixedTime(Date fixedTime) {
		this.fixedTime = fixedTime;
	}


	public Integer getFixedOnOff() {
		return fixedOnOff;
	}


	public void setFixedOnOff(Integer fixedOnOff) {
		this.fixedOnOff = fixedOnOff;
	}


	public MultipartFile getFixedImage() {
		return fixedImage;
	}


	public void setFixedImage(MultipartFile fixedImage) {
		this.fixedImage = fixedImage;
	}


	public Blob getFixedPhoto() {
		return fixedPhoto;
	}


	public void setFixedPhoto(Blob fixedPhoto) {
		this.fixedPhoto = fixedPhoto;
	}


	public Integer getFixedMinimumCharge() {
		return fixedMinimumCharge;
	}


	public void setFixedMinimumCharge(Integer fixedMinimumCharge) {
		this.fixedMinimumCharge = fixedMinimumCharge;
	}


	public Integer getFixed() {
		return fixed;
	}


	public void setFixed(Integer fixed) {
		this.fixed = fixed;
	}

	

	
}
