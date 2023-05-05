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

//存取資料的java物件
@Entity
@Table(name = "post_blog") // Table的name對映到資料庫中的資料表名稱
public class Post implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id // 是此資料表的Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	
	@Column(name = "posttitle") // name: 對應到Table的欄位中的欄位名稱
	private String posttitle;

	
	@Column(name = "postcontent")
	private String postcontent;

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "added")
	private Date added;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated")
	private Date updated;
	
	private String type;

	public Post() {
	}

	@PrePersist
	public void addDate() {
		if(added == null)
			added = new Date();
		updated = new Date();
	}
	
	@PreUpdate
	public void updateDate() {
		updated = new Date();
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPosttitle() {
		return posttitle;
	}

	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}

	public String getPostcontent() {
		return postcontent;
	}

	public void setPostcontent(String postcontent) {
		this.postcontent = postcontent;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

}
