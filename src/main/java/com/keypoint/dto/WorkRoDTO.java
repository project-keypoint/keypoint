package com.keypoint.dto;

import java.sql.Timestamp;

public class WorkRoDTO {

	private String roCode; // 작업지시코드
	private String cusCode; // 업체코드
	private String cusName;
	private String productCode; // 상품코드
	private String productName; 
	private String roCount; // 라인코드
	private String shipSdate; // 납품예정일
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "WorkRoDTO [roCode=" + roCode + ", cusCode=" + cusCode + ", cusName=" + cusName + ", productCode="
				+ productCode + ", productName=" + productName + ", roCount=" + roCount + ", shipSdate=" + shipSdate
				+ "]";
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getRoCode() {
		return roCode;
	}
	public void setRoCode(String roCode) {
		this.roCode = roCode;
	}
	public String getCusCode() {
		return cusCode;
	}
	public void setCusCode(String cusCode) {
		this.cusCode = cusCode;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getRoCount() {
		return roCount;
	}
	public void setRoCount(String roCount) {
		this.roCount = roCount;
	}
	public String getShipSdate() {
		return shipSdate;
	}
	public void setShipSdate(String shipSdate) {
		this.shipSdate = shipSdate;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	

	
