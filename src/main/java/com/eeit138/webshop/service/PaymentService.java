package com.eeit138.webshop.service;


import java.util.Hashtable;

import org.springframework.stereotype.Service;
import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
public class PaymentService {
	
	public static AllInOne all;
	
	public void initial(){
		all = new AllInOne("");
	}
	
	public boolean cmprChkMacValue(){
		Hashtable<String, String> dict = new Hashtable<String, String>();
		dict.put("MerchantID", "2000214");
		dict.put("CheckMacValue", "50BE3989953C1734E32DD18EB23698241E035F9CBCAC74371CCCF09E0E15BD61");
		return all.compareCheckMacValue(dict);
	}
	
	
	public String genAioCheckOutALL(String MerchantTradeNo,String TradeDate,String TotalAmount,String ItemName){
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo(MerchantTradeNo);
		obj.setMerchantTradeDate(TradeDate);
		obj.setTotalAmount(TotalAmount);
		obj.setTradeDesc("阿珍體育用品");
		obj.setItemName(ItemName);
		obj.setReturnURL("http://localhost:8080/A-Jen/catchpay");
		obj.setOrderResultURL("http://localhost:8080/A-Jen/catchpay");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

}
