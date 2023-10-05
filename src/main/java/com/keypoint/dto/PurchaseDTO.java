package com.keypoint.dto;

import java.sql.Timestamp;

public class PurchaseDTO {

	private String poCode;
    private String materialCode;
    private String materialName;
    private int materialPrice;
    private int poCount;
    private int poPrice;
    private String poDate;
    private String payDate;
    private String cusName;
    private String poOwner;
    private String poStatus;
    
    
	public String getPoCode() {
		return poCode;
	}
	public void setPoCode(String poCode) {
		this.poCode = poCode;
	}
	public String getMaterialCode() {
		return materialCode;
	}
	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public int getMaterialPrice() {
		return materialPrice;
	}
	public void setMaterialPrice(int materialPrice) {
		this.materialPrice = materialPrice;
	}
	public int getPoCount() {
		return poCount;
	}
	public void setPoCount(int poCount) {
		this.poCount = poCount;
	}
	public int getPoPrice() {
		return poPrice;
	}
	public void setPoPrice(int poPrice) {
		this.poPrice = poPrice;
	}
	public String getPoDate() {
		return poDate;
	}
	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getPoOwner() {
		return poOwner;
	}
	public void setPoOwner(String poOwner) {
		this.poOwner = poOwner;
	}
	public String getPoStatus() {
		return poStatus;
	}
	public void setPoStatus(String poStatus) {
		this.poStatus = poStatus;
	}
	
	@Override
	public String toString() {
		return "PurchaseDTO [poCode=" + poCode + ", materialCode=" + materialCode + ", materialName=" + materialName
				+ ", materialPrice=" + materialPrice + ", poCount=" + poCount + ", poPrice=" + poPrice + ", poDate="
				+ poDate + ", payDate=" + payDate + ", cusName=" + cusName + ", poOwner=" + poOwner + ", poStatus="
				+ poStatus + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
