package com.eeit138.webshop.util;

public class PageUtil {

	public PageUtil() {
	}
	
	public int makePages(int totalItems, int eachPage) {
		
		int pages;
		
		if(totalItems % eachPage != 0)
			pages= totalItems / eachPage + 1;
		else
			pages= totalItems / eachPage;
		
		return pages;
	}
}
