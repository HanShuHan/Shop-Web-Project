package com.eeit138.webshop.service;


import java.util.Hashtable;

import org.springframework.stereotype.Service;

import ecpay.logistics.integration.AllInOne;
import ecpay.logistics.integration.domain.CreateCVSObj;
import ecpay.logistics.integration.domain.ExpressMapObj;

@Service
public class LogisticsService {
	
	public static AllInOne all;
	
	public  void initial(){
		all = new AllInOne();
	}
	
	public  boolean cmprChkMacValue(){
		Hashtable<String, String> dict = new Hashtable<String, String>();
		dict.put("MerchantID", "2000132");
		dict.put("CheckMacValue", "50BE3989953C1734E32DD18EB23698241E035F9CBCAC74371CCCF09E0E15BD61");
		return all.compareCheckMacValue(dict);
	}
	
	public String postExpressMap(String x, String y){
		ExpressMapObj obj = new ExpressMapObj();
		obj.setLogisticsSubType(x);
		obj.setIsCollection("N");
		obj.setServerReplyURL("http://localhost:8080/A-Jen/catchship");
		obj.setExtraData(y);
		return all.expressMap(obj);
	}
	
	public String postCreateCVS(String MerchantTradeNo, 
			String MerchantTradeDate,
			String LogisticsSubType,
			String ReceiverStoreID,
			String ReceiverCellPhone,
			String GoodsAmount,
			String SenderName
			){
		CreateCVSObj obj = new CreateCVSObj();
		obj.setMerchantTradeNo(MerchantTradeNo);
		obj.setMerchantTradeDate(MerchantTradeDate);
		obj.setLogisticsSubType(LogisticsSubType);
		obj.setReceiverStoreID(ReceiverStoreID);
		obj.setReceiverCellPhone(ReceiverCellPhone);
		obj.setGoodsAmount(GoodsAmount);
		obj.setSenderName(SenderName);
		obj.setReceiverName(SenderName);
		obj.setServerReplyURL("http://localhost:8080/A-Jen/catchend");
		obj.setClientReplyURL("http://localhost:8080/A-Jen/catchend");
		return all.create(obj);
	}

}
