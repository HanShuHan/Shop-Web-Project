package com.eeit138.webshop.model;

import java.io.Serializable;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="CustomerReply")
public class CustomerBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name = "fK_account_acid")
	private Integer accountid;

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	private Date added;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	private Date replyadded;
	
	@Column(name="message")
	private String message;
	
	@Column(name="title")
	private String title;
	
	@Column(name="replymessage")
	private String replymessage;


	public CustomerBean() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	public String getReplymessage() {
		return replymessage;
	}

	public void setReplymessage(String replymessage) {
		this.replymessage = replymessage;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTitl() {
		return title;
	}

	public void setTitl(String titl) {
		this.title = titl;
	}

	@PrePersist // 當 Entity 狀態要變成 Persistent 的時候，做以下方法
	public void onCreate() {
		if(added == null) {
			added = new Date();
		}
		replyadded = new Date();
	}
	@PreUpdate
	public void onUpdate() {
		replyadded = new Date();
	}
	
	public Date getUpdatetime() {
		return replyadded;
	}

	public void setUpdatetime(Date updatetime) {
		this.replyadded = updatetime;
	}

	public Integer getAccountid() {
		return accountid;
	}

	public void setAccountid(Integer accountid) {
		this.accountid = accountid;
	}

	public Date getReplyadded() {
		return replyadded;
	}

	public void setReplyadded(Date replyadded) {
		this.replyadded = replyadded;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
