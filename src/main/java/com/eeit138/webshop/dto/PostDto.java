package com.eeit138.webshop.dto;

import java.io.Serializable;
import java.util.Date;

public class PostDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;	
	private String posttitle;
	private String postcontent;
	private Date postdate;

	private Integer viewcount;
	
	
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
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public Integer getViewcount() {
		return viewcount;
	}
	public void setViewcount(Integer viewcount) {
		this.viewcount = viewcount;
	}

	
}
