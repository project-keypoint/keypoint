package com.keypoint.dto;

import java.sql.Timestamp;

public class WorkRoDTO {

	private String roCode; // 작업지시코드
	private String cusCode; // 수주코드
	private String productCode; // 작업지시자
	private String roCount; // 라인코드
	private String shipSdate; // 납품예정일
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "WorkRoDTO [roCode=" + roCode + ", cusCode=" + cusCode + ", productCode=" + productCode + ", roCount="
				+ roCount + ", shipSdate=" + shipSdate + "]";
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
	

	
